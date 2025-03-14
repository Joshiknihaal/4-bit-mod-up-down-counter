module fbc_tb();
wire q,q1;
reg j,k,clk,rst,m;
wire q00,q01,q10,q11,q20,q21;
fbc dut(q,q1,j,k,clk,rst,m,q00,q01,q10,q11,q20,q21,y1,y2,y3);
initial clk=0;
always #5 clk=~clk;

initial begin
rst=1;
#5 rst=0;
j=1;k=1;
m=0;
#160 m=1;
#170 $finish;
end
initial
begin
$monitor($time,"q=%b,q20=%b,q10=%b,q00=%b,j=%b,k=%b,m=%b",q,q20,q10,q00,j,k,m);
$dumpfile("dump.vcd");
$dumpvars();
end
endmodule