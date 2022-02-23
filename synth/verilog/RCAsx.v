module RCAsx
  (input  [7:0] a,
   input  [7:0] b,
   input  ci,
   output [8:0] s);
  wire [8:0] g;
  wire [8:0] p;
  wire [8:0] c;
  wire n1_o;
  wire [7:0] n2_o;
  wire [8:0] n3_o;
  wire n4_o;
  wire [7:0] n5_o;
  wire [8:0] n6_o;
  wire [7:0] n7_o;
  wire [7:0] n8_o;
  wire [7:0] n9_o;
  wire [7:0] n10_o;
  wire [7:0] n11_o;
  wire [8:0] n12_o;
  wire [8:0] n13_o;
  assign s = n12_o;
  /* src/RCAsx/RCAsx_Behavior.vhd:2:12  */
  assign g = n3_o; // (signal)
  /* src/RCAsx/RCAsx_Behavior.vhd:2:15  */
  assign p = n6_o; // (signal)
  /* src/RCAsx/RCAsx_Behavior.vhd:2:18  */
  assign c = n13_o; // (signal)
  /* src/RCAsx/RCAsx_Behavior.vhd:5:11  */
  assign n1_o = g[7];
  /* src/RCAsx/RCAsx_Behavior.vhd:5:22  */
  assign n2_o = a & b;
  /* src/RCAsx/RCAsx_Behavior.vhd:5:17  */
  assign n3_o = {n1_o, n2_o};
  /* src/RCAsx/RCAsx_Behavior.vhd:6:11  */
  assign n4_o = p[7];
  /* src/RCAsx/RCAsx_Behavior.vhd:6:22  */
  assign n5_o = a ^ b;
  /* src/RCAsx/RCAsx_Behavior.vhd:6:17  */
  assign n6_o = {n4_o, n5_o};
  /* src/RCAsx/RCAsx_Behavior.vhd:10:23  */
  assign n7_o = g[7:0];
  /* src/RCAsx/RCAsx_Behavior.vhd:11:24  */
  assign n8_o = p[7:0];
  /* src/RCAsx/RCAsx_Behavior.vhd:12:24  */
  assign n9_o = c[7:0];
  /* src/RCAsx/RCAsx_Behavior.vhd:11:39  */
  assign n10_o = n8_o & n9_o;
  /* src/RCAsx/RCAsx_Behavior.vhd:10:38  */
  assign n11_o = n7_o | n10_o;
  /* src/RCAsx/RCAsx_Behavior.vhd:14:12  */
  assign n12_o = p ^ c;
  assign n13_o = {n11_o, ci};
endmodule

