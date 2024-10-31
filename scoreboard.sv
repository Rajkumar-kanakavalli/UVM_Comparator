class comp_scb extends uvm_scoreboard;

//utility macros

`uvm_component_utils(comp_scb)

comp_seq_item pkt1,pkt2; //seq_item handles for comparison

uvm_tlm_analysis_fifo#(comp_seq_item)ip_fifo; //for connection of mon1 to scoreboard
uvm_tlm_analysis_fifo#(comp_seq_item)op_fifo; //for connection of mon2 to scoreboard


//constructor
function new (string name = "comp_scb",uvm_component parent);
 super.new(name,parent);
 ip_fifo= new("ip_fifo",this);
 op_fifo= new("op_fifo",this);
 endfunction
 
 //Build Phase
 virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  pkt1= comp_seq_item::type_id::create("pkt1",this);
  pkt2= comp_seq_item::type_id::create("pkt2",this);
  endfunction
  
  //run_phase
  task run_phase(uvm_phase phase);
  forever begin
  
  fork
  ip_fifo.get(pkt1); //taking the data from mon1
  op_fifo.get(pkt2);  //taking the data from mon2
  join
  
  if(pkt2.y1==pkt1.y1 && pkt2.y2==pkt1.y2 && pkt2.y3==pkt1.y3) //comparison of y1,y2,y3 in mon1& mon2
    begin
	`uvm_info("SCB: DATA MATCHED",$sformatf("a=%0d,b=%0d, a=%0d,b=%0d, dut y1=%0d,ref y1=%0d, dut y2=%0d,ref y2=%0d, dut y3=%0d,ref y3=%0d",pkt2.a,pkt2.b, pkt1.a,pkt1.b,pkt2.y1,pkt1.y1,pkt2.y2,pkt1.y2,pkt2.y3,pkt1.y3),UVM_NONE);
	 end
	else
	    begin
		`uvm_info("SCB: DATA MISMATCHED",$sformatf("a=%0d,b=%0d, a=%0d,b=%0d, dut y1=%0d,ref y1=%0d, dut y2=%0d,ref y2=%0d, dut y3=%0d,ref y3=%0d", pkt2.a,pkt2.b, pkt1.a,pkt1.b,pkt2.y1,pkt1.y1,pkt2.y2,pkt1.y2,pkt2.y3,pkt1.y3),UVM_NONE);
		end
		
    end
	endtask
	
endclass
  
  
  