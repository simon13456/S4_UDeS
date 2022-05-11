---------------------------------------------------------------------------------------------
-- Universitï¿½ de Sherbrooke - Dï¿½partement de GEGI
-- Version         : 3.0
-- Nomenclature    : GRAMS
-- Date            : 21 Avril 2020
-- Auteur(s)       : Rï¿½jean Fontaine, Daniel Dalle, Marc-Andrï¿½ Tï¿½trault
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: Pmod8LD PmodSSD
--
-- Outils          : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit utilitaire pour le laboratoire et la problï¿½matique de logique combinatoire
--
---------------------------------------------------------------------------------------------
-- ï¿½ faire :
-- Voir le guide de l'APP
--    Insï¿½rer les modules additionneurs ("components" et "instances")
--
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AppCombi_top is
  port ( 
          i_btn       : in    std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
          i_sw        : in    std_logic_vector (3 downto 0); -- Interrupteurs de la carte Zybo
          sysclk      : in    std_logic;                     -- horloge systeme
          i_ADC_th    : in    std_logic_vector (11 downto 0);-- signal de la carte thermométrique                    
          o_SSD       : out   std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
          o_led       : out   std_logic_vector (3 downto 0); -- vers DELs de la carte Zybo
          o_led6_r    : out   std_logic;                     -- vers DEL rouge de la carte Zybo
          o_pmodled   : out   std_logic_vector (7 downto 0)  -- vers connecteur pmod 8 DELs
          );
end AppCombi_top;
 
architecture BEHAVIORAL of AppCombi_top is

   constant nbreboutons     : integer := 4;    -- Carte Zybo Z7
   constant freq_sys_MHz    : integer := 125;  -- 125 MHz 
   
   signal d_s_1Hz           : std_logic;
   signal clk_5MHz          : std_logic;
   --
   signal d_opa             : std_logic_vector (3 downto 0):= "0000";   -- operande A
   signal d_opb             : std_logic_vector (3 downto 0):= "0000";   -- operande B
   signal d_cin             : std_logic := '0';                         -- retenue entree
   signal d_sum             : std_logic_vector (3 downto 0):= "0000";   -- somme
   signal d_cout            : std_logic := '0';                         -- retenue sortie
   --
   signal d_AFF0            : std_logic_vector (3 downto 0):= "0000";
   signal d_AFF1            : std_logic_vector (3 downto 0):= "0000";
   --
   signal d_S1              : std_logic;
   signal d_erreur          : std_logic;
   signal d_Parite          : std_logic;
   signal d_ADCbin          : std_logic_vector (3 downto 0);
   signal d_Dizaines        : std_logic_vector (3 downto 0);
   signal d_Unites_ns       : std_logic_vector (3 downto 0);
   signal d_Code_signe      : std_logic_vector (3 downto 0);
   signal d_Unites_s        : std_logic_vector (3 downto 0);
   signal d_A23             : std_logic_vector (2 downto 0);
   signal d_decoded3_8      : std_logic_vector (7 downto 0);
   
   --
    component synchro_module_v2 is
        generic (const_CLK_syst_MHz: integer := freq_sys_MHz);
        Port ( 
             clkm           : in  STD_LOGIC;  -- Entrï¿½e  horloge maitre
             o_CLK_5MHz     : out STD_LOGIC;  -- horloge divise utilise pour le circuit             
             o_S_1Hz        : out STD_LOGIC  -- Signal temoin 1 Hz
            );
        end component;  
    
    component septSegments_Top is
        Port (   clk        : in  STD_LOGIC;                      -- horloge systeme, typique 100 MHz (preciser par le constante)
             i_AFF0         : in  STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0
             i_AFF1         : in  STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0     
             o_AFFSSD_Sim   : out string(1 to 2);
             o_AFFSSD       : out STD_LOGIC_VECTOR (7 downto 0)  
           );
        end component;
    
    component Fct2_3 is                                           -- Fonction de multiplication par 2/3
        Port ( ADCbin       : in  std_logic_vector(3 downto 0);             -- 
               A23          : out std_logic_vector(2 downto 0)
           );
        end component;
    component Bin2DualBCD is
        Port ( ADCbin       : in  STD_LOGIC_VECTOR (3 downto 0);
               Dizaines     : out STD_LOGIC_VECTOR (3 downto 0);
               Unites_ns    : out STD_LOGIC_VECTOR (3 downto 0);
               Code_signe   : out STD_LOGIC_VECTOR (3 downto 0);
               Unites_s     : out STD_LOGIC_VECTOR (3 downto 0)
           );
        end component;
    component parite is
        Port ( ADCbin       : in  STD_LOGIC_VECTOR (3 downto 0);
               S1           : in  STD_LOGIC;
               Parite       : out STD_LOGIC
           );
    end component;
    component Bouton2Bin is
        Port ( ADCbin       : in  STD_LOGIC_VECTOR (3 downto 0); -- Valeur hexa (Rien affiche sur daff1)
               Dizaine      : in  STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD
               Unites_ns    : in  STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD
               Code_signe   : in  STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD - 5
               Unite_s      : in  STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD - 5
               erreur       : in  STD_LOGIC;
               BTN          : in  STD_LOGIC_VECTOR (1 downto 0);
               S2           : in  STD_LOGIC;
               DAFF0        : out STD_LOGIC_VECTOR (3 downto 0);
               DAFF1        : out STD_LOGIC_VECTOR (3 downto 0)
           );
    end component;
    component Thermo2Bin is
        Port ( i_ADC_th     : in  STD_LOGIC_VECTOR (11 downto 0);
               ADCbin       : out STD_LOGIC_VECTOR (3 downto 0);
               erreur       : out STD_LOGIC
           );
    end component;
    component Decodeur3_8 is
        Port (  A2_3        : in  STD_LOGIC_VECTOR (2 downto 0);
                LED         : out STD_LOGIC_VECTOR (7 downto 0)
           );
    end component;
begin
  
    inst_synch : synchro_module_v2
     generic map (const_CLK_syst_MHz => freq_sys_MHz)
         port map (
            clkm         => sysclk,
            o_CLK_5MHz   => clk_5MHz,
            o_S_1Hz      => d_S_1Hz
        );  
-- Partie ajouté pour l'app   

   CThermo2Bin  : Thermo2Bin        port map(
                    i_ADC_th,
                    d_ADCbin,
                    d_erreur
                    );
                    
   CBin2DualBCD : Bin2DualBCD       port map(
                    d_ADCbin,
                    d_Dizaines,
                    d_Unites_ns,
                    d_Code_signe,
                    d_Unites_s
                    );
   CFct2_3      : Fct2_3            port map(
                    d_ADCbin,
                    d_A23
                    );
   
   Cparite      : parite            port map(
                    d_ADCbin,
                    d_S1,
                    d_Parite
                    );
   CBouton2Bin  : Bouton2Bin        port map(
                    d_ADCbin,
                    d_Dizaines,
                    d_Unites_ns,
                    d_Code_signe,
                    d_Unites_s,
                    d_erreur,
                    i_btn(0)&i_btn(1),
                    i_sw(1),
                    d_AFF0,
                    d_AFF1
                    );
    CDecodeur3_8:Decodeur3_8       port map(
                    d_A23,
                    d_decoded3_8
                    );             
    inst_aff   :  septSegments_Top  port map (
                    clk             => clk_5MHz,-- donnee a afficher definies sur 8 bits : chiffre hexa position 1 et 0
                    i_AFF1          => d_AFF1, 
                    i_AFF0          => d_AFF0,
                    o_AFFSSD_Sim    => open,   -- ne pas modifier le "open". Ligne pour simulations seulement.
                    o_AFFSSD        => o_SSD   -- sorties directement adaptees au connecteur PmodSSD
                    );  
    d_opa     <=  i_sw;                        -- operande A sur interrupteurs
    d_opb     <=  i_btn;                       -- operande B sur boutons
    d_cin     <=  '0'; 
    o_pmodled <= d_decoded3_8;
end BEHAVIORAL;


