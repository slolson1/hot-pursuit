/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module rom_star_bar
(
		input [12:0] read_address,
		input Clk,

		output logic [23:0] data_out
);

// mem has width of 3 bits and a total of 6144 addresses
logic [3:0] mem [0:6143], data;
//0-1535:    0 stars
//1536-3071: 1 star
//3072-4607: 2 stars
//4608-6143: 3 stars

initial
begin
	 $readmemh("rom_star_bar_txt.txt", mem);
end

always_ff @ (posedge Clk) begin
	data <= mem[read_address];
end

always_comb begin
	unique case (data)
		4'd0: data_out <= 24'hb57e41;
		4'd1: data_out <= 24'he7ceb7;
		4'd2: data_out <= 24'h75542b;
		4'd3: data_out <= 24'hbab2a9;
		4'd4: data_out <= 24'h494133;
		4'd5: data_out <= 24'hfabb21;
		4'd6: data_out <= 24'hf36f21;
		4'd7: data_out <= 24'hfeee90;
		4'd8: data_out <= 24'hfbef32;
	endcase
end

endmodule
