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
                   CodeSigne <= "1100";
                   UniteS <= "0101";
               when "1100" =>
                   CodeSigne <= "1100";
                   UniteS <= "0100";
               when "1101" =>
                   CodeSigne <= "1100";
                   UniteS <= "0011";
               when "1110" =>
                   CodeSigne <= "1100";
                   UniteS <= "0010";
               when "1111" =>
                   CodeSigne <= "1100";
                   UniteS <= "0001";
               when "0000" =>
                   CodeSigne <= "1111";
                   UniteS <= "0000";
               when "0001" =>
                   CodeSigne <= "1111";
                   UniteS <= "0001";
               when "0010" =>
                   CodeSigne <= "1111";
                   UniteS <= "0010";
               when "0011" =>
                   CodeSigne <= "1111";
                   UniteS <= "0011";
               when "0100" =>
                   CodeSigne <= "1111";
                   UniteS <= "0100";
               when "0101" =>
                   CodeSigne <= "1111";
                   UniteS <= "0101";
               when "0110" =>
                   CodeSigne <= "1111";
                   UniteS <= "0110";
               when others =>
                   CodeSigne <= "1111";
                   UniteS <= "1111";
        end case;
    end process;

end Behavioral;
