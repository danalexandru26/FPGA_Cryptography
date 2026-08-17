----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/17/2026 05:40:00 PM
-- Design Name: AES Core 
-- Module Name: AES Core  - Behavioral
-- Project Name: FPGA_Cryptography Advanced Encryption Standard
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

library aes_utilities;
use aes_utilities.types.all;
use aes_utilities.functions.all;

library AES;

entity AES_Core is
    port(
        clk        : in std_logic;
        plaintext  : in byte_matrix (15 downto 0);
        key        : in byte_matrix (15 downto 0);
        ciphertext : in byte_matrix (15 downto 0)  
);
end AES_Core;

architecture RTL of AES_Core is

    -- Key Schedule Intermediary State Signals
    signal s_round       : std_logic_vector (7 downto 0) := (others => '0');
    signal s_round_key   : byte_matrix (15 downto 0);
    signal s_current_key : byte_matrix (15 downto 0);
    
    -- Key Addition Intermediary State Signals
    signal s_start_state    : byte_matrix (15 downto 0);
    signal s_addition_state : byte_matrix (15 downto 0); 
    
    -- Substitution Box Intermediary State Signals
    signal s_sbox_state : byte_matrix (15 downto 0);
    signal s_sbox_output : byte_matrix (15 downto 0);
     
    begin
        
        c_SubstitutionBox : entity AES.SBox port map(
            state      => s_sbox_state,
            substitute => s_sbox_output    
        );  
end RTL;