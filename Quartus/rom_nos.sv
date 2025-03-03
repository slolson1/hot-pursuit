/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module rom_nos
(
		input [11:0] read_address,
		input Clk,

		output logic [23:0] data_out
);

// mem has width of 3 bits and a total of 2160 addresses
logic [3:0] mem [0:2159], data;

initial
begin
	 $readmemh("rom_nos_txt.txt", mem);
end

always_ff @ (posedge Clk) begin
	data <= mem[read_address];
end

always_comb begin
	unique case (data)
		4'd0: data_out <= 24'hff0000;
		4'd1: data_out <= 24'h2d83f1;
		4'd2: data_out <= 24'h052a60;
		4'd3: data_out <= 24'h7c4621;
		4'd4: data_out <= 24'hebd0bc;
		4'd5: data_out <= 24'hffffff;
		4'd6: data_out <= 24'h000000;
		4'd7: data_out <= 24'h4a4a46;
		4'd8: data_out <= 24'h6ea3ea;
	endcase
end

endmodule
