class comp_driver extends uvm_driver #(comp_seq_item);

//virtual interface 
virtual  comp_intf vif;

comp_seq_item pkt;

//utility macros
`uvm_component_utils(comp_driver);

//constructor
function new (string name= "comp_driver",uvm_component parent);
    super.new(name,parent);
	
endfunction

//Build phase

virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
 
 uvm_config_db #(virtual comp_intf)::get(this,"","vif",vif);
 
 endfunction
 
 //run phase 
 virtual task run_phase (uvm_phase phase);
  pkt= comp_seq_item::type_id::create("pkt");
  
  forever begin
  seq_item_port.get_next_item(pkt);
  #5;
  vif.a=pkt.a;
  vif.b=pkt.b;
  seq_item_port.item_done();
  end
  endtask
  endclass
  
  
