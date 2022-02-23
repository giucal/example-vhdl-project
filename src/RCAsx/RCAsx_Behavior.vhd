architecture Behavior of RCAsx is
    signal g, p, c: std_logic_vector(n downto 0);
begin
    -- Bit-wise generate and propagate signals.
    g <= g(n-1) & (a and b);
    p <= p(n-1) & (a xor b);

    -- Ripple-carry relation.
    c(0) <= ci;
    c(n downto 1) <= g(n-1 downto 0) or
                     (p(n-1 downto 0) and
                      c(n-1 downto 0));

    s <= p xor c;
end architecture;
