----------------------------------------------------------------------------------
-- Company: UdS
-- Student: alex&sim
-- 
-- Create Date: 05/08/2022 12:21:25 PM
-- Design Name: 
-- Module Name: Decodeur3_8 - Behavioral
-- Project Name: App1
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

entity Decodeur3_8 is
    Port (  A2_3 : in STD_LOGIC_VECTOR (2 downto 0);
            LED : out STD_LOGIC_VECTOR (7 downto 0));
end Decodeur3_8;

architecture Behavioral of Decodeur3_8 is

begin
    process(A2_3)
    begin
        if A2_3 = "000" then 
        LED <= "00000001";
        elsif A2_3 = "001" then 
        LED <= "00000010";
        elsif A2_3 = "010" then
        LED <= "00000100"; 
        elsif A2_3 = "011" then
        LED <= "00001000";
        elsif A2_3 = "100" then
        LED <= "00010000";
        elsif A2_3 = "101" then
        LED <= "00100000";
        elsif A2_3 = "110" then
        LED <= "01000000";
        elsif A2_3 = "111" then
        LED <= "10000000";
        else 
        LED <= "00000000";
        end if;
    end process; 
end Behavioral;
