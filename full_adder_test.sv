`timescale 1ns/100ps

module full_adder_test;



 localparam WIDTH=4;

 logic [WIDTH-1:0] a;
 logic [WIDTH-1:0] b;
 logic             cin;
 logic             cout;
 logic [WIDTH-1:0] sum; 

 full_adder  UUT(.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

initial begin
    $monitor( "%t a=%h b=%h cin=%h, cout=%h, sum=%h",
       $time, a, b, cin, cout, sum); 
end

task outexpect(input exout, [WIDTH-1:0] expects);
     if ((sum !== expects)||(exout !== exout))
     begin
         $display ("full adder failed");
         $finish;
     end
endtask


initial begin
    a=0;b=0;cin=0; #10ns outexpect(0,0);
    a=0;b=0;cin=1; #10ns outexpect(0,1);
    a=0;b=1;cin=0; #10ns outexpect(0,1);
    a=1;b=0;cin=0; #10ns outexpect(0,1);
    a=1;b=0;cin=1; #10ns outexpect(0,2);
    a=1;b=1;cin=1; #10ns outexpect(0,3);
    a=7;b=4;cin=0; #10ns outexpect(0,'hb);
    a=4;b='he;cin=1; #10ns outexpect(1,3);
    a=4;b='he;cin=0; #10ns outexpect(1,2);
    a='h9;b='hb;cin=1; #10ns outexpect(1,5);
    a='hf;b='hf;cin=1; #10ns outexpect(1,'hf);
    $display("full adder passed");
end
endmodule