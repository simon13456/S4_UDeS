----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 11:03:39 AM
-- Design Name: 
-- Module Name: thermoEr - Behavioral
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

entity thermoEr is
    Port ( groupOf4Bits : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end thermoEr;

architecture Behavioral of thermoEr is

begin
    process(groupOf4Bits)
    begin
        erreur <= (groupOf4Bits(3) and not groupOf4Bits(2))or (groupOf4Bits(2) and not groupOf4Bits(1)) or (groupOf4Bits(1) and not groupOf4Bits(0));
    end process;


end Behavioral;
