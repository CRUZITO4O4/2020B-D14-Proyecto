module ALU(
	input [31:0]op1, op2,
	input [3:0]sel,
	output reg [31:0]R_OP,
	output reg ZF
);

always @*
	begin
	case(sel)
		4'b0010:
			R_OP[31:0] = op1[31:0] + op2[31:0];
	
		4'b0110:
			R_OP[31:0] = op1[31:0] - op2[31:0];
	
		4'b0000:
			R_OP[31:0] = op1[31:0] & op2[31:0];

		4'b0001:
			R_OP[31:0] = op1[31:0] | op2[31:0];
	
		4'b0111:
			R_OP[31:0] = op1[31:0] < op2[31:0];
			
		default: R_OP[31:0] = op1[31:0] + op2[31:0];
	endcase
	
	if (R_OP == 0)
		ZF = 1;
		else 
		ZF = 0;
	end

endmodule
