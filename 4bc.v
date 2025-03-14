module jk(q,q1,rst,clk,j,k);
output reg q;
output q1;
input rst,clk,j,k;
always@(negedge clk or rst)
begin 
if (rst)
q<=0;
else
begin
case({j,k})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=~q;
endcase
end
end
assign q1=~q;
endmodule
module mux(d0,d1,s,y);
output y;
input d0,d1,s;
assign y=(~s&d0)|(s&d1);
endmodule

module fbc(q,q1,j,k,clk,rst,m,q00,q01,q10,q11,q20,q21,y1,y2,y3);
output q,q1;
input j,k,clk,rst,m;
inout q00,q01,q10,q11,q20,q21,y1,y2,y3;
mux e(q00,q01,m,y1);
mux f(q10,q11,m,y2);
mux g(q20,q21,m,y3);
jk a(q00,q01,rst,clk,j,k);
jk b(q10,q11,rst,y1,j,k);
jk c(q20,q21,rst,y2,j,k);
jk d(q,q1,rst,y3,j,k);
endmodule