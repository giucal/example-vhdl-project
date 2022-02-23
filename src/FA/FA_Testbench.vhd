library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- Simple test-bench for a full-adder.
entity FA_Testbench is end;

architecture Exhaustive of FA_Testbench is
    component FA
        port
        ( a, b : in  std_logic
        ; ci   : in  std_logic
        ; s    : out std_logic
        ; co   : out std_logic
        );
    end component;

    signal a, b, ci : std_logic;
    signal o        : std_logic_vector(1 downto 0);
begin
    CUT: FA port map
            ( a  => a
            , b  => b
            , ci => ci
            , s  => o(0)
            , co => o(1)
            );

    process
    begin
        a  <= '0';
        b  <= '0';
        ci <= '0';
        for i in 0 to 1 loop
            for j in 0 to 1 loop
                for k in 0 to 1 loop
                    wait for 1 ns;
                    assert o = std_logic_vector(to_unsigned(i + j + k, 2))
                        report "bad output"
                        severity error;
                    ci <= not ci;
                end loop;
                b <= not b;
            end loop;
            a <= not a;
        end loop;

        wait;
    end process;
end architecture;
