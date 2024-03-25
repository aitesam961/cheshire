`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 05:34:34 PM
// Design Name: 
// Module Name: axi_snoop
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


module axi_snoop #(
parameter type axi_mst_req_t = logic,
parameter type axi_mst_rsp_t = logic,

)(
    input clk_i,
    input axi_mst_req_t  axi_mst_req_i,
    input axi_mst_rsp_t  axi_mst_rsp_i,
    output axi_mst_req_t axi_mst_req_o,
    output axi_mst_rsp_t axi_mst_rsp_o,
    output logic [63:0] counter_reg_q_o,
    output logic [63:0] counter_clk_cycles_q_o,
    output logic [63:0] zero_o

    );
      
    //(* dont_touch = "yes" *) (* mark_debug = "true" *) logic [63:0] counter_reg_q_o ;
    //(* dont_touch = "yes" *) (* mark_debug = "true" *) logic [63:0] counter_reg_d ;
    //(* dont_touch = "yes" *) (* mark_debug = "true" *) logic [63:0] counter_clk_cycles_q_o;
    //(* dont_touch = "yes" *) (* mark_debug = "true" *) logic [63:0] counter_clk_cycles_q_o;

    //logic [63:0] counter_reg_q_o ;
    logic [63:0] counter_reg_d ;
    //logic [63:0] counter_clk_cycles_q_o;
    logic [63:0] counter_clk_cycles_d;
    //logic [63:0] zero_o;

    initial begin
      counter_reg_q_o = 64'b0;
      counter_reg_d = 64'b0;

      counter_clk_cycles_d = 64'b0;
      counter_clk_cycles_q_o = 64'b0;

      zero_o = 64'b0;
    end
 
    always_ff @(posedge clk_i) begin
        
        counter_clk_cycles_q_o <= counter_clk_cycles_d + 1;
        counter_clk_cycles_d <= counter_clk_cycles_q_o;

        if (axi_mst_req_i.aw_valid) begin
            counter_reg_q_o <= counter_reg_d + 1;
            counter_reg_d <= counter_reg_q_o;
        end
       
        if (axi_mst_rsp_i.b_valid) begin
            counter_reg_q_o <= counter_reg_d + 1;
            counter_reg_d <= counter_reg_q_o;
        end 
    end
    
    assign axi_mst_req_o = axi_mst_req_i;
    assign axi_mst_rsp_o = axi_mst_rsp_i;

endmodule