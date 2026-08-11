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
    generic(
        h_fClk : integer := 6250000
    );
    port(
        clk      : in std_logic;
        led_blue : out std_logic
);
end pwm;

architecture RTL of pwm is
begin
end RTL;