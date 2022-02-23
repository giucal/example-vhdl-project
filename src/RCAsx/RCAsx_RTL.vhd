architecture RTL of RCAsx is
    component FA
        port
        ( a, b : in  std_logic
        ; ci   : in  std_logic
        ; s    : out std_logic
        ; co   : out std_logic
        );
    end component;

    signal xa, xb : std_logic_vector(n downto 0);   -- Extended operands.
    signal c      : std_logic_vector(n+1 downto 0); -- Carry bits.
begin
    -- Sign extension.
    xa <= a(n-1) & a;
    xb <= b(n-1) & b;

    c(0) <= ci;

    ADDERS:
    for i in 0 to n generate
        ADDER:
        FA port map
           ( a  => xa(i)
           , b  => xb(i)
           , ci => c(i)
           , s  => s(i)
           , co => c(i+1)
           );
    end generate;
end architecture;
