library verilog;
use verilog.vl_types.all;
entity latch2_vlg_sample_tst is
    port(
        B               : in     vl_logic_vector(7 downto 0);
        Clock           : in     vl_logic;
        Resetn          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end latch2_vlg_sample_tst;
