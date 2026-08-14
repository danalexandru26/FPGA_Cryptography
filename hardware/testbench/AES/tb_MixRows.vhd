----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 8:50:00 PM
-- Design Name: Rows Diffusion Operation Testbench
-- Module Name: Rows Diffusion Operation Testbench - Behavioral
-- Project Name: FPGA_Cryptography Advanced Encryption Standard Testbench
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

library AES;
use AES.all;

library aes_utilities;
use aes_utilities.types.all;

entity tb_MixRows is

end tb_MixRows;

architecture TB of tb_MixRows is
    signal tb_state  : byte_matrix(15 downto 0) := (others => x"00");
    signal tb_output : byte_matrix(15 downto 0);
    
    begin
        DUT: entity MixRows port map(
            state  => tb_state,
            output => tb_output
        );
        
        TEST: process
            begin
                wait for 10ns;
                tb_state <= (
                    0  => x"00", 1   => x"01", 2  => x"02", 3  => x"03",
                    4  => x"04", 5   => x"05", 6  => x"06", 7  => x"07",
                    8  => x"08", 9   => x"09", 10 => x"0A", 11 => x"0B",
                    12 => x"0C", 13  => x"0D", 14 => x"0E", 15 => x"0F"
                );
                
                wait for 10ns;
                tb_state <= (
                    0  => x"A7", 1   => x"3C", 2  => x"F1", 3  => x"09",
                    4  => x"52", 5   => x"DE", 6  => x"81", 7  => x"B4",
                    8  => x"6F", 9   => x"10", 10 => x"C8", 11 => x"35",
                    12 => x"E2", 13  => x"99", 14 => x"47", 15 => x"BD"
                );
                
                wait for 10ns;
                tb_state <= (
                    0  => x"A3", 1   => x"17", 2  => x"C8", 3  => x"4F",
                    4  => x"92", 5   => x"E1", 6  => x"36", 7  => x"7B",
                    8  => x"5D", 9   => x"08", 10 => x"F4", 11 => x"B2",
                    12 => x"6C", 13  => x"DA", 14 => x"21", 15 => x"89"
                );
                
            end process;
end TB;
