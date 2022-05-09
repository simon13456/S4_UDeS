----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2022 05:31:44 PM
-- Design Name: 
-- Module Name: parite - Behavioral
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

entity parite is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           S1 : in STD_LOGIC;
           Parite : out STD_LOGIC);
end parite;

architecture Behavioral of parite is

begin
    process(S1,ADCbin)
    begin
        if S1 = '1' then -- Parite pair
            case ADCbin is
                when "0000" =>
                    parite <= '0';
                when "0001" =>
                    parite <= '1';
                when "0010" =>
                    parite <= '1';
                when "0011" =>
                    parite <= '0';
                when "0100" =>
                    parite <= '1';
                when "0101" =>
                    parite <= '0';
                when "0110" =>
                    parite <= '0';
                when "0111" =>
                    parite <= '1';
                when "1000" =>
                    parite <= '1';
                when "1001" =>
                    parite <= '0';
                when "1010" =>
                    parite <= '0';
                when "1011" =>
                    parite <= '1';
                when "1100" =>
                    parite <= '0';
                when "1101" =>
                    parite <= '1';
                when "1110" =>
                    parite <= '1';
                when "1111" =>
                    parite <= '0';
                when others => parite <= '0';
            end case;            
        else    -- Parite impair
            case ADCbin is
                when "0000" =>
                    parite <= '1';
                when "0001" =>
                    parite <= '0';
                when "0010" =>
                    parite <= '0';
                when "0011" =>
                    parite <= '1';
                when "0100" =>
                    parite <= '0';
                when "0101" =>
                    parite <= '1';
                when "0110" =>
                    parite <= '1';
                when "0111" =>
                    parite <= '0';
                when "1000" =>
                    parite <= '0';
                when "1001" =>
                    parite <= '1';
                when "1010" =>
                    parite <= '1';
                when "1011" =>
                    parite <= '0';
                when "1100" =>
                    parite <= '1';
                when "1101" =>
                    parite <= '0';
                when "1110" =>
                    parite <= '0';
                when "1111" =>
                    parite <= '1';
                when others => parite <= '0';
            end case;
        end if;
    end process;
end Behavioral;
