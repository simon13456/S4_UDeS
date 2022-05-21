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

    --> Remplacer ce COMPONENT par celui de votre COMPONENT � tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'ins�rer dans la d�claration COMPONENT.
    --> Si vous voulez comparer 2 modules VHDL, vous pouvez d�clarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

component Decodeur3_8 is
    Port (  A2_3 : in STD_LOGIC_VECTOR (2 downto 0);
            LED : out STD_LOGIC_VECTOR (7 downto 0));
end component;

    Signal  Thermometrique : std_logic_vector (11 downto 0);
    CONSTANT PERIOD : TIME := 1 ns; --  *** � ajouter avant le premier BEGIN
--    Signal o_DEL     :std_logic_vector (1 downto 0);
--    Signal i_S       :std_logic_vector (1 downto 0);  
--    Signal i_ADC_th_sim    :std_logic_vector (11 downto 0);
--    Signal i_btn_sim       :std_logic_vector (3 downto 0); 
--    Signal i_sw_sim        :std_logic_vector (3 downto 0);
--    Signal sysclk_sim      :std_logic;                     
--    Signal o_SSD_sim       :std_logic_vector (7 downto 0); 
--    Signal o_led_sim       :std_logic_vector (3 downto 0); 
--    Signal o_led6_r_sim    :std_logic;                     
--    Signal o_pmodled_sim   :std_logic_vector (7 downto 0); 
--    Signal vect_test_btns  :std_logic_vector (3 downto 0);
 BEGIN 
      UUT_main : Decodeur3_8
        Port map(  A2_3 ;
                   LED );

    
   tb : PROCESS
    begin
        wait for PERIOD;
        Thermometrique <= "000000000000";
        WAIT FOR PERIOD;
--        vect_test_btns <= "0000";
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
