----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Bulzan Dan-Alexandru
-- 
-- Create Date: 08/13/2026 5:0:00 PM
-- Design Name: User Defined Types
-- Module Name:
-- Project Name: FPGA_Cryptography Advanced Encryption Standard Types
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

package types is
    type byte_matrix is array (natural range <>) of std_logic_vector(7 downto 0);
end package;


library IEEE;
use IEEE.std_logic_1164.all;

package functions is 
    function xtime (
        state_in : in std_logic_vector (7 downto 0))
        return std_logic_vector;
end package;

package body functions is
    function xtime (
        state_in : in std_logic_vector (7 downto 0))
        return std_logic_vector is
        variable aMod : std_logic_vector(7 downto 0);
        
        begin
            if(state_in(7) = '0') then
                aMod := state_in(6 downto 0) & '0';
            else
                aMod := (state_in(6 downto 0) & '0') xor x"1B";
            end if;
            
            return aMod;
        end function xtime;
end package body;