----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2022 09:56:13 PM
-- Design Name: 
-- Module Name: Fct2_3 - Behavioral
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

entity Fct2_3 is
    Port ( ADCbin : in std_logic_vector(3 downto 0);
           A23 : out std_logic_vector(2 downto 0));
end Fct2_3;

architecture Behavioral of Fct2_3 is
component Add4bit is
    Port (  X : in std_logic_vector(3 downto 0);
           Y : in std_logic_vector(3 downto 0);
           CI : in std_logic;
           S : out std_logic_vector(3 downto 0);
           CO : out std_logic);
end component;
signal Moins1,Moins3 : std_logic_vector(3 downto 0);
signal temp23: std_logic_vector(3 downto 0);
signal C1 : std_logic;
begin
Moins1 <= ("0" & ADCbin(3) & ADCbin(2) & ADCbin(1));
Moins3 <= ("000" & ADCbin(3));
FA1: Add4bit port   map(Moins1,Moins3,C1,temp23,C1);
A23(0)<=temp23(0);
A23(1)<=temp23(1);
A23(2)<=temp23(2);
end Behavioral;
