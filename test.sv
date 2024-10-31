class base_test extends uvm_test;

//utility macros
`uvm_component_utils(base_test)

//creating the handles
comp_env env; //environment handle for buid the entire environment
comp_sequence seq;  //sequence handle to start the sequence

//constructor
function new(string name="base_test",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  env=comp_env::type_id::create("env",this);
  seq=comp_sequence::type_id::create("seq",this);
  endfunction:build_phase
  
  //Run Phase
  task run_phase(uvm_phase phase);
  phase.raise_objection(this);
    seq.start(env.agent1.seqr); //start of the sequence
	#1;
	phase.drop_objection(this);
	endtask
endclass
