----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/11/2026 10:46:10 PM
-- Design Name: PWM
-- Module Name: PWM - Behavioral
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

entity pwm is
    port(
        clk      : in std_logic;        
        btn_a    : in std_logic;
        btn_b    : in std_logic;
        btn_c    : in std_logic;
        btn_d    : in std_logic;
        
        led_blue : out std_logic
);
end pwm;

architecture RTL of pwm is
    signal duty_cycle  : integer := 0;
    signal counter     : unsigned (7 downto 0) := (others => '0');
    signal button_mask : unsigned (3 downto 0) := (others => '0');
begin
    process(clk)
        begin
            if(rising_edge(clk)) then
                counter <= counter + 1;
                            
                button_mask(0) <= btn_a;
                button_mask(1) <= btn_b;
                button_mask(2) <= btn_c;
                button_mask(3) <= btn_d;   
                case(button_mask) is 
                    when "0001" =>
                        duty_cycle <= 5;
                    when "0010" =>
                        duty_cycle <= 50;
                    when "0100" =>
                        duty_cycle <= 150;
                    when "1000" =>
                        duty_cycle <= 255;
                    when others =>
                        null;
                end case;
                
                if(counter < duty_cycle) then
                    led_blue <= '1';
                else
                    led_blue <= '0';
                end if;
            end if;
        end process;
end RTL;