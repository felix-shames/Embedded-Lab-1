----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2021 12:11:45 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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


library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider_top is
port(

        clk  : in std_logic;        -- 125 Mhz clock
        sw0  : in std_logic;        -- switch, '1' = on
        
        led0 : inout std_logic        -- led, '1' = on

    );
end divider_top;

architecture Behavior of divider_top is

signal counter : std_logic_vector(26 downto 0) := (others => '0');

begin

    process(clk)
    begin
    
        if rising_edge(clk) then
        
            if (sw0 = '0') then
                led0 <= '0';
                counter <= (others => '0');
                
            else
            
                -- count one full led period (1 Hz)
                
                if (unsigned(counter) < 62500000) then
                    counter <= std_logic_vector(unsigned(counter) + 1);
                    
                else
                led0 <= not led0;
                    counter <= (others => '0');
                    
                end if;
            
            end if;
            
        end if;
    
    end process;
    
end behavior;