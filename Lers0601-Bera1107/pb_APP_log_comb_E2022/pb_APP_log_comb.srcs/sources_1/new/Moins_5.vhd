----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2022 08:42:27 PM
-- Design Name: 
-- Module Name: Moins_5 - Behavioral
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

entity Moins_5 is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR (3 downto 0));
end Moins_5;

architecture Behavioral of Moins_5 is
component Add4bit is
    Port (  X : in std_logic_vector(3 downto 0);
           Y : in std_logic_vector(3 downto 0);
           CI : in std_logic;
           S : out std_logic_vector(3 downto 0);
           CO : out std_logic);
end component;
signal C1 : std_logic;
signal Temp: STD_LOGIC_VECTOR (3 downto 0);
signal Cinq : STD_LOGIC_VECTOR (3 downto 0);
begin
    Cinq <= "1011";
    FA1: Add4bit port   map(ADCbin,Cinq,C1,Temp,C1);
    process(ADCbin)
        begin
            case Temp is
               when "1011" =>
                   Moins5 <= "1101";
               when "1100" =>
                   Moins5 <= "1100";
               when "1101" =>
                   Moins5 <= "1011";
               when "1110" =>
                   Moins5 <= "1010";
               when "1111" =>
                   Moins5 <= "1001";
               when "0000" =>
                   Moins5 <= "0000";
               when "0001" =>
                   Moins5 <= "0001";
               when "0010" =>
                   Moins5 <= "0010";
               when "0011" =>
                   Moins5 <= "0011";
               when "0100" =>
                   Moins5 <= "0100";
               when "0101" =>
                   Moins5 <= "0101";
               when "0110" =>
                   Moins5 <= "0110";
               when others =>
                   Moins5 <= "0000";
        end case;
    end process;
end Behavioral;
