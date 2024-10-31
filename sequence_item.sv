
  
  class comp_seq_item extends uvm_sequence_item;
  //payload information
  rand bit [3:0]a,b;
  
  //analysis information
   bit y1,y2,y3;
   
   // utility  and field macros

     `uvm_object_utils_begin(comp_seq_item)
	 
	     `uvm_field_int(a,UVM_ALL_ON)
		 `uvm_field_int(b,UVM_ALL_ON)
		 `uvm_field_int(y1,UVM_ALL_ON)
		 `uvm_field_int(y2,UVM_ALL_ON)
		 `uvm_field_int(y3,UVM_ALL_ON)
		 
	`uvm_object_utils_end
	 
	 //constructor
	 
	 function new(string name = "comp_seq_item");
	     super.new(name);
	 endfunction
	 
	 
	 endclass
  