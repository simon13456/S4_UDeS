----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 11:55:01 AM
-- Design Name: 
-- Module Name: Thermo2Bin - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Thermo2Bin is
    Port ( i_ADC_th : in STD_LOGIC_VECTOR (11 downto 0);
           ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end Thermo2Bin;

architecture Behavioral of Thermo2Bin is
component ThermoCompte
    Port ( ADCth : in STD_LOGIC_VECTOR (3 downto 0);
           bitQty : out STD_LOGIC_VECTOR (3 downto 0));
end component ;
component thermoEr 
    Port ( groupOf4Bits : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end component;
component Add4bit 
    Port (  X : in std_logic_vector(3 downto 0);
           Y : in std_logic_vector(3 downto 0);
           CI : in std_logic;
           S : out std_logic_vector(3 downto 0);
           CO : out std_logic);
end component;
signal E1, E2, E3, E4, Cin, Ctemp, Cout : std_logic;
signal low_v, mid_v, high_v : std_logic_vector (3 downto 0);
--signal E1_v, E2_v, E3_v, E4_v : std_logic_vector (3 downto 0); -- it's a tool for later (maybe...)
signal sumA_v, sumB_v, sumC_v, sumS_v, sumZ_v : std_logic_vector (3 downto 0);
begin
low_v <= i_ADC_th(3 downto 0);
mid_v <= i_ADC_th(7 downto 4);
high_v <= i_ADC_th(11 downto 8);
Cin <= '0';



-- Compte le nombre de bits
compteur1 : ThermoCompte port map (
            -- input
            ADCth(0) => low_v(0),
            ADCth(1) => low_v(1),
            ADCth(2) => low_v(2),
            ADCth(3) => low_v(3),
            -- output
            bitQty(0)=> sumA_v(0),
            bitQty(1)=> sumA_v(1),
            bitQty(2)=> sumA_v(2),
            bitQty(3)=> sumA_v(3)
);
compteur2 : ThermoCompte port map (
            -- input
            ADCth(0) => mid_v(0),
            ADCth(1) => mid_v(1),
            ADCth(2) => mid_v(2),
            ADCth(3) => mid_v(3),
            -- output
            bitQty(0)=> sumB_v(0),
            bitQty(1)=> sumB_v(1),
            bitQty(2)=> sumB_v(2),
            bitQty(3)=> sumB_v(3)
);
compteur3 : ThermoCompte port map (
            -- input
            ADCth(0) => high_v(0),
            ADCth(1) => high_v(1),
            ADCth(2) => high_v(2),
            ADCth(3) => high_v(3),
            -- output
            bitQty(0)=> sumC_v(0),
            bitQty(1)=> sumC_v(1),
            bitQty(2)=> sumC_v(2),
            bitQty(3)=> sumC_v(3)
);
-- Additionneur
additionPart1 : Add4bit port map (
                X(0) => sumA_v(0),
                X(1) => sumA_v(1),
                X(2) => sumA_v(2),
                X(3) => sumA_v(3),
                
                Y(0) => sumB_v(0),
                Y(1) => sumB_v(1),
                Y(2) => sumB_v(2),
                Y(3) => sumB_v(3),
                
                CI => Cin,
                
                S(0) => sumZ_v(0),
                S(1) => sumZ_v(1),
                S(2) => sumZ_v(2),
                S(3) => sumZ_v(3),
                
                CO => Ctemp                                
);
additionPart2 : Add4bit port map (
                X(0) => sumZ_v(0),
                X(1) => sumZ_v(1),
                X(2) => sumZ_v(2),
                X(3) => sumZ_v(3),
                
                Y(0) => sumC_v(0),
                Y(1) => sumC_v(1),
                Y(2) => sumC_v(2),
                Y(3) => sumC_v(3),
                
                CI => Ctemp,
                
                S(0) => sumS_v(0),
                S(1) => sumS_v(1),
                S(2) => sumS_v(2),
                S(3) => sumS_v(3),
                
                CO => Cout                                
);                
-- Verification des erreurs
eCheck1 : thermoEr port map (
          groupOf4Bits(0) => i_ADC_th(0),
          groupOf4Bits(1) => i_ADC_th(1),
          groupOf4Bits(2) => i_ADC_th(2),
          groupOf4Bits(3) => i_ADC_th(3),
          erreur => E1           
);
eCheck2 : thermoEr port map ( 
          groupOf4Bits(0) => i_ADC_th(3),
          groupOf4Bits(1) => i_ADC_th(4),
          groupOf4Bits(2) => i_ADC_th(5),
          groupOf4Bits(3) => i_ADC_th(6),
          erreur => E2           
);
eCheck3 : thermoEr port map (
          groupOf4Bits(0) => i_ADC_th(6),
          groupOf4Bits(1) => i_ADC_th(7),
          groupOf4Bits(2) => i_ADC_th(8),
          groupOf4Bits(3) => i_ADC_th(9),
          erreur => E3           
);
eCheck4 : thermoEr port map (
          groupOf4Bits(0) => i_ADC_th(9),
          groupOf4Bits(1) => i_ADC_th(10),
          groupOf4Bits(2) => i_ADC_th(11),
          groupOf4Bits(3) => '0',
          erreur => E4           
);
erreur <= E1 or E2 or E3 or E4;
ADCbin <= sumS_v;
end Behavioral;
