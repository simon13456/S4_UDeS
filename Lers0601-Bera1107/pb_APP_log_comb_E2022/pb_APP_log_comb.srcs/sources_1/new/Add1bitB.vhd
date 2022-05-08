----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 03:15:15 PM
-- Design Name: 
-- Module Name: Add1bitB - Behavioral
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

entity Add1bitB is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           CI : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end Add1bitB;

architecture Behavioral of Add1bitB is
signal Entree : std_logic_vector (2 downto 0);    
    begin
        Entree <= (X & Y & CI);
        process(Entree)
            begin 
            CO <= (CI AND X) OR (X and Y) OR (CI and Y);
            S <= X XOR Y XOR CI;
        end process;
end Behavioral;