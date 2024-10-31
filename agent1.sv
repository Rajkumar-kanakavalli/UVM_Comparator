class comp_agent1 extends uvm_agent;

//utility macros
`uvm_component_utils(comp_agent1)

//active agent components

comp_sequencer seqr;
comp_driver drv;
comp_mon1  mon1;

//constructor
function new(string name= "comp_agent1",uvm_component parent);
  super.new(name,parent);
  endfunction
  
  //Build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);
	
	seqr = comp_sequencer::type_id::create("seqr",this);
	drv  = comp_driver::type_id::create("drv",this);
	mon1 = comp_mon1::type_id::create("mon1",this);
	endfunction
	
	//connect phase to connect the driver and sequencer
	virtual function void connect_phase(uvm_phase phase);
	   super.connect_phase(phase);
	   drv.seq_item_port.connect(seqr.seq_item_export);
	   endfunction
	   
endclass


