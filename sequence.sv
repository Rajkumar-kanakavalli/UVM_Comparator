
  
  class comp_sequence extends uvm_sequence #(comp_seq_item);
         `uvm_object_utils(comp_sequence)
		 
		 comp_seq_item pkt;//handle of seq_item to randomize
		 
		 /* function new(string name = "comp_sequence");
		        super.new(name)
		 endfunction */
		 
		 virtual task body();
		 
		 pkt =comp_seq_item::type_id::create("pkt");
		 
		  repeat(20)
		  begin
		  `uvm_do(req);
		  end
		  endtask
		  
		  endclass
		 