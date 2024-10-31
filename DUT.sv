module comp_dut(comp_intf.dut intf);

always @(*)

begin
       if(intf.a < vif.b)
          begin
		  vif.y1=1'b1;
		  vif.y2=1'b0;
		  vif.y3=1'b0;
		 
          end
		 else if(vif.a == vif.b)
		 
		   begin
		   vif.y1 =1'b0;
		   vif.y2 =1'b1;
		   vif.y3 = 1'b0;
		   end
		
	    else if(vif.a > vif.b)
		   begin
		   vif.y1 = 1'b0;
		   vif.y2 = 1'b0;
		   vif.y3 = 1'b1;
		  
		   end
		   end
		   endmodule
		   
		   
		   