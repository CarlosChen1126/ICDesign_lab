//IC LAB HW1

module alu(
             clk_p_i,
             reset_n_i,
             data_a_i,
             data_b_i,
             inst_i,
             data_o
             );

  /*========================IO declaration============================ */	  
      input           clk_p_i;
      input           reset_n_i;
      input   [7:0]   data_a_i;
      input   [7:0]   data_b_i;
      input   [2:0]   inst_i;

      output  [15:0]  data_o;

  /* =======================REG & wire================================ */
	  
      //declare reg&wire you need
      reg [2:0] reg_inst;
      reg [2:0] state_inst;
      reg [7:0]   reg_data_a;
      reg [7:0]   reg_data_b;
      //wire [2:0] state;

      reg [15:0] ALU_out_inst;

      wire [15:0] ALU_w;
      reg [15:0] ALU_r;

      wire [15:0] out_inst_0;
      wire [15:0] out_inst_1;
      wire [15:0] out_inst_2;
      wire [15:0] out_inst_3;
      wire [15:0] out_inst_4;
      wire [15:0] out_inst_5;
      wire [15:0] out_inst_6;
      wire [15:0] out_inst_7;
      wire [15:0] reg_subtraction;  

      assign ALU_w = ALU_out_inst;
      assign data_o = ALU_r; 
	  
	    assign out_inst_0 = {8'b0 , reg_data_a[7:0]} + {8'b0 , reg_data_b[7:0]};
      assign out_inst_1 = {8'b0 , reg_data_b[7:0]} - {8'b0 , reg_data_a[7:0]};
      assign out_inst_2 = {8'b0 , reg_data_a[7:0]} * {8'b0 , reg_data_b[7:0]};
      assign out_inst_3 = {{9{reg_data_a[7]}}, reg_data_a[7:1]};
      assign reg_subtraction = {8'b0 , reg_data_b[7:0]} - {8'b0 , reg_data_a[7:0]};
      assign out_inst_4 = ~reg_subtraction[15:0];
      assign out_inst_5[15:8] = 8'b0;
      assign out_inst_5[ 7:0] = reg_data_a[7:0] ^ reg_data_b[7:0];
      assign out_inst_6 =  reg_subtraction[15] ? ~reg_subtraction[15:0]+1 : reg_subtraction[15:0];
	  
  /* ====================Combinational Part================== */
  //next-state logic
  always @(*) begin
    case (reg_inst)
      3'b000: state_inst = inst_i;
      3'b001: state_inst = inst_i;
      3'b010:begin
        if(inst_i === 3'b000)
          state_inst = inst_i;
        else if (inst_i === 3'b001)
          state_inst = inst_i;
        else if (inst_i === 3'b011)
          state_inst = inst_i;
        else if (inst_i === 3'b101)
          state_inst = inst_i;
        else if (inst_i === 3'b111)
          state_inst = inst_i;
        else
          state_inst = reg_inst;
      end
      3'b011:begin
        if(inst_i === 3'b000)
          state_inst = inst_i;
        else if (inst_i === 3'b001)
          state_inst = inst_i;
        else if (inst_i === 3'b110)
          state_inst = inst_i;
        else if (inst_i === 3'b111)
          state_inst = inst_i;
        else
          state_inst = reg_inst;
      end
      3'b100:begin
        if(inst_i === 3'b001)
          state_inst = inst_i;
        else if (inst_i === 3'b101)
          state_inst = inst_i;
        else if (inst_i === 3'b111)
          state_inst = inst_i;
        else 
          state_inst = reg_inst;
      end
      3'b101:begin
        if(inst_i === 3'b000)
          state_inst = inst_i;
        else if (inst_i === 3'b001)
          state_inst = inst_i;
        else if (inst_i === 3'b010)
          state_inst = inst_i;
        else if (inst_i === 3'b111)
          state_inst = inst_i;
        else
          state_inst = reg_inst;
      end
      3'b110:begin
        if(inst_i === 3'b001)
          state_inst = inst_i;
        else if (inst_i === 3'b101)
          state_inst = inst_i;
        else
          state_inst = reg_inst;
      end
      3'b111: state_inst = reg_inst;
   
    default: state_inst = reg_inst;
    endcase
  end
  			  //todo  
			  
			  
			  
  // output logic
  always @(*) begin
    case(reg_inst)
      3'b000:    ALU_out_inst = out_inst_0;           
      3'b001:    ALU_out_inst = out_inst_1;
      3'b010:    ALU_out_inst = out_inst_2;
      3'b011:    ALU_out_inst = out_inst_3;
      3'b100:    ALU_out_inst = out_inst_4;
      3'b101:    ALU_out_inst = out_inst_5;
      3'b110:    ALU_out_inst = out_inst_6;
      3'b111:    ALU_out_inst = ALU_r;
      default:   ALU_out_inst = 0;
    endcase
  end

   			  //todo
  /* ====================Sequential Part=================== */
    always@(posedge clk_p_i or negedge reset_n_i)
    begin
        if (reset_n_i == 1'b0)
        begin
			     //todo
          ALU_r <= 16'b0; 
          reg_data_a <= 8'b0;
          reg_data_b <= 8'b0;
          reg_inst <= 3'b0;
        end
        else
        begin
          //todo
          ALU_r <= ALU_w; 
          reg_data_a <= data_a_i;
          reg_data_b <= data_b_i;
          reg_inst <= state_inst;
        end
    end
  /* ====================================================== */

endmodule

