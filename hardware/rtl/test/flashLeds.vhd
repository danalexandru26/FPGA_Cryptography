----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/12/2026 04:20:20 PM
-- Design Name: flashLeds
-- Module Name: flashLeds - Behavioral
-- Project Name: FPGA_Cryptography Test Suite
-- Target Devices: Digilent Arty Z7020 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity flashLeds is
    generic(
    fclk      : integer := 125000000  
);
    port(
    clk       : in std_logic;
    led_blue  : out std_logic;
    led_green : out std_logic;
    led_red   : out std_logic
    
);
end flashLeds;

architecture RTL of flashLeds is
        signal counter    : integer := 0;
        signal currentLed : integer := 0;
    begin
        process(clk)
            begin
                if(rising_edge(clk)) then
                    counter <= counter + 1;
                
                    if(counter = fclk) then
                        counter <= 0;                        
                        
                        if(currentLed = 3) then
                            currentLed <= 1;
                        else currentLed <= currentLed + 1;
                        end if;
                    end if;
                    
                    case(currentLed) is
                        when 1 =>
                            led_red   <= '0';
                            led_blue  <= '1';
                        when 2 =>
                            led_blue  <= '0';
                            led_green <= '1';
                        when 3 =>
                            led_green <= '0';
                            led_red   <= '1';
                        when others =>
                            null;
                    end case;
            end if;
            end process;
end RTL;