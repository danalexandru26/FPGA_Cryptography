----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/12/2026 05:38:10 PM
-- Design Name: toggleLeds
-- Module Name: toggleLeds - Behavioral
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

entity toggleLeds is
    port(
    clk       : in std_logic;
    rst       : in std_logic;
    btn_0     : in std_logic;
    led_blue  : out std_logic
);
end toggleLeds;

architecture RTL of toggleLeds is
        signal btn_state : std_logic   := '0';
        signal count     : std_logic   := '0';
    begin
        process(clk, rst) 
            begin
                if(rst = '1') then
                       led_blue  <= '0';
                       btn_state <= '0';
                       count     <= '0';
                end if;
                
                if(rising_edge(clk)) then
                    if(btn_0 = '1' and btn_state = '0') then
                        if(count = '0') then
                            led_blue <= '1';
                            count    <= '1';
                        else 
                            led_blue <= '0';
                            count    <= '0';
                        end if;
                        
                        btn_state <= '1';
                        
                    elsif(btn_0 = '0' and btn_state = '1') then
                        btn_state <= '0';
                    end if;
                end if;
            end process;
end RTL;