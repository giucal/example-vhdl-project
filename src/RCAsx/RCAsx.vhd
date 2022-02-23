library ieee;
    use ieee.std_logic_1164.all;

-- A ripple-carry adder with sign extension.
entity RCAsx is
    generic (n: positive := 8);
    port
    ( a, b : in  std_logic_vector(n-1 downto 0)
    ; ci   : in  std_logic
    ; s    : out std_logic_vector(n downto 0)
    );
end entity;
