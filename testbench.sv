module tb;
  reg clk;
  reg rstn;
  wire [3:0]out;
 
  ring_ctr   u0 (.clk (clk),
                .rstn (rstn),
                .out (out));
 
  initial begin
    clk=0;
  forever #1 clk = ~clk;
  end
 
  initial begin
    rstn=1;
    $monitor ("T=%0t rst=%b out=%b", $time,rstn,out);
    #4rstn=0;
    
    #10$finish;
  end
   initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
endmodule
