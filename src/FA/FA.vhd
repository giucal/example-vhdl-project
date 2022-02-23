library ieee;
    use ieee.std_logic_1164.all;

-- A full-adder.
entity FA is
    port
    ( a, b : in  std_logic -- summands
    ; ci   : in  std_logic -- carry-in
    ; s    : out std_logic -- sum
    ; co   : out std_logic -- carry-out
    );
end entity;

architecture LA of FA is
begin
    s  <= a xor b xor ci;
    co <= (a and b) or ((a xor b) and ci);
end architecture;
