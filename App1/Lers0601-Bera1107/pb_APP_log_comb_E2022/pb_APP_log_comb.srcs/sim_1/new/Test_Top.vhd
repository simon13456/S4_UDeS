----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2022 12:46:03 AM
-- Design Name: 
-- Module Name: Test_Top - Behavioral
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

entity Test_Top is
end Test_Top;

architecture Behavioral of Test_Top is

    --> Remplacer ce COMPONENT par celui de votre COMPONENT ï¿½ tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insï¿½rer dans la dï¿½claration COMPONENT.
    --> Si vous voulez comparer 2 modules VHDL, vous pouvez dï¿½clarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

    component AppCombi_top is
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
    end component AppCombi_top;

    Signal  Thermometrique : std_logic_vector (11 downto 0);
    CONSTANT PERIOD : TIME := 1 ns; --  *** ï¿½ ajouter avant le premier BEGIN
    Signal o_DEL     :std_logic_vector (1 downto 0);
    Signal i_S       :std_logic_vector (1 downto 0);  
    Signal i_ADC_th_sim    :std_logic_vector (11 downto 0);
    Signal i_btn_sim       :std_logic_vector (3 downto 0); 
    Signal i_sw_sim        :std_logic_vector (3 downto 0);
    Signal sysclk_sim      :std_logic;                     
    Signal o_SSD_sim       :std_logic_vector (7 downto 0); 
    Signal o_led_sim       :std_logic_vector (3 downto 0); 
    Signal o_led6_r_sim    :std_logic;                     
    Signal o_pmodled_sim   :std_logic_vector (7 downto 0); 
    Signal vect_test_btns  :std_logic_vector (3 downto 0);
 BEGIN 
      UUT_main : AppCombi_top PORT MAP(
      i_ADC_th =>  i_ADC_th_sim,
      i_btn =>  i_btn_sim,
      i_sw =>  i_sw_sim,
      sysclk =>  sysclk_sim,
      o_SSD =>  o_SSD_Sim,
      o_led =>  o_led_sim,
      o_led6_r =>  o_led6_r_sim,
      o_pmodled =>  o_pmodled_sim
      );
      
     i_ADC_th_sim<=Thermometrique;
     i_sw_sim(3) <= '0';
     i_sw_sim(2) <= '0';
     i_sw_sim(1) <= vect_test_btns(0);
     i_sw_sim(0) <= vect_test_btns(1);
     i_btn_sim(3) <= '0';
     i_btn_sim(2) <= '0';
     i_btn_sim(1) <= vect_test_btns(0);
     i_btn_sim(0) <= vect_test_btns(1);   
     
   tb : PROCESS
    begin
        wait for PERIOD;
        Thermometrique <= "000000000000";
        WAIT FOR PERIOD;
        vect_test_btns <= "0000";
        WAIT FOR PERIOD;
        Thermometrique <= "000000000001";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000000000011";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000000000111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000000001111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000000011111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000000111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000001111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000011111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "000111111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "001111111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "011111111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111111111111";
        WAIT FOR PERIOD;

        -- number 2
        wait for PERIOD;
        Thermometrique <= "101111111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111111111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "110111111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111011111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111101111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111110111111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111111011111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111111101111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111111110111";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111111111011";
        WAIT FOR PERIOD;

        WAIT FOR PERIOD;
        Thermometrique <= "111111111101";
        WAIT FOR PERIOD;
        vect_test_btns <= "0000";
        Thermometrique <= "000000000010";
        WAIT FOR PERIOD;
        vect_test_btns <= "0000";
        Thermometrique <= "000000101111";
        WAIT FOR PERIOD;
        vect_test_btns <= "0000";
        Thermometrique <= "111100001111";
        WAIT FOR PERIOD;
        vect_test_btns <= "0000";
    END PROCESS;
end Behavioral;
