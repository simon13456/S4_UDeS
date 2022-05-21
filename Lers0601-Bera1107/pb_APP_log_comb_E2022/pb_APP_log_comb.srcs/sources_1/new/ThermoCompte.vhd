----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 12:31:41 PM
-- Design Name: 
-- Module Name: ThermoCompte - Behavioral
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

entity ThermoCompte is
    Port ( ADCth : in STD_LOGIC_VECTOR (3 downto 0);
           bitQty : out STD_LOGIC_VECTOR (3 downto 0));
end ThermoCompte;

architecture Behavioral of ThermoCompte is

begin
    process(ADCth)
    begin
    bitQty(3) <=    '0';
    bitQty(2) <=    ADCth(3) and ADCth(2) and ADCth(1) and ADCth(0);
    bitQty(1) <=    (not ADCth(3) and ADCth(1) and ADCth(0));
                    
   bitQty(0) <=     (not ADCth(3) and not ADCth(2) and not ADCth(1) and ADCth(0)) or
                    (not ADCth(3) and  ADCth(2) and ADCth(1) and ADCth(0));                    
    end process;
end Behavioral;
