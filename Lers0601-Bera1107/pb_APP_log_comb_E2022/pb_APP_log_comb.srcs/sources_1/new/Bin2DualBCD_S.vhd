----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2022 09:29:46 PM
-- Design Name: 
-- Module Name: Bin2DualBCD_S - Behavioral
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

entity Bin2DualBCD_S is
    Port ( Moins5 : in STD_LOGIC_VECTOR (3 downto 0);
           CodeSigne : out STD_LOGIC_VECTOR (3 downto 0);
           UniteS : out STD_LOGIC_VECTOR (3 downto 0));
end Bin2DualBCD_S;

architecture Behavioral of Bin2DualBCD_S is

begin
process(Moins5)
        begin
            case Moins5 is
               when "1011" =>
                   UniteS <= "1100";
                   CodeSigne <= "1101";
               when "1100" =>
                   UniteS <= "1100";
                   CodeSigne <= "1100";
               when "1101" =>
                   UniteS <= "1100";
                   CodeSigne <= "1011";
               when "1110" =>
                   UniteS <= "1100";
                   CodeSigne <= "1010";
               when "1111" =>
                   UniteS <= "1100";
                   CodeSigne <= "1001";
               when "0000" =>
                   UniteS <= "1111";
                   CodeSigne <= "0000";
               when "0001" =>
                   UniteS <= "1111";
                   CodeSigne <= "0001";
               when "0010" =>
                   UniteS <= "1111";
                   CodeSigne <= "0010";
               when "0011" =>
                   UniteS <= "1111";
                   CodeSigne <= "0011";
               when "0100" =>
                   UniteS <= "1111";
                   CodeSigne <= "0100";
               when "0101" =>
                   UniteS <= "1111";
                   CodeSigne <= "0101";
               when "0110" =>
                   UniteS <= "1111";
                   CodeSigne <= "0110";
               when others =>
                   UniteS <= "1111";
                   CodeSigne <= "1111";
        end case;
    end process;

end Behavioral;
