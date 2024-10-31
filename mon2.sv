class comp_mon2 extends uvm_monitor;

//utility macros
`uvm_component_utils(comp_mon2)

comp_seq_item pkt2;

virtual comp_intf vif;

uvm_analysis_port#(comp_seq_item) item_collected_port2;

//constructor
function new(string name= "comp_mon2",uvm_component parent);
  super.new(name,parent);
  endfunction
  
  //Build phase
  virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   uvm_config_db #(virtual comp_intf)::get(this,"","vif",vif);
   item_collected_port2 = new("item_collected_port2",this);
   endfunction
   
   task run_phase(uvm_phase phase);
   pkt2 = comp_seq_item::type_id::create("pkt2");
   forever begin
   
   #5;
   pkt2.a = vif.a;
   pkt2.b = vif.b;
   pkt2.y1 = vif.y1;
   pkt2.y2 = vif.y2;
   pkt2.y3 = vif.y3;
   
   //`uvm_info("mon2","mon2 transactions ",UVM_NONE);
   //#5;
   item_collected_port2.write(pkt2);
   
   end
   endtask
   endclass
   
   
   