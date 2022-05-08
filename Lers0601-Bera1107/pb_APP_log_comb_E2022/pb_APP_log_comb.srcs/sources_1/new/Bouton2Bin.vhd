----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2022 02:20:46 PM
-- Design Name: 
-- Module Name: Bouton2Bin - Behavioral
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

entity Bouton2Bin is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0); -- Valeur hexa (Rien affiche sur daff1)
           Dizaine : in STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD
           Unites_ns : in STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD
           Code_signe : in STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD - 5
           Unite_s : in STD_LOGIC_VECTOR (3 downto 0); -- Valeur BCD - 5
           erreur : in STD_LOGIC;
           BTN : in STD_LOGIC_VECTOR (1 downto 0);
           S2 : in STD_LOGIC;
           DAFF0 : out STD_LOGIC_VECTOR (3 downto 0);
           DAFF1 : out STD_LOGIC_VECTOR (3 downto 0));
end Bouton2Bin;

architecture Behavioral of Bouton2Bin is
signal select_v :  std_logic_vector (3 downto 0); 

begin
    select_v <= (erreur & S2 & BTN);
    process(select_v)
    begin
        if select_v = "0000" then -- Affiche la valeur BCD 
            DAFF0 <= Unites_ns;
            DAFF1 <= Dizaine;    
        elsif select_v = "0001" then  -- Affiche la valeur en hexa
            DAFF1 <= "0000"; -- On doit rien afficher
            DAFF0 <= ADCbin; -- Vrai si la FIgure 2 Afficheur 7 segments du guide esdt vraie      
        elsif select_v = "0010" then  -- Affiche la valeur en BCD-5
            DAFF0 <= Unite_s;
            DAFF1 <= Code_signe;       
        else                          -- Affiche Er
            DAFF0 <= "0000";
            DAFF1 <= "0000";
        end if;                   
    end process;
end Behavioral;
