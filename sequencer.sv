
  
  class comp_sequencer extends uvm_sequencer #(comp_seq_item);
  //utility macros
      `uvm_component_utils(comp_sequencer)
	  
	 // constructor
	 
	 function new(string name = "comp_sequencer",uvm_component parent);
	    super.new(name, parent);
	endfunction

  endclass 



  