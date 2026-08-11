----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/11/2026 10:11:50 PM
-- Design Name: Blinky
-- Module Name: Blinky - Behavioral
-- Project Name: FPGA_Cryptography 
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

entity blinky is
port(
    clk      :  in std_logic;
    led_blue : out std_logic
);
end blinky;

architecture RTL of blinky is

begin

end RTL;