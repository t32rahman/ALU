library verilog;
use verilog.vl_types.all;
entity decoder4to16_vlg_check_tst is
    port(
        OP              : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end decoder4to16_vlg_check_tst;
