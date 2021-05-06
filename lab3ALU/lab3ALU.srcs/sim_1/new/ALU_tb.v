`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2021 02:15:01 PM
// Design Name: 
// Module Name: ALU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_tb();
    // Inputs to UUT
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] ALUCntl;

	// Outputs of UUT
	wire [31:0] ALUout;
	wire N;
	wire C;
	wire V;
	wire Z;

	//Intantiate UUT
	ALU uut(.A(A),
		    .B(B),		   
		    .ALUCntl(ALUCntl),
		    .ALUout(ALUout),
		    .V(V),
		    .C(C),
		    .N(N),
		    .Z(Z)
		    );



	initial begin
		$timeformat(-9, 1," ns", 9);;
        $display(" table");

		//Test Case 1
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b0000;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);
		
		//Test Case 2
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b0001;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);
		
		//Test Case 3
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b0011;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 4
		A = 32'h0000_0001; B = 32'hffff_ffff; ALUCntl = 4'b0010;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 5
		A = 32'h6389_754f; B = 32'had56_24e6; ALUCntl = 4'b0010;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 6
		A = 32'h0000_0001; B = 32'hffff_ffff; ALUCntl = 4'b0010;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 7
		A = 32'h6389_754f; B = 32'had56_24e6; ALUCntl = 4'b0010;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 8
		A = 32'hffff_ffff; B = 32'hffff_ffff; ALUCntl = 4'b0010;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 9
		A = 32'h0000_0000; B = 32'h0000_0001; ALUCntl = 4'b0110;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 10
		A = 32'hf968_4783; B = 32'hf998_d562; ALUCntl = 4'b0110;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 11
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b1100;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 12
		A = 32'h89bc_de34; B = 32'hc53b_d687; ALUCntl = 4'b0111;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 13
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b1101;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);

		//Test Case 14
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b1111;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);


		//Test Case 15
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b1010;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);
		//Test Case 16
		A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUCntl = 4'b1110;
		#5 $display("time = %0t, A = %h, B = %h, ALUCntl = %b, || ALUout = %h, C = %b, V = %b, Z = %b, N = %b", 
            $time, A, B, ALUCntl, ALUout, C, V, Z, N);
    end
endmodule
