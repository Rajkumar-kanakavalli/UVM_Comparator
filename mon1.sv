class comp_mon1 extends uvm_monitor;

//utility macros

`uvm_component_utils(comp_mon1)

comp_seq_item pkt1; 

virtual comp_intf vif;

uvm_analysis_port #(comp_seq_item) item_collected_port1;

//constructor
function new (string name = "comp_mon1",uvm_component parent);
   super.new(name,parent);
 endfunction
 
 //Build phase
 virtual function void build_phase (uvm_phase phase);
   super.build_phase(phase);
   
   uvm_config_db #(virtual comp_intf)::get(this,"","vif",vif);
   item_collected_port1 = new("item_collected_port1",this);
   endfunction
   
   //run phase
   
   task run_phase(uvm_phase phase);
   pkt1 = comp_seq_item::type_id::create("pkt1");
   
   forever
   begin
   #5;
   pkt1.a = vif.a;
   pkt1.b = vif.b;
   pkt1.y1 = vif.y1;
   pkt1.y2 = vif.y2;
   pkt1.y3 = vif.y3;
   
    // `uvm_info("mon1","mon1 transactions",UVM_NONE);
   //#5;
   item_collected_port1.write(pkt1);
   end
   endtask
   endclass