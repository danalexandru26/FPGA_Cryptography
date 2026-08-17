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
        start      : in std_logic;
        command    : in std_logic;
        
        plaintext  : in byte_matrix (15 downto 0);
        key        : in byte_matrix (15 downto 0);
        ciphertext : in byte_matrix (15 downto 0)  
);
end AES_Core;

architecture RTL of AES_Core is

    -- Key Schedule Intermediary State Signals
    signal s_round       : std_logic_vector (7 downto 0) := (others => '0');
    signal s_round_key   : byte_matrix (15 downto 0) := (others => (others => '0'));
    signal s_current_key : byte_matrix (15 downto 0) := (others => (others => '0'));
    
    -- Key Addition Intermediary State Signals
    signal s_addition_state : byte_matrix (15 downto 0) := (others => (others => '0'));
    
    -- Substitution Box Intermediary State Signals
    signal s_sbox_state  : byte_matrix (15 downto 0)  := (others => (others => '0'));
    signal s_sbox_output : byte_matrix (15 downto 0) := (others => (others => '0'));
     
    -- Diffusion Intermediary State Signals
    signal s_diffusion_output : byte_matrix (15 downto 0) := (others => (others => '0'));
    
    -- AES Intermediary State Signals
    signal s_round_state : byte_matrix (15 downto 0) := (others => (others => '0'));
    
    -- Finite State Machine Control Signals
    signal fsm_round   : std_logic_vector(7 downto 0) := (others => '0');
    signal state       : aes_state := S_AES_INIT;
    begin
        
        c_SubstitutionBox : entity AES.SBox port map(
            state      => s_sbox_state,
            substitute => s_sbox_output    
        );  
        
        c_Diffusion : entity AES.Diffusion port map(
            state  => s_sbox_output,
            output => s_diffusion_output
        );
        
        c_KeySchedule : entity AES.KeySchedule port map(
            round => s_round,
            i_key => s_current_key,
            o_key => s_round_key
        ); 
        
        c_KeyAddition : entity AES.KeyAddition port map(
            state     => s_diffusion_output,
            round_key => s_round_key,
            output    => s_addition_state 
        );  

        
        process (clk) 
            begin
                if(rising_edge(clk)) then
                    case(state) is
                        when S_AES_INIT =>
                            fsm_round       <= (others => '0');
                            s_round       <= (others => '0');
                            s_sbox_state  <= (others => (others => '0'));
                            s_current_key <= (others => (others => '0'));
                            
                            state <= S_AES_IDLE;
                            
                        when S_AES_IDLE =>
                            if(start = '1') then
                                if(command = '0') then
                                     state <= S_AES_ENCRYPT;
                                else state <= S_AES_DECRYPT;
                                end if;
                            end if;
                        
                        when S_AES_ENCRYPT =>
                            if(fsm_round = x"00") then
                                s_current_key <= key;
                                s_sbox_state  <= plaintext xor key;
                                
                                fsm_round <= std_logic_vector(unsigned(fsm_round) + 1);
                            
                            elsif(fsm_round < x"0A") then
                                s_round       <= std_logic_vector(unsigned(s_round) + 1);
                                s_current_key <= s_round_key;
                                s_sbox_state  <= s_addition_state;
                                
                                fsm_round <= std_logic_vector(unsigned(fsm_round) + 1);
                                
                            else state <= S_AES_DONE_ENCRYPT;
                         end if; 
                        
                        when S_AES_DECRYPT =>
                            
                        when S_AES_DONE_ENCRYPT =>
                            if(start = '0') then
                                state <= S_AES_IDLE;
                            end if;
                        
                        when others =>
                            null;
                           
                    end case;
                end if;
        end process;    
            
       
end RTL;