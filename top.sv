`include "uvm_macros.svh"
import uvm_pkg::*;

`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "interface.sv"
`include "dut.sv"
`include "mon1.sv"
`include "agent1.sv"
`include "mon2.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module comp;

comp_intf vif();
comp_dut  DUT(vif);

 initial begin
 uvm_config_db #(virtual comp_intf)::set(uvm_root::get(),"*","vif",vif);
 $dumpfile("dump.vcd"); $dumpvars;
 end
 
 initial begin
 run_test("base_test");
 
 end
 endmodule
 