module full_adder(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic       cin,
    output logic      cout,
    output logic [3:0] sum 
);


always@(a or b or cin) begin
    {cout, sum}= a+b+cin;
end
endmodule
