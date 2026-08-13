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
            
            
            end process;
end TB;
