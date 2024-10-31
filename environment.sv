class comp_env extends uvm_env;

//utility macros
`uvm_component_utils(comp_env)

//environment components
comp_agent1 agent1;
comp_agent2 agent2;
comp_scb    scb;

//constructor
function new(string name = "comp_env",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  agent1 = comp_agent1::type_id::create("agent",this);
  agent2 = comp_agent2::type_id::create("agent2",this);
  scb    = comp_scb::type_id::create("scb",this);
  endfunction
  
  //connect_phase
  virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
	 agent1.mon1.item_collected_port1.connect(scb.ip_fifo.analysis_export);
	  agent2.mon2.item_collected_port2.connect(scb.op_fifo.analysis_export);
  endfunction
	  
	  endclass
	  