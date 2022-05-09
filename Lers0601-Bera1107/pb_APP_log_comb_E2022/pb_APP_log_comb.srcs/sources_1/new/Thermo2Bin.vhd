----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 11:55:01 AM
-- Design Name: 
-- Module Name: Thermo2Bin - Behavioral
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

entity Thermo2Bin is
    Port ( i_ADC_th : in STD_LOGIC_VECTOR (11 downto 0);
           ADCbin : out STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end Thermo2Bin;

architecture Behavioral of Thermo2Bin is
component ThermoCompte
    Port ( ADCth : in STD_LOGIC_VECTOR (3 downto 0);
           bitQty : out STD_LOGIC_VECTOR (3 downto 0));
end component ;
component thermoEr 
    Port ( groupOf4Bits : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : out STD_LOGIC);
end component;
component Add4bit 
    Port (  X : in std_logic_vector(3 downto 0);
           Y : in std_logic_vector(3 downto 0);
           CI : in std_logic;
           S : out std_logic_vector(3 downto 0);
           CO : out std_logic);
end component;
signal E1, E2, E3, E4 : std_logic ;
signal low_v, mid_v, high_v : std_logic_vector (3 downto 0);
signal E1_v, E2_v, E3_v, E4_v : std_logic_vector (3 downto 0);
begin
low_v <= i_ADC_th(3 downto 0);
mid_v <= i_ADC_th(7 downto 4);
high_v <= i_ADC_th(11 downto 8);



-- Verification des erreurs
eCheck1 : thermoEr port map (
          groupOf4Bits(0) => i_ADC_th(0),
          groupOf4Bits(1) => i_ADC_th(1),
          groupOf4Bits(2) => i_ADC_th(2),
          groupOf4Bits(3) => i_ADC_th(3),
          erreur => E1           
);
eCheck2 : thermoEr port map ( 
          groupOf4Bits(0) => i_ADC_th(3),
          groupOf4Bits(1) => i_ADC_th(4),
          groupOf4Bits(2) => i_ADC_th(5),
          groupOf4Bits(3) => i_ADC_th(6),
          erreur => E2           
);
eCheck3 : thermoEr port map (
          groupOf4Bits(0) => i_ADC_th(6),
          groupOf4Bits(1) => i_ADC_th(7),
          groupOf4Bits(2) => i_ADC_th(8),
          groupOf4Bits(3) => i_ADC_th(9),
          erreur => E3           
);
eCheck4 : thermoEr port map (
          groupOf4Bits(0) => i_ADC_th(9),
          groupOf4Bits(1) => i_ADC_th(10),
          groupOf4Bits(2) => i_ADC_th(11),
          groupOf4Bits(3) => '0',
          erreur => E4           
);
end Behavioral;
