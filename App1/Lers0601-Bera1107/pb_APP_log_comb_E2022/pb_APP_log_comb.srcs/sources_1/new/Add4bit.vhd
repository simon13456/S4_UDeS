----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 03:15:15 PM
-- Design Name: 
-- Module Name: Add4bit - Behavioral
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

entity Add4bit is
    Port (  X : in std_logic_vector(3 downto 0);
           Y : in std_logic_vector(3 downto 0);
           CI : in std_logic;
           S : out std_logic_vector(3 downto 0);
           CO : out std_logic);
end Add4bit;

architecture Behavioral of Add4bit is
component  Add1bitA
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           CI : in STD_LOGIC;
           S : out STD_LOGIC;
           CO : out STD_LOGIC);
end component;

component Add1bitB is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           CI : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC);
end component;
signal C1, C2, C3 : std_logic ;
begin
FA1:Add1bitA port   map(X(0),Y(0),CI,S(0),C1);
FA2:Add1bitA port   map(X(1),Y(1),C1,S(1),C2);
FA3:Add1bitB port   map(X(2),Y(2),C2,S(2),C3);
FA4:Add1bitB port   map(X(3),Y(3),C3,S(3),CO);
end Behavioral;
