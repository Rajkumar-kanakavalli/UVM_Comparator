interface comp_intf;

logic [3:0]a;
logic [3:0]b;
logic y1,y2,y3;

modport dut (input a,input b,output y1,output y2,output y3);

endinterface