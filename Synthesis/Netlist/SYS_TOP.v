/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Sep 29 19:45:00 2025
/////////////////////////////////////////////////////////////


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \SYNC_RST_FF[0] ;

  DFFRQX2M \SYNC_RST_FF_reg[1]  ( .D(\SYNC_RST_FF[0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC_RST) );
  DFFRQX2M \SYNC_RST_FF_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(
        \SYNC_RST_FF[0] ) );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \SYNC_RST_FF[0] ;

  DFFRQX2M \SYNC_RST_FF_reg[1]  ( .D(\SYNC_RST_FF[0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC_RST) );
  DFFRQX2M \SYNC_RST_FF_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(
        \SYNC_RST_FF[0] ) );
endmodule


module ClkDiv_DivRatio_Width8_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_DivRatio_Width8_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N4, div_clk_internal, flag, flag_odd, N25, N26, N27, N28, N29, N30,
         N31, N32, N56, N57, N58, N59, N60, N61, N62, N63, n55, n56,
         \sub_24/carry[7] , \sub_24/carry[6] , \sub_24/carry[5] ,
         \sub_24/carry[4] , \sub_24/carry[3] , \sub_24/carry[2] ,
         \sub_24/carry[1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76;
  wire   [7:0] half_toggle_p1;
  wire   [7:0] counter;
  wire   [7:0] prev_div_ratio;

  ClkDiv_DivRatio_Width8_0_DW01_inc_0 r86 ( .A(counter), .SUM({N32, N31, N30, 
        N29, N28, N27, N26, N25}) );
  DFFRQX2M div_clk_internal_reg ( .D(n55), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_clk_internal) );
  DFFRQX2M flag_reg ( .D(n56), .CK(i_ref_clk), .RN(i_rst_n), .Q(flag) );
  DFFSRHQX2M \prev_div_ratio_reg[0]  ( .D(i_div_ratio[0]), .CK(i_ref_clk), 
        .SN(n61), .RN(n60), .Q(prev_div_ratio[0]) );
  DFFSRHQX2M \prev_div_ratio_reg[3]  ( .D(i_div_ratio[3]), .CK(i_ref_clk), 
        .SN(n67), .RN(n66), .Q(prev_div_ratio[3]) );
  DFFSRHQX2M \prev_div_ratio_reg[2]  ( .D(i_div_ratio[2]), .CK(i_ref_clk), 
        .SN(n65), .RN(n64), .Q(prev_div_ratio[2]) );
  DFFSRHQX2M \prev_div_ratio_reg[1]  ( .D(i_div_ratio[1]), .CK(i_ref_clk), 
        .SN(n63), .RN(n62), .Q(prev_div_ratio[1]) );
  DFFSRHQX2M \prev_div_ratio_reg[7]  ( .D(i_div_ratio[7]), .CK(i_ref_clk), 
        .SN(n75), .RN(n74), .Q(prev_div_ratio[7]) );
  DFFSRHQX2M \prev_div_ratio_reg[6]  ( .D(i_div_ratio[6]), .CK(i_ref_clk), 
        .SN(n73), .RN(n72), .Q(prev_div_ratio[6]) );
  DFFSRHQX2M \prev_div_ratio_reg[5]  ( .D(i_div_ratio[5]), .CK(i_ref_clk), 
        .SN(n71), .RN(n70), .Q(prev_div_ratio[5]) );
  DFFSRHQX2M \prev_div_ratio_reg[4]  ( .D(i_div_ratio[4]), .CK(i_ref_clk), 
        .SN(n69), .RN(n68), .Q(prev_div_ratio[4]) );
  DFFRQX2M \counter_reg[7]  ( .D(N63), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[7]) );
  DFFSQX2M \counter_reg[0]  ( .D(N56), .CK(i_ref_clk), .SN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[6]  ( .D(N62), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[5]  ( .D(N61), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(N60), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[3]  ( .D(N59), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[2]  ( .D(N58), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(N57), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  DFFRX1M flag_odd_reg ( .D(n76), .CK(i_ref_clk), .RN(i_rst_n), .Q(flag_odd), 
        .QN(n24) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk_internal), .S0(N4), .Y(o_div_clk) );
  ADDFX2M U4 ( .A(i_div_ratio[1]), .B(n8), .CI(\sub_24/carry[1] ), .CO(
        \sub_24/carry[2] ), .S(half_toggle_p1[1]) );
  ADDFX2M U5 ( .A(i_div_ratio[2]), .B(n9), .CI(\sub_24/carry[2] ), .CO(
        \sub_24/carry[3] ), .S(half_toggle_p1[2]) );
  INVX2M U6 ( .A(i_rst_n), .Y(n1) );
  NAND3X2M U7 ( .A(n16), .B(N4), .C(n21), .Y(n19) );
  ADDFX2M U8 ( .A(i_div_ratio[3]), .B(n5), .CI(\sub_24/carry[3] ), .CO(
        \sub_24/carry[4] ), .S(half_toggle_p1[3]) );
  INVX2M U9 ( .A(i_div_ratio[4]), .Y(n5) );
  ADDFX2M U10 ( .A(i_div_ratio[5]), .B(n3), .CI(\sub_24/carry[5] ), .CO(
        \sub_24/carry[6] ), .S(half_toggle_p1[5]) );
  INVX2M U11 ( .A(i_div_ratio[6]), .Y(n3) );
  ADDFX2M U12 ( .A(i_div_ratio[4]), .B(n4), .CI(\sub_24/carry[4] ), .CO(
        \sub_24/carry[5] ), .S(half_toggle_p1[4]) );
  INVX2M U13 ( .A(i_div_ratio[5]), .Y(n4) );
  ADDFX2M U14 ( .A(i_div_ratio[6]), .B(n2), .CI(\sub_24/carry[6] ), .CO(
        \sub_24/carry[7] ), .S(half_toggle_p1[6]) );
  INVX2M U15 ( .A(i_div_ratio[7]), .Y(n2) );
  XNOR2X1M U16 ( .A(i_div_ratio[7]), .B(\sub_24/carry[7] ), .Y(
        half_toggle_p1[7]) );
  OR2X1M U17 ( .A(n7), .B(i_div_ratio[0]), .Y(\sub_24/carry[1] ) );
  XNOR2X1M U18 ( .A(i_div_ratio[0]), .B(n7), .Y(half_toggle_p1[0]) );
  CLKNAND2X2M U19 ( .A(n1), .B(n6), .Y(n60) );
  CLKNAND2X2M U20 ( .A(i_div_ratio[0]), .B(n1), .Y(n61) );
  CLKNAND2X2M U21 ( .A(n1), .B(n7), .Y(n62) );
  CLKNAND2X2M U22 ( .A(i_div_ratio[1]), .B(n1), .Y(n63) );
  CLKNAND2X2M U23 ( .A(n1), .B(n8), .Y(n64) );
  CLKNAND2X2M U24 ( .A(i_div_ratio[2]), .B(n1), .Y(n65) );
  CLKNAND2X2M U25 ( .A(n1), .B(n9), .Y(n66) );
  CLKNAND2X2M U26 ( .A(i_div_ratio[3]), .B(n1), .Y(n67) );
  NAND2BX1M U27 ( .AN(i_div_ratio[4]), .B(n1), .Y(n68) );
  CLKNAND2X2M U28 ( .A(i_div_ratio[4]), .B(n1), .Y(n69) );
  NAND2BX1M U29 ( .AN(i_div_ratio[5]), .B(n1), .Y(n70) );
  CLKNAND2X2M U30 ( .A(i_div_ratio[5]), .B(n1), .Y(n71) );
  NAND2BX1M U31 ( .AN(i_div_ratio[6]), .B(n1), .Y(n72) );
  CLKNAND2X2M U32 ( .A(i_div_ratio[6]), .B(n1), .Y(n73) );
  NAND2BX1M U33 ( .AN(i_div_ratio[7]), .B(n1), .Y(n74) );
  CLKNAND2X2M U34 ( .A(i_div_ratio[7]), .B(n1), .Y(n75) );
  MXI2X1M U35 ( .A(n10), .B(n11), .S0(n12), .Y(n76) );
  OAI21X1M U36 ( .A0(n6), .A1(n13), .B0(flag_odd), .Y(n10) );
  MXI2X1M U37 ( .A(n14), .B(n15), .S0(flag), .Y(n56) );
  NAND3X1M U38 ( .A(N4), .B(n15), .C(n16), .Y(n14) );
  NAND3X1M U39 ( .A(n16), .B(N4), .C(n17), .Y(n15) );
  AOI21X1M U40 ( .A0(flag_odd), .A1(i_div_ratio[0]), .B0(n18), .Y(n17) );
  MXI2X1M U41 ( .A(n19), .B(n20), .S0(n11), .Y(n55) );
  CLKINVX1M U42 ( .A(div_clk_internal), .Y(n11) );
  OAI21X1M U43 ( .A0(N4), .A1(n12), .B0(n19), .Y(n20) );
  NOR2BX1M U44 ( .AN(N32), .B(n19), .Y(N63) );
  NOR2BX1M U45 ( .AN(N31), .B(n19), .Y(N62) );
  NOR2BX1M U46 ( .AN(N30), .B(n19), .Y(N61) );
  NOR2BX1M U47 ( .AN(N29), .B(n19), .Y(N60) );
  NOR2BX1M U48 ( .AN(N28), .B(n19), .Y(N59) );
  NOR2BX1M U49 ( .AN(N27), .B(n19), .Y(N58) );
  NOR2BX1M U50 ( .AN(N26), .B(n19), .Y(N57) );
  OR2X1M U51 ( .A(N25), .B(n19), .Y(N56) );
  AOI32X1M U52 ( .A0(n22), .A1(n6), .A2(n23), .B0(n18), .B1(n24), .Y(n21) );
  AND2X1M U53 ( .A(n25), .B(i_div_ratio[0]), .Y(n18) );
  MXI2X1M U54 ( .A(n26), .B(n27), .S0(flag), .Y(n25) );
  CLKNAND2X2M U55 ( .A(n28), .B(n29), .Y(n27) );
  NOR4X1M U56 ( .A(n30), .B(n31), .C(n32), .D(n33), .Y(n29) );
  CLKXOR2X2M U57 ( .A(half_toggle_p1[3]), .B(counter[3]), .Y(n33) );
  CLKXOR2X2M U58 ( .A(half_toggle_p1[2]), .B(counter[2]), .Y(n32) );
  CLKXOR2X2M U59 ( .A(half_toggle_p1[1]), .B(counter[1]), .Y(n31) );
  CLKXOR2X2M U60 ( .A(half_toggle_p1[0]), .B(counter[0]), .Y(n30) );
  NOR4X1M U61 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n28) );
  CLKXOR2X2M U62 ( .A(half_toggle_p1[7]), .B(counter[7]), .Y(n37) );
  CLKXOR2X2M U63 ( .A(half_toggle_p1[6]), .B(counter[6]), .Y(n36) );
  CLKXOR2X2M U64 ( .A(half_toggle_p1[5]), .B(counter[5]), .Y(n35) );
  CLKXOR2X2M U65 ( .A(half_toggle_p1[4]), .B(counter[4]), .Y(n34) );
  CLKNAND2X2M U66 ( .A(n23), .B(n22), .Y(n26) );
  AND4X1M U67 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n23) );
  XNOR2X1M U68 ( .A(counter[0]), .B(i_div_ratio[1]), .Y(n41) );
  XNOR2X1M U69 ( .A(counter[1]), .B(i_div_ratio[2]), .Y(n40) );
  XNOR2X1M U70 ( .A(counter[2]), .B(i_div_ratio[3]), .Y(n39) );
  CLKINVX1M U71 ( .A(counter[7]), .Y(n38) );
  AND4X1M U72 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n22) );
  XNOR2X1M U73 ( .A(counter[3]), .B(i_div_ratio[4]), .Y(n45) );
  XNOR2X1M U74 ( .A(counter[4]), .B(i_div_ratio[5]), .Y(n44) );
  XNOR2X1M U75 ( .A(counter[5]), .B(i_div_ratio[6]), .Y(n43) );
  XNOR2X1M U76 ( .A(counter[6]), .B(i_div_ratio[7]), .Y(n42) );
  CLKINVX1M U77 ( .A(n12), .Y(n16) );
  CLKNAND2X2M U78 ( .A(n46), .B(n47), .Y(n12) );
  NOR4X1M U79 ( .A(n48), .B(n49), .C(n50), .D(n51), .Y(n47) );
  XNOR2X1M U80 ( .A(prev_div_ratio[3]), .B(n9), .Y(n51) );
  XNOR2X1M U81 ( .A(prev_div_ratio[2]), .B(n8), .Y(n50) );
  XNOR2X1M U82 ( .A(prev_div_ratio[1]), .B(n7), .Y(n49) );
  XNOR2X1M U83 ( .A(prev_div_ratio[0]), .B(n6), .Y(n48) );
  CLKINVX1M U84 ( .A(i_div_ratio[0]), .Y(n6) );
  NOR4X1M U85 ( .A(n52), .B(n53), .C(n54), .D(n57), .Y(n46) );
  CLKXOR2X2M U86 ( .A(prev_div_ratio[7]), .B(i_div_ratio[7]), .Y(n57) );
  CLKXOR2X2M U87 ( .A(prev_div_ratio[6]), .B(i_div_ratio[6]), .Y(n54) );
  CLKXOR2X2M U88 ( .A(prev_div_ratio[5]), .B(i_div_ratio[5]), .Y(n53) );
  CLKXOR2X2M U89 ( .A(prev_div_ratio[4]), .B(i_div_ratio[4]), .Y(n52) );
  CLKINVX1M U90 ( .A(n13), .Y(N4) );
  CLKNAND2X2M U91 ( .A(i_clk_en), .B(n58), .Y(n13) );
  NAND4X1M U92 ( .A(n8), .B(n9), .C(n7), .D(n59), .Y(n58) );
  NOR4X1M U93 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n59) );
  CLKINVX1M U94 ( .A(i_div_ratio[1]), .Y(n7) );
  CLKINVX1M U95 ( .A(i_div_ratio[3]), .Y(n9) );
  CLKINVX1M U96 ( .A(i_div_ratio[2]), .Y(n8) );
endmodule


module ClkDiv_DivRatio_Width8_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_DivRatio_Width8_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N4, div_clk_internal, flag, flag_odd, N25, N26, N27, N28, N29, N30,
         N31, N32, N56, N57, N58, N59, N60, N61, N62, N63, \sub_24/carry[7] ,
         \sub_24/carry[6] , \sub_24/carry[5] , \sub_24/carry[4] ,
         \sub_24/carry[3] , \sub_24/carry[2] , \sub_24/carry[1] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79;
  wire   [7:0] half_toggle_p1;
  wire   [7:0] counter;
  wire   [7:0] prev_div_ratio;

  ClkDiv_DivRatio_Width8_1_DW01_inc_0 r86 ( .A(counter), .SUM({N32, N31, N30, 
        N29, N28, N27, N26, N25}) );
  DFFRQX2M div_clk_internal_reg ( .D(n79), .CK(i_ref_clk), .RN(n1), .Q(
        div_clk_internal) );
  DFFRQX2M flag_odd_reg ( .D(n61), .CK(i_ref_clk), .RN(n1), .Q(flag_odd) );
  DFFRQX2M flag_reg ( .D(n78), .CK(i_ref_clk), .RN(n1), .Q(flag) );
  DFFSRHQX2M \prev_div_ratio_reg[0]  ( .D(i_div_ratio[0]), .CK(i_ref_clk), 
        .SN(n63), .RN(n62), .Q(prev_div_ratio[0]) );
  DFFSRHQX2M \prev_div_ratio_reg[7]  ( .D(i_div_ratio[7]), .CK(i_ref_clk), 
        .SN(n77), .RN(n76), .Q(prev_div_ratio[7]) );
  DFFSRHQX2M \prev_div_ratio_reg[6]  ( .D(i_div_ratio[6]), .CK(i_ref_clk), 
        .SN(n75), .RN(n74), .Q(prev_div_ratio[6]) );
  DFFSRHQX2M \prev_div_ratio_reg[5]  ( .D(i_div_ratio[5]), .CK(i_ref_clk), 
        .SN(n73), .RN(n72), .Q(prev_div_ratio[5]) );
  DFFSRHQX2M \prev_div_ratio_reg[4]  ( .D(i_div_ratio[4]), .CK(i_ref_clk), 
        .SN(n71), .RN(n70), .Q(prev_div_ratio[4]) );
  DFFSRHQX2M \prev_div_ratio_reg[3]  ( .D(i_div_ratio[3]), .CK(i_ref_clk), 
        .SN(n69), .RN(n68), .Q(prev_div_ratio[3]) );
  DFFSRHQX2M \prev_div_ratio_reg[2]  ( .D(i_div_ratio[2]), .CK(i_ref_clk), 
        .SN(n67), .RN(n66), .Q(prev_div_ratio[2]) );
  DFFSRHQX2M \prev_div_ratio_reg[1]  ( .D(i_div_ratio[1]), .CK(i_ref_clk), 
        .SN(n65), .RN(n64), .Q(prev_div_ratio[1]) );
  DFFRQX2M \counter_reg[7]  ( .D(N63), .CK(i_ref_clk), .RN(n1), .Q(counter[7])
         );
  DFFSQX2M \counter_reg[0]  ( .D(N56), .CK(i_ref_clk), .SN(n1), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[6]  ( .D(N62), .CK(i_ref_clk), .RN(n1), .Q(counter[6])
         );
  DFFRQX2M \counter_reg[5]  ( .D(N61), .CK(i_ref_clk), .RN(n1), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[4]  ( .D(N60), .CK(i_ref_clk), .RN(n1), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[3]  ( .D(N59), .CK(i_ref_clk), .RN(n1), .Q(counter[3])
         );
  DFFRQX2M \counter_reg[2]  ( .D(N58), .CK(i_ref_clk), .RN(n1), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[1]  ( .D(N57), .CK(i_ref_clk), .RN(n1), .Q(counter[1])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk_internal), .S0(N4), .Y(o_div_clk) );
  INVX2M U4 ( .A(n2), .Y(n1) );
  INVX2M U5 ( .A(i_rst_n), .Y(n2) );
  NAND3X2M U6 ( .A(n9), .B(N4), .C(n22), .Y(n20) );
  ADDFX2M U7 ( .A(i_div_ratio[1]), .B(n13), .CI(\sub_24/carry[1] ), .CO(
        \sub_24/carry[2] ), .S(half_toggle_p1[1]) );
  ADDFX2M U8 ( .A(i_div_ratio[3]), .B(n3), .CI(\sub_24/carry[3] ), .CO(
        \sub_24/carry[4] ), .S(half_toggle_p1[3]) );
  INVX2M U9 ( .A(i_div_ratio[4]), .Y(n3) );
  ADDFX2M U10 ( .A(i_div_ratio[2]), .B(n14), .CI(\sub_24/carry[2] ), .CO(
        \sub_24/carry[3] ), .S(half_toggle_p1[2]) );
  ADDFX2M U11 ( .A(i_div_ratio[5]), .B(n5), .CI(\sub_24/carry[5] ), .CO(
        \sub_24/carry[6] ), .S(half_toggle_p1[5]) );
  INVX2M U12 ( .A(i_div_ratio[6]), .Y(n5) );
  ADDFX2M U13 ( .A(i_div_ratio[4]), .B(n4), .CI(\sub_24/carry[4] ), .CO(
        \sub_24/carry[5] ), .S(half_toggle_p1[4]) );
  INVX2M U14 ( .A(i_div_ratio[5]), .Y(n4) );
  ADDFX2M U15 ( .A(i_div_ratio[6]), .B(n6), .CI(\sub_24/carry[6] ), .CO(
        \sub_24/carry[7] ), .S(half_toggle_p1[6]) );
  INVX2M U16 ( .A(i_div_ratio[7]), .Y(n6) );
  XNOR2X1M U17 ( .A(i_div_ratio[7]), .B(\sub_24/carry[7] ), .Y(
        half_toggle_p1[7]) );
  OR2X1M U18 ( .A(n12), .B(i_div_ratio[0]), .Y(\sub_24/carry[1] ) );
  XNOR2X1M U19 ( .A(i_div_ratio[0]), .B(n12), .Y(half_toggle_p1[0]) );
  MXI2X1M U20 ( .A(n7), .B(n8), .S0(n9), .Y(n61) );
  OAI21X1M U21 ( .A0(n10), .A1(n11), .B0(flag_odd), .Y(n8) );
  CLKINVX1M U22 ( .A(div_clk_internal), .Y(n7) );
  CLKNAND2X2M U23 ( .A(n2), .B(n10), .Y(n62) );
  CLKNAND2X2M U24 ( .A(i_div_ratio[0]), .B(n2), .Y(n63) );
  CLKNAND2X2M U25 ( .A(n2), .B(n12), .Y(n64) );
  CLKNAND2X2M U26 ( .A(i_div_ratio[1]), .B(n2), .Y(n65) );
  CLKNAND2X2M U27 ( .A(n2), .B(n13), .Y(n66) );
  CLKNAND2X2M U28 ( .A(i_div_ratio[2]), .B(n2), .Y(n67) );
  CLKNAND2X2M U29 ( .A(n2), .B(n14), .Y(n68) );
  CLKNAND2X2M U30 ( .A(i_div_ratio[3]), .B(n2), .Y(n69) );
  NAND2BX1M U31 ( .AN(i_div_ratio[4]), .B(n2), .Y(n70) );
  CLKNAND2X2M U32 ( .A(i_div_ratio[4]), .B(n2), .Y(n71) );
  NAND2BX1M U33 ( .AN(i_div_ratio[5]), .B(n2), .Y(n72) );
  CLKNAND2X2M U34 ( .A(i_div_ratio[5]), .B(n2), .Y(n73) );
  NAND2BX1M U35 ( .AN(i_div_ratio[6]), .B(n2), .Y(n74) );
  CLKNAND2X2M U36 ( .A(i_div_ratio[6]), .B(n2), .Y(n75) );
  NAND2BX1M U37 ( .AN(i_div_ratio[7]), .B(n2), .Y(n76) );
  CLKNAND2X2M U38 ( .A(i_div_ratio[7]), .B(n2), .Y(n77) );
  MXI2X1M U39 ( .A(n15), .B(n16), .S0(flag), .Y(n78) );
  NAND3X1M U40 ( .A(N4), .B(n16), .C(n9), .Y(n15) );
  NAND3X1M U41 ( .A(n9), .B(N4), .C(n17), .Y(n16) );
  AOI21X1M U42 ( .A0(flag_odd), .A1(i_div_ratio[0]), .B0(n18), .Y(n17) );
  MXI2X1M U43 ( .A(n19), .B(n20), .S0(div_clk_internal), .Y(n79) );
  OAI21X1M U44 ( .A0(N4), .A1(n21), .B0(n20), .Y(n19) );
  NOR2BX1M U45 ( .AN(N32), .B(n20), .Y(N63) );
  NOR2BX1M U46 ( .AN(N31), .B(n20), .Y(N62) );
  NOR2BX1M U47 ( .AN(N30), .B(n20), .Y(N61) );
  NOR2BX1M U48 ( .AN(N29), .B(n20), .Y(N60) );
  NOR2BX1M U49 ( .AN(N28), .B(n20), .Y(N59) );
  NOR2BX1M U50 ( .AN(N27), .B(n20), .Y(N58) );
  NOR2BX1M U51 ( .AN(N26), .B(n20), .Y(N57) );
  OR2X1M U52 ( .A(N25), .B(n20), .Y(N56) );
  AOI32X1M U53 ( .A0(n23), .A1(n10), .A2(n24), .B0(n18), .B1(n25), .Y(n22) );
  CLKINVX1M U54 ( .A(flag_odd), .Y(n25) );
  NOR2BX1M U55 ( .AN(n26), .B(n10), .Y(n18) );
  MXI2X1M U56 ( .A(n27), .B(n28), .S0(flag), .Y(n26) );
  CLKNAND2X2M U57 ( .A(n29), .B(n30), .Y(n28) );
  NOR4X1M U58 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U59 ( .A(half_toggle_p1[3]), .B(counter[3]), .Y(n34) );
  CLKXOR2X2M U60 ( .A(half_toggle_p1[2]), .B(counter[2]), .Y(n33) );
  CLKXOR2X2M U61 ( .A(half_toggle_p1[1]), .B(counter[1]), .Y(n32) );
  CLKXOR2X2M U62 ( .A(half_toggle_p1[0]), .B(counter[0]), .Y(n31) );
  NOR4X1M U63 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n29) );
  CLKXOR2X2M U64 ( .A(half_toggle_p1[7]), .B(counter[7]), .Y(n38) );
  CLKXOR2X2M U65 ( .A(half_toggle_p1[6]), .B(counter[6]), .Y(n37) );
  CLKXOR2X2M U66 ( .A(half_toggle_p1[5]), .B(counter[5]), .Y(n36) );
  CLKXOR2X2M U67 ( .A(half_toggle_p1[4]), .B(counter[4]), .Y(n35) );
  CLKNAND2X2M U68 ( .A(n24), .B(n23), .Y(n27) );
  CLKINVX1M U69 ( .A(n39), .Y(n24) );
  NAND4BX1M U70 ( .AN(counter[7]), .B(n40), .C(n41), .D(n42), .Y(n39) );
  CLKXOR2X2M U71 ( .A(counter[0]), .B(n12), .Y(n42) );
  CLKXOR2X2M U72 ( .A(counter[1]), .B(n13), .Y(n41) );
  CLKXOR2X2M U73 ( .A(counter[2]), .B(n14), .Y(n40) );
  CLKINVX1M U74 ( .A(i_div_ratio[0]), .Y(n10) );
  AND4X1M U75 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n23) );
  XNOR2X1M U76 ( .A(counter[3]), .B(i_div_ratio[4]), .Y(n46) );
  XNOR2X1M U77 ( .A(counter[4]), .B(i_div_ratio[5]), .Y(n45) );
  XNOR2X1M U78 ( .A(counter[5]), .B(i_div_ratio[6]), .Y(n44) );
  XNOR2X1M U79 ( .A(counter[6]), .B(i_div_ratio[7]), .Y(n43) );
  CLKINVX1M U80 ( .A(n21), .Y(n9) );
  CLKNAND2X2M U81 ( .A(n47), .B(n48), .Y(n21) );
  NOR4X1M U82 ( .A(n49), .B(n50), .C(n51), .D(n52), .Y(n48) );
  CLKXOR2X2M U83 ( .A(prev_div_ratio[3]), .B(i_div_ratio[3]), .Y(n52) );
  CLKXOR2X2M U84 ( .A(prev_div_ratio[2]), .B(i_div_ratio[2]), .Y(n51) );
  CLKXOR2X2M U85 ( .A(prev_div_ratio[1]), .B(i_div_ratio[1]), .Y(n50) );
  CLKXOR2X2M U86 ( .A(prev_div_ratio[0]), .B(i_div_ratio[0]), .Y(n49) );
  NOR4X1M U87 ( .A(n53), .B(n54), .C(n57), .D(n58), .Y(n47) );
  CLKXOR2X2M U88 ( .A(prev_div_ratio[7]), .B(i_div_ratio[7]), .Y(n58) );
  CLKXOR2X2M U89 ( .A(prev_div_ratio[6]), .B(i_div_ratio[6]), .Y(n57) );
  CLKXOR2X2M U90 ( .A(prev_div_ratio[5]), .B(i_div_ratio[5]), .Y(n54) );
  CLKXOR2X2M U91 ( .A(prev_div_ratio[4]), .B(i_div_ratio[4]), .Y(n53) );
  CLKINVX1M U92 ( .A(n11), .Y(N4) );
  CLKNAND2X2M U93 ( .A(i_clk_en), .B(n59), .Y(n11) );
  NAND4X1M U94 ( .A(n13), .B(n14), .C(n12), .D(n60), .Y(n59) );
  NOR4X1M U95 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n60) );
  CLKINVX1M U96 ( .A(i_div_ratio[1]), .Y(n12) );
  CLKINVX1M U97 ( .A(i_div_ratio[3]), .Y(n14) );
  CLKINVX1M U98 ( .A(i_div_ratio[2]), .Y(n13) );
endmodule


module Pulse_Gen ( RST, CLK, LVL_SIG, PULSE_SIG );
  input RST, CLK, LVL_SIG;
  output PULSE_SIG;
  wire   Flop1, Flop2;

  DFFRQX2M Flop1_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(Flop1) );
  DFFRQX2M Flop2_reg ( .D(Flop1), .CK(CLK), .RN(RST), .Q(Flop2) );
  NOR2BX2M U3 ( .AN(Flop1), .B(Flop2), .Y(PULSE_SIG) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( unsync_bus, bus_enable, CLK, RST, 
        sync_bus, enable_pulse );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST;
  output enable_pulse;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] bus_enable_out;

  DFFRQX2M enable_flop_reg ( .D(bus_enable_out[1]), .CK(CLK), .RN(RST), .Q(
        enable_flop) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \bus_enable_out_reg[1]  ( .D(bus_enable_out[0]), .CK(CLK), .RN(RST), 
        .Q(bus_enable_out[1]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M \bus_enable_out_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        bus_enable_out[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(bus_enable_out[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  NOR3X2M U11 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U12 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NAND4BX1M U13 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U14 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR4X1M U15 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U16 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  OAI211X2M U17 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U19 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[2]), .Y(n15) );
  INVX2M U22 ( .A(IN[1]), .Y(n16) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module serializer_Data_width8 ( p_data, ser_en, CLK, RST, ser_data, ser_done
 );
  input [7:0] p_data;
  input ser_en, CLK, RST;
  output ser_data, ser_done;
  wire   N23, N24, N25, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n1, n2;
  wire   [2:0] counter;
  wire   [7:0] shift_reg;

  DFFRQX2M \shift_reg_reg[6]  ( .D(n18), .CK(CLK), .RN(RST), .Q(shift_reg[6])
         );
  DFFRQX2M \shift_reg_reg[5]  ( .D(n19), .CK(CLK), .RN(RST), .Q(shift_reg[5])
         );
  DFFRQX2M \shift_reg_reg[4]  ( .D(n20), .CK(CLK), .RN(RST), .Q(shift_reg[4])
         );
  DFFRQX2M \shift_reg_reg[3]  ( .D(n21), .CK(CLK), .RN(RST), .Q(shift_reg[3])
         );
  DFFRQX2M \shift_reg_reg[2]  ( .D(n22), .CK(CLK), .RN(RST), .Q(shift_reg[2])
         );
  DFFRQX2M \shift_reg_reg[1]  ( .D(n23), .CK(CLK), .RN(RST), .Q(shift_reg[1])
         );
  DFFRQX2M \shift_reg_reg[0]  ( .D(n24), .CK(CLK), .RN(RST), .Q(shift_reg[0])
         );
  DFFRQX2M ser_done_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(ser_done) );
  DFFRQX2M \counter_reg[2]  ( .D(N25), .CK(CLK), .RN(RST), .Q(counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(N24), .CK(CLK), .RN(RST), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(N23), .CK(CLK), .RN(RST), .Q(counter[0]) );
  DFFRQX2M ser_data_reg ( .D(n17), .CK(CLK), .RN(RST), .Q(ser_data) );
  NOR2X2M U3 ( .A(n8), .B(n1), .Y(n6) );
  XNOR2X2M U4 ( .A(counter[2]), .B(n16), .Y(N25) );
  NAND2X2M U5 ( .A(counter[1]), .B(counter[0]), .Y(n16) );
  OR3X2M U6 ( .A(counter[1]), .B(counter[2]), .C(counter[0]), .Y(n8) );
  NOR2X2M U7 ( .A(counter[0]), .B(n6), .Y(N23) );
  BUFX2M U8 ( .A(n5), .Y(n1) );
  NOR2BX2M U9 ( .AN(ser_en), .B(n8), .Y(n5) );
  INVX2M U10 ( .A(n4), .Y(n2) );
  AOI32X1M U11 ( .A0(counter[1]), .A1(counter[0]), .A2(counter[2]), .B0(
        ser_done), .B1(n1), .Y(n4) );
  OAI2BB1X2M U12 ( .A0N(ser_data), .A1N(n6), .B0(n7), .Y(n17) );
  AOI22X1M U13 ( .A0(shift_reg[0]), .A1(n8), .B0(p_data[0]), .B1(n1), .Y(n7)
         );
  OAI2BB1X2M U14 ( .A0N(n6), .A1N(shift_reg[0]), .B0(n15), .Y(n24) );
  AOI22X1M U15 ( .A0(shift_reg[1]), .A1(n8), .B0(p_data[1]), .B1(n1), .Y(n15)
         );
  OAI2BB1X2M U16 ( .A0N(n6), .A1N(shift_reg[1]), .B0(n14), .Y(n23) );
  AOI22X1M U17 ( .A0(shift_reg[2]), .A1(n8), .B0(p_data[2]), .B1(n1), .Y(n14)
         );
  OAI2BB1X2M U18 ( .A0N(n6), .A1N(shift_reg[2]), .B0(n13), .Y(n22) );
  AOI22X1M U19 ( .A0(shift_reg[3]), .A1(n8), .B0(p_data[3]), .B1(n1), .Y(n13)
         );
  OAI2BB1X2M U20 ( .A0N(n6), .A1N(shift_reg[3]), .B0(n12), .Y(n21) );
  AOI22X1M U21 ( .A0(shift_reg[4]), .A1(n8), .B0(p_data[4]), .B1(n1), .Y(n12)
         );
  OAI2BB1X2M U22 ( .A0N(n6), .A1N(shift_reg[4]), .B0(n11), .Y(n20) );
  AOI22X1M U23 ( .A0(shift_reg[5]), .A1(n8), .B0(p_data[5]), .B1(n1), .Y(n11)
         );
  OAI2BB1X2M U24 ( .A0N(n6), .A1N(shift_reg[5]), .B0(n10), .Y(n19) );
  AOI22X1M U25 ( .A0(shift_reg[6]), .A1(n8), .B0(p_data[6]), .B1(n1), .Y(n10)
         );
  OAI2BB1X2M U26 ( .A0N(n6), .A1N(shift_reg[6]), .B0(n9), .Y(n18) );
  NAND2X2M U27 ( .A(p_data[7]), .B(n1), .Y(n9) );
  CLKXOR2X2M U28 ( .A(counter[1]), .B(counter[0]), .Y(N24) );
endmodule


module FSM ( data_valid, par_en, ser_done, CLK, RST, ser_en, busy, mux_sel );
  output [1:0] mux_sel;
  input data_valid, par_en, ser_done, CLK, RST;
  output ser_en, busy;
  wire   n1, n4, n5, n6, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRX1M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .QN(
        n1) );
  NAND2X2M U3 ( .A(n4), .B(mux_sel[0]), .Y(next_state[1]) );
  INVX2M U4 ( .A(n4), .Y(mux_sel[1]) );
  NAND2X2M U5 ( .A(current_state[0]), .B(n1), .Y(mux_sel[0]) );
  NAND2X2M U6 ( .A(current_state[1]), .B(current_state[0]), .Y(n4) );
  OAI21X2M U7 ( .A0(n2), .A1(n1), .B0(mux_sel[0]), .Y(busy) );
  AOI21X2M U8 ( .A0(n3), .A1(n1), .B0(n4), .Y(next_state[2]) );
  OAI21X2M U9 ( .A0(mux_sel[0]), .A1(n5), .B0(n6), .Y(next_state[0]) );
  NAND3X2M U10 ( .A(n2), .B(n1), .C(data_valid), .Y(n6) );
  NOR3X2M U11 ( .A(n3), .B(par_en), .C(n2), .Y(n5) );
  INVX2M U12 ( .A(current_state[1]), .Y(n2) );
  NOR2X2M U13 ( .A(current_state[1]), .B(mux_sel[0]), .Y(ser_en) );
  INVX2M U14 ( .A(ser_done), .Y(n3) );
endmodule


module parity_calc_Data_width8 ( p_data, data_valid, par_typ, CLK, RST, busy, 
        par_bit );
  input [7:0] p_data;
  input data_valid, par_typ, CLK, RST, busy;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M par_bit_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(par_bit) );
  XNOR2X2M U2 ( .A(p_data[3]), .B(p_data[2]), .Y(n5) );
  XOR3XLM U3 ( .A(p_data[5]), .B(p_data[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(p_data[7]), .B(p_data[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n7) );
  NAND2BX2M U6 ( .AN(busy), .B(data_valid), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(par_typ), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(p_data[1]), .B(p_data[0]), .C(n5), .Y(n4) );
endmodule


module MUX ( mux_sel, ser_data, par_bit, TX_OUT );
  input [1:0] mux_sel;
  input ser_data, par_bit;
  output TX_OUT;
  wire   n2, n3, n1;

  INVX2M U3 ( .A(mux_sel[0]), .Y(n1) );
  OAI21X4M U4 ( .A0(n2), .A1(n1), .B0(n3), .Y(TX_OUT) );
  NOR2BX2M U5 ( .AN(mux_sel[1]), .B(par_bit), .Y(n2) );
  NAND3X2M U6 ( .A(mux_sel[1]), .B(n1), .C(ser_data), .Y(n3) );
endmodule


module UART_TX_Data_width_top8 ( p_data_TOP, data_valid_TOP, par_typ_TOP, 
        part_en_TOP, CLK_TOP, RST_TOP, TX_OUT_TOP, busy_TOP );
  input [7:0] p_data_TOP;
  input data_valid_TOP, par_typ_TOP, part_en_TOP, CLK_TOP, RST_TOP;
  output TX_OUT_TOP, busy_TOP;
  wire   ser_data_top, ser_done_top, ser_en_top, par_bit_top;
  wire   [1:0] mux_sel_top;

  serializer_Data_width8 serializerINST ( .p_data(p_data_TOP), .ser_en(
        ser_en_top), .CLK(CLK_TOP), .RST(RST_TOP), .ser_data(ser_data_top), 
        .ser_done(ser_done_top) );
  FSM FSMINST ( .data_valid(data_valid_TOP), .par_en(part_en_TOP), .ser_done(
        ser_done_top), .CLK(CLK_TOP), .RST(RST_TOP), .ser_en(ser_en_top), 
        .busy(busy_TOP), .mux_sel(mux_sel_top) );
  parity_calc_Data_width8 parity_calcINST ( .p_data(p_data_TOP), .data_valid(
        data_valid_TOP), .par_typ(par_typ_TOP), .CLK(CLK_TOP), .RST(RST_TOP), 
        .busy(busy_TOP), .par_bit(par_bit_top) );
  MUX MUXINST ( .mux_sel(mux_sel_top), .ser_data(ser_data_top), .par_bit(
        par_bit_top), .TX_OUT(TX_OUT_TOP) );
endmodule


module FSM_RX ( RX_IN, PAR_EN, edge_cnt, bit_cnt, stp_err, strt_glitch, 
        par_err, par_en, prescale, CLK, RST, dat_samp_en, enable, deser_en, 
        data_valid, par_chk_en, strt_chck_en, stp_chk_en );
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input RX_IN, PAR_EN, stp_err, strt_glitch, par_err, par_en, CLK, RST;
  output dat_samp_en, enable, deser_en, data_valid, par_chk_en, strt_chck_en,
         stp_chk_en;
  wire   N45, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         \r92/B[0] , \r92/B[1] , \r92/B[2] , \r92/B[3] , \r92/B[5] ,
         \r92/B[9] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n42;
  wire   [5:0] prescale_reg;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;

  DFFSQX2M \prescale_reg_reg[5]  ( .D(prescale[5]), .CK(CLK), .SN(RST), .Q(
        prescale_reg[5]) );
  DFFRQX2M \prescale_reg_reg[4]  ( .D(prescale[4]), .CK(CLK), .RN(RST), .Q(
        prescale_reg[4]) );
  DFFRQX2M \prescale_reg_reg[3]  ( .D(prescale[3]), .CK(CLK), .RN(RST), .Q(
        prescale_reg[3]) );
  DFFRQX2M \prescale_reg_reg[1]  ( .D(prescale[1]), .CK(CLK), .RN(RST), .Q(
        prescale_reg[1]) );
  DFFRQX2M \prescale_reg_reg[2]  ( .D(prescale[2]), .CK(CLK), .RN(RST), .Q(
        prescale_reg[2]) );
  DFFRQX2M \prescale_reg_reg[0]  ( .D(prescale[0]), .CK(CLK), .RN(RST), .Q(
        prescale_reg[0]) );
  DFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .CK(CLK), .RN(RST), .Q(
        Current_State[2]) );
  DFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .CK(CLK), .RN(RST), .Q(
        Current_State[1]) );
  DFFRX1M \Current_State_reg[0]  ( .D(Next_State[0]), .CK(CLK), .RN(RST), .Q(
        Current_State[0]), .QN(n28) );
  NOR4BX1M U3 ( .AN(stp_chk_en), .B(stp_err), .C(par_err), .D(n26), .Y(
        data_valid) );
  NOR3X2M U4 ( .A(n29), .B(n28), .C(n42), .Y(par_chk_en) );
  INVX2M U5 ( .A(N45), .Y(n26) );
  AOI2B1X1M U6 ( .A1N(par_err), .A0(par_chk_en), .B0(n35), .Y(n31) );
  AOI2BB1X2M U7 ( .A0N(stp_chk_en), .A1N(par_chk_en), .B0(N45), .Y(n35) );
  NAND2X2M U8 ( .A(n34), .B(n31), .Y(Next_State[1]) );
  AOI31XLM U9 ( .A0(n36), .A1(n25), .A2(N45), .B0(deser_en), .Y(n34) );
  INVX2M U10 ( .A(n11), .Y(n21) );
  OAI21X2M U11 ( .A0(n15), .A1(n30), .B0(n27), .Y(enable) );
  NOR2X2M U12 ( .A(n29), .B(n27), .Y(deser_en) );
  NAND2X2M U13 ( .A(n30), .B(n27), .Y(dat_samp_en) );
  INVX2M U14 ( .A(n36), .Y(n27) );
  NOR3X2M U15 ( .A(n29), .B(Current_State[0]), .C(n42), .Y(stp_chk_en) );
  INVX2M U16 ( .A(Current_State[1]), .Y(n29) );
  INVX2M U17 ( .A(Current_State[2]), .Y(n42) );
  OAI211X2M U18 ( .A0(RX_IN), .A1(n37), .B0(n38), .C0(n39), .Y(Next_State[0])
         );
  OAI21X2M U19 ( .A0(par_chk_en), .A1(strt_chck_en), .B0(n26), .Y(n38) );
  AOI32XLM U20 ( .A0(n29), .A1(n42), .A2(n28), .B0(N45), .B1(stp_chk_en), .Y(
        n37) );
  AOI22X1M U21 ( .A0(deser_en), .A1(n40), .B0(strt_chck_en), .B1(n25), .Y(n39)
         );
  INVX2M U22 ( .A(n15), .Y(n24) );
  INVX2M U23 ( .A(n16), .Y(n23) );
  OR2X2M U24 ( .A(prescale_reg[1]), .B(prescale_reg[0]), .Y(n2) );
  NAND2X2M U25 ( .A(n31), .B(n32), .Y(Next_State[2]) );
  NAND4XLM U26 ( .A(deser_en), .B(N45), .C(bit_cnt[3]), .D(n33), .Y(n32) );
  NOR3X2M U27 ( .A(bit_cnt[0]), .B(bit_cnt[2]), .C(bit_cnt[1]), .Y(n33) );
  AOI21BX2M U28 ( .A0(n4), .A1(prescale_reg[4]), .B0N(n5), .Y(n1) );
  OR4X1M U29 ( .A(n41), .B(bit_cnt[1]), .C(bit_cnt[2]), .D(bit_cnt[0]), .Y(n40) );
  NAND3BXLM U30 ( .AN(PAR_EN), .B(bit_cnt[3]), .C(N45), .Y(n41) );
  INVX2M U31 ( .A(edge_cnt[3]), .Y(n20) );
  INVX2M U32 ( .A(edge_cnt[2]), .Y(n19) );
  INVX2M U33 ( .A(edge_cnt[5]), .Y(n22) );
  AOI21X2M U34 ( .A0(Current_State[0]), .A1(Current_State[1]), .B0(stp_chk_en), 
        .Y(n30) );
  NOR2X2M U35 ( .A(n28), .B(Current_State[2]), .Y(n36) );
  INVX2M U36 ( .A(strt_glitch), .Y(n25) );
  NOR2X2M U37 ( .A(n27), .B(Current_State[1]), .Y(strt_chck_en) );
  CLKINVX1M U38 ( .A(prescale_reg[0]), .Y(\r92/B[0] ) );
  OAI2BB1X1M U39 ( .A0N(prescale_reg[0]), .A1N(prescale_reg[1]), .B0(n2), .Y(
        \r92/B[1] ) );
  OR2X1M U40 ( .A(n2), .B(prescale_reg[2]), .Y(n3) );
  OAI2BB1X1M U41 ( .A0N(n2), .A1N(prescale_reg[2]), .B0(n3), .Y(\r92/B[2] ) );
  OR2X1M U42 ( .A(n3), .B(prescale_reg[3]), .Y(n4) );
  OAI2BB1X1M U43 ( .A0N(n3), .A1N(prescale_reg[3]), .B0(n4), .Y(\r92/B[3] ) );
  OR2X1M U44 ( .A(n4), .B(prescale_reg[4]), .Y(n5) );
  NOR2X1M U45 ( .A(n5), .B(prescale_reg[5]), .Y(\r92/B[9] ) );
  AO21XLM U46 ( .A0(n5), .A1(prescale_reg[5]), .B0(\r92/B[9] ), .Y(\r92/B[5] )
         );
  NOR2X1M U47 ( .A(n20), .B(\r92/B[3] ), .Y(n12) );
  CLKNAND2X2M U48 ( .A(edge_cnt[4]), .B(n1), .Y(n11) );
  NOR2BX1M U49 ( .AN(edge_cnt[0]), .B(\r92/B[0] ), .Y(n6) );
  OAI2B2X1M U50 ( .A1N(\r92/B[1] ), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7)
         );
  NAND3BX1M U51 ( .AN(n12), .B(n11), .C(n7), .Y(n18) );
  NOR2X1M U52 ( .A(n19), .B(\r92/B[2] ), .Y(n17) );
  NAND2BX1M U53 ( .AN(edge_cnt[0]), .B(\r92/B[0] ), .Y(n9) );
  AOI2BB1X1M U54 ( .A0N(n9), .A1N(edge_cnt[1]), .B0(\r92/B[1] ), .Y(n8) );
  AOI211X1M U55 ( .A0(edge_cnt[1]), .A1(n9), .B0(n17), .C0(n8), .Y(n10) );
  AOI221XLM U56 ( .A0(\r92/B[3] ), .A1(n20), .B0(\r92/B[2] ), .B1(n19), .C0(
        n10), .Y(n13) );
  OAI32X1M U57 ( .A0(n13), .A1(n12), .A2(n21), .B0(edge_cnt[4]), .B1(n1), .Y(
        n14) );
  NOR2X1M U58 ( .A(n22), .B(\r92/B[5] ), .Y(n16) );
  AOI221XLM U59 ( .A0(n14), .A1(n23), .B0(\r92/B[5] ), .B1(n22), .C0(
        \r92/B[9] ), .Y(n15) );
  NOR4X1M U60 ( .A(n18), .B(n17), .C(n24), .D(n16), .Y(N45) );
endmodule


module data_sampling ( prescale, RX_IN, dat_samp_en, edge_cnt, CLK, RST, 
        sampled_bit );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input RX_IN, dat_samp_en, CLK, RST;
  output sampled_bit;
  wire   N14, N15, N16, N17, N18, N20, N21, N22, N23, N24, N25, N26, n24, n25,
         n26, n27, n28, n29, \add_20/carry[4] , \add_20/carry[3] ,
         \add_20/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48;
  wire   [1:0] samples_counter;
  wire   [2:0] samples_registers;

  DFFRQX2M \samples_counter_reg[1]  ( .D(n28), .CK(CLK), .RN(RST), .Q(
        samples_counter[1]) );
  DFFRQX2M \samples_counter_reg[0]  ( .D(n29), .CK(CLK), .RN(RST), .Q(
        samples_counter[0]) );
  DFFRQX2M sampled_bit_reg ( .D(n24), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  DFFRX1M \samples_registers_reg[1]  ( .D(n26), .CK(CLK), .RN(RST), .Q(
        samples_registers[1]), .QN(n22) );
  DFFRX1M \samples_registers_reg[0]  ( .D(n27), .CK(CLK), .RN(RST), .Q(
        samples_registers[0]), .QN(n18) );
  DFFRQX1M \samples_registers_reg[2]  ( .D(n25), .CK(CLK), .RN(RST), .Q(
        samples_registers[2]) );
  OR2X2M U3 ( .A(prescale[2]), .B(prescale[1]), .Y(n1) );
  ADDHX1M U4 ( .A(prescale[4]), .B(\add_20/carry[3] ), .CO(\add_20/carry[4] ), 
        .S(N16) );
  ADDHX1M U5 ( .A(prescale[3]), .B(\add_20/carry[2] ), .CO(\add_20/carry[3] ), 
        .S(N15) );
  ADDHX1M U6 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_20/carry[2] ), .S(
        N14) );
  ADDHX1M U7 ( .A(prescale[5]), .B(\add_20/carry[4] ), .CO(N18), .S(N17) );
  CLKINVX1M U8 ( .A(prescale[1]), .Y(N20) );
  OAI2BB1X1M U9 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n1), .Y(N21) );
  OR2X1M U10 ( .A(n1), .B(prescale[3]), .Y(n2) );
  OAI2BB1X1M U11 ( .A0N(n1), .A1N(prescale[3]), .B0(n2), .Y(N22) );
  XNOR2X1M U12 ( .A(prescale[4]), .B(n2), .Y(N23) );
  NOR3X1M U13 ( .A(prescale[4]), .B(prescale[5]), .C(n2), .Y(N25) );
  OAI21X1M U14 ( .A0(prescale[4]), .A1(n2), .B0(prescale[5]), .Y(n3) );
  NAND2BX1M U15 ( .AN(N25), .B(n3), .Y(N24) );
  NOR2BX1M U16 ( .AN(edge_cnt[0]), .B(N20), .Y(n4) );
  OAI2B2X1M U17 ( .A1N(N21), .A0(n4), .B0(edge_cnt[1]), .B1(n4), .Y(n7) );
  NOR2BX1M U18 ( .AN(N20), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U19 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N21), .B1(n5), .Y(n6) );
  NAND4BBX1M U20 ( .AN(N25), .BN(edge_cnt[5]), .C(n7), .D(n6), .Y(n11) );
  CLKXOR2X2M U21 ( .A(N24), .B(edge_cnt[4]), .Y(n10) );
  CLKXOR2X2M U22 ( .A(N22), .B(edge_cnt[2]), .Y(n9) );
  CLKXOR2X2M U23 ( .A(N23), .B(edge_cnt[3]), .Y(n8) );
  NOR4X1M U24 ( .A(n11), .B(n10), .C(n9), .D(n8), .Y(N26) );
  CLKXOR2X2M U25 ( .A(n12), .B(samples_counter[0]), .Y(n29) );
  CLKXOR2X2M U26 ( .A(n13), .B(n14), .Y(n28) );
  CLKNAND2X2M U27 ( .A(samples_counter[0]), .B(n12), .Y(n14) );
  OAI21BX1M U28 ( .A0(n15), .A1(n16), .B0N(n17), .Y(n12) );
  MXI2X1M U29 ( .A(n18), .B(n19), .S0(n20), .Y(n27) );
  NOR2X1M U30 ( .A(samples_counter[0]), .B(n21), .Y(n20) );
  MXI2X1M U31 ( .A(n22), .B(n19), .S0(n23), .Y(n26) );
  NOR2X1M U32 ( .A(n30), .B(n21), .Y(n23) );
  OR3X1M U33 ( .A(n15), .B(samples_counter[1]), .C(n16), .Y(n21) );
  CLKINVX1M U34 ( .A(RX_IN), .Y(n19) );
  CLKMX2X2M U35 ( .A(samples_registers[2]), .B(RX_IN), .S0(n31), .Y(n25) );
  NOR4X1M U36 ( .A(samples_counter[0]), .B(n15), .C(n16), .D(n13), .Y(n31) );
  NOR3X1M U37 ( .A(N26), .B(n32), .C(n33), .Y(n15) );
  NOR4X1M U38 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n33) );
  CLKXOR2X2M U39 ( .A(edge_cnt[3]), .B(N16), .Y(n37) );
  CLKXOR2X2M U40 ( .A(edge_cnt[5]), .B(N18), .Y(n36) );
  CLKXOR2X2M U41 ( .A(edge_cnt[4]), .B(N17), .Y(n35) );
  NAND3X1M U42 ( .A(n38), .B(n39), .C(n40), .Y(n34) );
  XNOR2X1M U43 ( .A(edge_cnt[1]), .B(N14), .Y(n40) );
  XNOR2X1M U44 ( .A(edge_cnt[2]), .B(N15), .Y(n39) );
  XNOR2X1M U45 ( .A(edge_cnt[0]), .B(N20), .Y(n38) );
  NOR4X1M U46 ( .A(n41), .B(n42), .C(edge_cnt[5]), .D(n43), .Y(n32) );
  CLKXOR2X2M U47 ( .A(prescale[1]), .B(edge_cnt[0]), .Y(n43) );
  CLKXOR2X2M U48 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n42) );
  NAND3X1M U49 ( .A(n44), .B(n45), .C(n46), .Y(n41) );
  XNOR2X1M U50 ( .A(edge_cnt[2]), .B(prescale[3]), .Y(n46) );
  XNOR2X1M U51 ( .A(edge_cnt[3]), .B(prescale[4]), .Y(n45) );
  XNOR2X1M U52 ( .A(edge_cnt[1]), .B(prescale[2]), .Y(n44) );
  CLKMX2X2M U53 ( .A(sampled_bit), .B(n47), .S0(n17), .Y(n24) );
  NOR3X1M U54 ( .A(n30), .B(n16), .C(n13), .Y(n17) );
  CLKINVX1M U55 ( .A(samples_counter[1]), .Y(n13) );
  CLKINVX1M U56 ( .A(dat_samp_en), .Y(n16) );
  CLKINVX1M U57 ( .A(samples_counter[0]), .Y(n30) );
  OAI21X1M U58 ( .A0(n18), .A1(n22), .B0(n48), .Y(n47) );
  OAI21X1M U59 ( .A0(samples_registers[0]), .A1(samples_registers[1]), .B0(
        samples_registers[2]), .Y(n48) );
endmodule


module deserializer_Data_width8 ( sampled_bit, deser_en, edge_cnt, bit_cnt, 
        prescale, CLK, RST, P_DATA );
  input [5:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  output [7:0] P_DATA;
  input sampled_bit, deser_en, CLK, RST;
  wire   N11, N12, N13, N14, N15, N16, N17, N18, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n30, n31, n32, n33, n34, n35, n36
;

  DFFRQX2M \P_DATA_reg[6]  ( .D(n28), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n23), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n27), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n22), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n26), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n29), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n25), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n24), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  OAI2B11X2M U3 ( .A1N(bit_cnt[3]), .A0(n21), .B0(N18), .C0(deser_en), .Y(n14)
         );
  NOR3X2M U4 ( .A(bit_cnt[0]), .B(bit_cnt[2]), .C(bit_cnt[1]), .Y(n21) );
  NOR2BX2M U5 ( .AN(bit_cnt[2]), .B(n14), .Y(n16) );
  NOR2X2M U6 ( .A(n14), .B(bit_cnt[2]), .Y(n11) );
  OAI2BB2X1M U7 ( .B0(n36), .B1(n20), .A0N(P_DATA[7]), .A1N(n20), .Y(n29) );
  NAND2BX2M U8 ( .AN(n14), .B(bit_cnt[3]), .Y(n20) );
  OAI2BB2X1M U9 ( .B0(n36), .B1(n15), .A0N(P_DATA[3]), .A1N(n15), .Y(n25) );
  NAND3X2M U10 ( .A(n34), .B(n35), .C(n16), .Y(n15) );
  OAI2BB2X1M U11 ( .B0(n10), .B1(n36), .A0N(P_DATA[0]), .A1N(n10), .Y(n22) );
  NAND3X2M U12 ( .A(n11), .B(n35), .C(bit_cnt[0]), .Y(n10) );
  OAI2BB2X1M U13 ( .B0(n36), .B1(n12), .A0N(P_DATA[1]), .A1N(n12), .Y(n23) );
  NAND3X2M U14 ( .A(n11), .B(n34), .C(bit_cnt[1]), .Y(n12) );
  OAI2BB2X1M U15 ( .B0(n36), .B1(n13), .A0N(P_DATA[2]), .A1N(n13), .Y(n24) );
  NAND3X2M U16 ( .A(bit_cnt[0]), .B(n11), .C(bit_cnt[1]), .Y(n13) );
  OAI2BB2X1M U17 ( .B0(n36), .B1(n17), .A0N(P_DATA[4]), .A1N(n17), .Y(n26) );
  NAND3X2M U18 ( .A(bit_cnt[0]), .B(n35), .C(n16), .Y(n17) );
  OAI2BB2X1M U19 ( .B0(n36), .B1(n18), .A0N(P_DATA[5]), .A1N(n18), .Y(n27) );
  NAND3X2M U20 ( .A(bit_cnt[1]), .B(n34), .C(n16), .Y(n18) );
  OAI2BB2X1M U21 ( .B0(n36), .B1(n19), .A0N(P_DATA[6]), .A1N(n19), .Y(n28) );
  NAND3X2M U22 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .C(n16), .Y(n19) );
  INVX2M U23 ( .A(bit_cnt[0]), .Y(n34) );
  INVX2M U24 ( .A(bit_cnt[1]), .Y(n35) );
  INVX2M U25 ( .A(sampled_bit), .Y(n36) );
  OR2X2M U26 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKINVX1M U27 ( .A(prescale[0]), .Y(N11) );
  OAI2BB1X1M U28 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N12) );
  OR2X1M U29 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U30 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N13) );
  OR2X1M U31 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U32 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N14) );
  OR2X1M U33 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U34 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N15) );
  NOR2X1M U35 ( .A(n4), .B(prescale[5]), .Y(N17) );
  AO21XLM U36 ( .A0(n4), .A1(prescale[5]), .B0(N17), .Y(N16) );
  NOR2BX1M U37 ( .AN(N11), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U38 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N12), .B1(n5), .Y(n9) );
  XNOR2X1M U39 ( .A(N16), .B(edge_cnt[5]), .Y(n8) );
  NOR2BX1M U40 ( .AN(edge_cnt[0]), .B(N11), .Y(n6) );
  OAI2B2X1M U41 ( .A1N(N12), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U42 ( .AN(N17), .B(n9), .C(n8), .D(n7), .Y(n33) );
  CLKXOR2X2M U43 ( .A(N15), .B(edge_cnt[4]), .Y(n32) );
  CLKXOR2X2M U44 ( .A(N13), .B(edge_cnt[2]), .Y(n31) );
  CLKXOR2X2M U45 ( .A(N14), .B(edge_cnt[3]), .Y(n30) );
  NOR4X1M U46 ( .A(n33), .B(n32), .C(n31), .D(n30), .Y(N18) );
endmodule


module edge_bit_counter ( enable, prescale, stp_chk_en, CLK, RST, bit_cnt, 
        edge_cnt );
  input [5:0] prescale;
  output [3:0] bit_cnt;
  output [5:0] edge_cnt;
  input enable, stp_chk_en, CLK, RST;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N21, N22, N23, N24, N25, N26,
         N38, N39, N40, N41, N42, N43, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, \add_20/carry[5] , \add_20/carry[4] ,
         \add_20/carry[3] , \add_20/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n24, n25, n26, n27, n28, n29, n30;

  DFFRQX2M \bit_cnt_reg[3]  ( .D(n27), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[2]  ( .D(n21), .CK(CLK), .RN(RST), .Q(bit_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[5]  ( .D(N43), .CK(CLK), .RN(RST), .Q(edge_cnt[5]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N38), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N42), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N39), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N40), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N41), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n22), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n23), .CK(CLK), .RN(RST), .Q(bit_cnt[0]) );
  INVX2M U3 ( .A(n17), .Y(n26) );
  NOR2X2M U4 ( .A(n19), .B(N15), .Y(n16) );
  NOR2X2M U5 ( .A(n19), .B(n16), .Y(n17) );
  INVX2M U6 ( .A(n19), .Y(n28) );
  AND2X2M U7 ( .A(N22), .B(n16), .Y(N39) );
  AND2X2M U8 ( .A(N23), .B(n16), .Y(N40) );
  AND2X2M U9 ( .A(N24), .B(n16), .Y(N41) );
  AND2X2M U10 ( .A(N25), .B(n16), .Y(N42) );
  NOR2X2M U11 ( .A(n30), .B(n29), .Y(n14) );
  OAI32X1M U12 ( .A0(n26), .A1(bit_cnt[1]), .A2(n29), .B0(n15), .B1(n30), .Y(
        n22) );
  AOI21X2M U13 ( .A0(n28), .A1(n29), .B0(n16), .Y(n15) );
  NOR3BX2M U14 ( .AN(enable), .B(bit_cnt[3]), .C(n12), .Y(n21) );
  XNOR2X2M U15 ( .A(bit_cnt[2]), .B(n13), .Y(n12) );
  AND2X2M U16 ( .A(n14), .B(N15), .Y(n13) );
  NAND2X2M U17 ( .A(enable), .B(n20), .Y(n19) );
  OAI21X2M U18 ( .A0(bit_cnt[2]), .A1(n14), .B0(bit_cnt[3]), .Y(n20) );
  OAI2BB2X1M U19 ( .B0(bit_cnt[0]), .B1(n26), .A0N(bit_cnt[0]), .A1N(n16), .Y(
        n23) );
  INVX2M U20 ( .A(n18), .Y(n27) );
  AOI32X1M U21 ( .A0(n17), .A1(n14), .A2(bit_cnt[2]), .B0(bit_cnt[3]), .B1(n28), .Y(n18) );
  AND2X2M U22 ( .A(N26), .B(n16), .Y(N43) );
  AND2X2M U23 ( .A(N21), .B(n16), .Y(N38) );
  INVX2M U24 ( .A(bit_cnt[0]), .Y(n29) );
  INVX2M U25 ( .A(bit_cnt[1]), .Y(n30) );
  ADDHX1M U26 ( .A(edge_cnt[3]), .B(\add_20/carry[3] ), .CO(\add_20/carry[4] ), 
        .S(N24) );
  ADDHX1M U27 ( .A(edge_cnt[2]), .B(\add_20/carry[2] ), .CO(\add_20/carry[3] ), 
        .S(N23) );
  ADDHX1M U28 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_20/carry[2] ), .S(
        N22) );
  ADDHX1M U29 ( .A(edge_cnt[4]), .B(\add_20/carry[4] ), .CO(\add_20/carry[5] ), 
        .S(N25) );
  OR2X2M U30 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKINVX1M U31 ( .A(prescale[0]), .Y(N8) );
  OAI2BB1X1M U32 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N9) );
  OR2X1M U33 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U34 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N10) );
  OR2X1M U35 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U36 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N11) );
  OR2X1M U37 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U38 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N12) );
  NOR2X1M U39 ( .A(n4), .B(prescale[5]), .Y(N14) );
  AO21XLM U40 ( .A0(n4), .A1(prescale[5]), .B0(N14), .Y(N13) );
  CLKINVX1M U41 ( .A(edge_cnt[0]), .Y(N21) );
  CLKXOR2X2M U42 ( .A(\add_20/carry[5] ), .B(edge_cnt[5]), .Y(N26) );
  NOR2BX1M U43 ( .AN(N8), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U44 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N9), .B1(n5), .Y(n9) );
  XNOR2X1M U45 ( .A(N13), .B(edge_cnt[5]), .Y(n8) );
  NOR2BX1M U46 ( .AN(edge_cnt[0]), .B(N8), .Y(n6) );
  OAI2B2X1M U47 ( .A1N(N9), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U48 ( .AN(N14), .B(n9), .C(n8), .D(n7), .Y(n25) );
  CLKXOR2X2M U49 ( .A(N12), .B(edge_cnt[4]), .Y(n24) );
  CLKXOR2X2M U50 ( .A(N10), .B(edge_cnt[2]), .Y(n11) );
  CLKXOR2X2M U51 ( .A(N11), .B(edge_cnt[3]), .Y(n10) );
  NOR4X1M U52 ( .A(n25), .B(n24), .C(n11), .D(n10), .Y(N15) );
endmodule


module Strt_Check ( strt_chck_en, sampled_bit, edge_cnt, prescale, strt_glitch
 );
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input strt_chck_en, sampled_bit;
  output strt_glitch;
  wire   N7, N6, N5, N4, N3, N2, N1, N0, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13;

  AND3X2M U2 ( .A(sampled_bit), .B(N7), .C(strt_chck_en), .Y(strt_glitch) );
  OR2X2M U3 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKINVX1M U4 ( .A(prescale[0]), .Y(N0) );
  OAI2BB1X1M U5 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N1) );
  OR2X1M U6 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U7 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N2) );
  OR2X1M U8 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U9 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N3) );
  OR2X1M U10 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U11 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N4) );
  NOR2X1M U12 ( .A(n4), .B(prescale[5]), .Y(N6) );
  AO21XLM U13 ( .A0(n4), .A1(prescale[5]), .B0(N6), .Y(N5) );
  NOR2BX1M U14 ( .AN(N0), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U15 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N1), .B1(n5), .Y(n9) );
  XNOR2X1M U16 ( .A(N5), .B(edge_cnt[5]), .Y(n8) );
  NOR2BX1M U17 ( .AN(edge_cnt[0]), .B(N0), .Y(n6) );
  OAI2B2X1M U18 ( .A1N(N1), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U19 ( .AN(N6), .B(n9), .C(n8), .D(n7), .Y(n13) );
  CLKXOR2X2M U20 ( .A(N4), .B(edge_cnt[4]), .Y(n12) );
  CLKXOR2X2M U21 ( .A(N2), .B(edge_cnt[2]), .Y(n11) );
  CLKXOR2X2M U22 ( .A(N3), .B(edge_cnt[3]), .Y(n10) );
  NOR4X1M U23 ( .A(n13), .B(n12), .C(n11), .D(n10), .Y(N7) );
endmodule


module Parity_Check_Data_width8 ( par_chk_en, PAR_TYP, sampled_bit, P_DATA, 
        edge_cnt, prescale, par_err );
  input [7:0] P_DATA;
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input par_chk_en, PAR_TYP, sampled_bit;
  output par_err;
  wire   N10, N9, N8, N7, N6, N5, N4, N3, n7, n8, n9, n10, n11, n12, n1, n2,
         n3, n4, n5, n6, n13, n14, n15, n16, n17, n18, n19;

  AND3X2M U3 ( .A(N10), .B(n7), .C(par_chk_en), .Y(par_err) );
  XOR3XLM U4 ( .A(n8), .B(n9), .C(n10), .Y(n7) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n11), .Y(n10) );
  OR2X2M U6 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKXOR2X2M U7 ( .A(P_DATA[2]), .B(PAR_TYP), .Y(n8) );
  XNOR2X2M U8 ( .A(P_DATA[4]), .B(P_DATA[3]), .Y(n11) );
  XOR3XLM U9 ( .A(P_DATA[6]), .B(P_DATA[5]), .C(n12), .Y(n9) );
  XNOR2X2M U10 ( .A(sampled_bit), .B(P_DATA[7]), .Y(n12) );
  CLKINVX1M U11 ( .A(prescale[0]), .Y(N3) );
  OAI2BB1X1M U12 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N4) );
  OR2X1M U13 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U14 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N5) );
  OR2X1M U15 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U16 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N6) );
  OR2X1M U17 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U18 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N7) );
  NOR2X1M U19 ( .A(n4), .B(prescale[5]), .Y(N9) );
  AO21XLM U20 ( .A0(n4), .A1(prescale[5]), .B0(N9), .Y(N8) );
  NOR2BX1M U21 ( .AN(N3), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U22 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N4), .B1(n5), .Y(n15) );
  XNOR2X1M U23 ( .A(N8), .B(edge_cnt[5]), .Y(n14) );
  NOR2BX1M U24 ( .AN(edge_cnt[0]), .B(N3), .Y(n6) );
  OAI2B2X1M U25 ( .A1N(N4), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n13) );
  NAND4BX1M U26 ( .AN(N9), .B(n15), .C(n14), .D(n13), .Y(n19) );
  CLKXOR2X2M U27 ( .A(N7), .B(edge_cnt[4]), .Y(n18) );
  CLKXOR2X2M U28 ( .A(N5), .B(edge_cnt[2]), .Y(n17) );
  CLKXOR2X2M U29 ( .A(N6), .B(edge_cnt[3]), .Y(n16) );
  NOR4X1M U30 ( .A(n19), .B(n18), .C(n17), .D(n16), .Y(N10) );
endmodule


module Stop_Check ( stp_chk_en, sampled_bit, edge_cnt, prescale, stp_err );
  input [5:0] edge_cnt;
  input [5:0] prescale;
  input stp_chk_en, sampled_bit;
  output stp_err;
  wire   N7, N6, N5, N4, N3, N2, N1, N0, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14;

  AND3X2M U2 ( .A(n14), .B(N7), .C(stp_chk_en), .Y(stp_err) );
  INVX2M U3 ( .A(sampled_bit), .Y(n14) );
  OR2X2M U4 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKINVX1M U5 ( .A(prescale[0]), .Y(N0) );
  OAI2BB1X1M U6 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N1) );
  OR2X1M U7 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U8 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N2) );
  OR2X1M U9 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U10 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N3) );
  OR2X1M U11 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U12 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N4) );
  NOR2X1M U13 ( .A(n4), .B(prescale[5]), .Y(N6) );
  AO21XLM U14 ( .A0(n4), .A1(prescale[5]), .B0(N6), .Y(N5) );
  NOR2BX1M U15 ( .AN(N0), .B(edge_cnt[0]), .Y(n5) );
  OAI2B2X1M U16 ( .A1N(edge_cnt[1]), .A0(n5), .B0(N1), .B1(n5), .Y(n9) );
  XNOR2X1M U17 ( .A(N5), .B(edge_cnt[5]), .Y(n8) );
  NOR2BX1M U18 ( .AN(edge_cnt[0]), .B(N0), .Y(n6) );
  OAI2B2X1M U19 ( .A1N(N1), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n7) );
  NAND4BX1M U20 ( .AN(N6), .B(n9), .C(n8), .D(n7), .Y(n13) );
  CLKXOR2X2M U21 ( .A(N4), .B(edge_cnt[4]), .Y(n12) );
  CLKXOR2X2M U22 ( .A(N2), .B(edge_cnt[2]), .Y(n11) );
  CLKXOR2X2M U23 ( .A(N3), .B(edge_cnt[3]), .Y(n10) );
  NOR4X1M U24 ( .A(n13), .B(n12), .C(n11), .D(n10), .Y(N7) );
endmodule


module RX_Top_Module_Data_width_top8 ( RX_IN_top, prescale_top, PAR_EN_top, 
        PAR_TYP_top, CLK_top, RST_top, data_valid_top, P_DATA_top, stp_err_top, 
        par_err_top );
  input [5:0] prescale_top;
  output [7:0] P_DATA_top;
  input RX_IN_top, PAR_EN_top, PAR_TYP_top, CLK_top, RST_top;
  output data_valid_top, stp_err_top, par_err_top;
  wire   strt_glitch_top, dat_samp_en_top, enable_top, deser_en_top,
         par_chk_en_top, strt_chck_en_top, stp_chk_en_top, sampled_bit_top, n1,
         n2;
  wire   [5:0] edge_cnt_top;
  wire   [3:0] bit_cnt_top;

  FSM_RX FSM_INST ( .RX_IN(RX_IN_top), .PAR_EN(PAR_EN_top), .edge_cnt(
        edge_cnt_top), .bit_cnt(bit_cnt_top), .stp_err(stp_err_top), 
        .strt_glitch(strt_glitch_top), .par_err(par_err_top), .par_en(
        PAR_EN_top), .prescale(prescale_top), .CLK(CLK_top), .RST(n1), 
        .dat_samp_en(dat_samp_en_top), .enable(enable_top), .deser_en(
        deser_en_top), .data_valid(data_valid_top), .par_chk_en(par_chk_en_top), .strt_chck_en(strt_chck_en_top), .stp_chk_en(stp_chk_en_top) );
  data_sampling data_sampling_INST ( .prescale(prescale_top), .RX_IN(RX_IN_top), .dat_samp_en(dat_samp_en_top), .edge_cnt(edge_cnt_top), .CLK(CLK_top), .RST(
        n1), .sampled_bit(sampled_bit_top) );
  deserializer_Data_width8 deserializer_INST ( .sampled_bit(sampled_bit_top), 
        .deser_en(deser_en_top), .edge_cnt(edge_cnt_top), .bit_cnt(bit_cnt_top), .prescale(prescale_top), .CLK(CLK_top), .RST(n1), .P_DATA(P_DATA_top) );
  edge_bit_counter edge_bit_counter_INST ( .enable(enable_top), .prescale(
        prescale_top), .stp_chk_en(stp_chk_en_top), .CLK(CLK_top), .RST(n1), 
        .bit_cnt(bit_cnt_top), .edge_cnt(edge_cnt_top) );
  Strt_Check Strt_Check_INST ( .strt_chck_en(strt_chck_en_top), .sampled_bit(
        sampled_bit_top), .edge_cnt(edge_cnt_top), .prescale(prescale_top), 
        .strt_glitch(strt_glitch_top) );
  Parity_Check_Data_width8 Parity_Check_INST ( .par_chk_en(par_chk_en_top), 
        .PAR_TYP(PAR_TYP_top), .sampled_bit(sampled_bit_top), .P_DATA(
        P_DATA_top), .edge_cnt(edge_cnt_top), .prescale(prescale_top), 
        .par_err(par_err_top) );
  Stop_Check Stop_Check_INST ( .stp_chk_en(stp_chk_en_top), .sampled_bit(
        sampled_bit_top), .edge_cnt(edge_cnt_top), .prescale(prescale_top), 
        .stp_err(stp_err_top) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST_top), .Y(n2) );
endmodule


module UART_TOP_Data_width8 ( RX_IN, F_EMPTY_VALID, RD_Data, UART_CONFIG, 
        TX_CLK, RX_CLK, RST_UART, TX_OUT, BUSY, parity_error, Frame_error, 
        RX_OUT, RX_VALID );
  input [7:0] RD_Data;
  input [7:0] UART_CONFIG;
  output [7:0] RX_OUT;
  input RX_IN, F_EMPTY_VALID, TX_CLK, RX_CLK, RST_UART;
  output TX_OUT, BUSY, parity_error, Frame_error, RX_VALID;
  wire   n1, n2, n3;

  UART_TX_Data_width_top8 UART_TX_INST ( .p_data_TOP(RD_Data), 
        .data_valid_TOP(n1), .par_typ_TOP(UART_CONFIG[1]), .part_en_TOP(
        UART_CONFIG[0]), .CLK_TOP(TX_CLK), .RST_TOP(n2), .TX_OUT_TOP(TX_OUT), 
        .busy_TOP(BUSY) );
  RX_Top_Module_Data_width_top8 RX_Top_Module_inst ( .RX_IN_top(RX_IN), 
        .prescale_top(UART_CONFIG[7:2]), .PAR_EN_top(UART_CONFIG[0]), 
        .PAR_TYP_top(UART_CONFIG[1]), .CLK_top(RX_CLK), .RST_top(n2), 
        .data_valid_top(RX_VALID), .P_DATA_top(RX_OUT), .stp_err_top(
        Frame_error), .par_err_top(parity_error) );
  INVX2M U1 ( .A(F_EMPTY_VALID), .Y(n1) );
  INVX2M U2 ( .A(n3), .Y(n2) );
  INVX2M U3 ( .A(RST_UART), .Y(n3) );
endmodule


module SYS_CTRL_Data_width8_Address_width4_ALU_Operations4 ( Rd_Data, 
        REG_Rd_Data_valid, ALU_OUT, ALU_OUT_VALID, FIFO_FULL, SYNCED_DATA, 
        RX_DATA_VALID, CLK, RST, WrEn, RdEn, Addr, Wr_Data, Gate_EN, ALU_FUN, 
        En, WR_INC, WR_DATA, CLK_div_en );
  input [7:0] Rd_Data;
  input [15:0] ALU_OUT;
  input [7:0] SYNCED_DATA;
  output [3:0] Addr;
  output [7:0] Wr_Data;
  output [3:0] ALU_FUN;
  output [7:0] WR_DATA;
  input REG_Rd_Data_valid, ALU_OUT_VALID, FIFO_FULL, RX_DATA_VALID, CLK, RST;
  output WrEn, RdEn, Gate_EN, En, WR_INC, CLK_div_en;
  wire   n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n73,
         n74;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  DFFRQX2M \Addr_reg[1]  ( .D(n70), .CK(CLK), .RN(RST), .Q(Addr[1]) );
  DFFRQX2M \Addr_reg[2]  ( .D(n71), .CK(CLK), .RN(RST), .Q(Addr[2]) );
  DFFRQX2M \Addr_reg[3]  ( .D(n72), .CK(CLK), .RN(RST), .Q(Addr[3]) );
  DFFRQX2M \Addr_reg[0]  ( .D(n69), .CK(CLK), .RN(RST), .Q(Addr[0]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(1'b0), .Y(CLK_div_en) );
  NOR4X1M U5 ( .A(n14), .B(n13), .C(n12), .D(current_state[0]), .Y(n39) );
  OAI22X1M U6 ( .A0(n74), .A1(n27), .B0(ALU_OUT_VALID), .B1(n18), .Y(En) );
  INVX2M U7 ( .A(WrEn), .Y(n6) );
  INVX2M U8 ( .A(FIFO_FULL), .Y(n3) );
  AND2X2M U9 ( .A(n49), .B(n26), .Y(n56) );
  NOR3BX2M U10 ( .AN(n35), .B(n31), .C(n50), .Y(n58) );
  NOR2X2M U11 ( .A(n27), .B(n47), .Y(ALU_FUN[0]) );
  NOR2X2M U12 ( .A(n74), .B(n58), .Y(WrEn) );
  NOR2X2M U13 ( .A(n22), .B(n27), .Y(ALU_FUN[2]) );
  NOR2X2M U14 ( .A(n27), .B(n52), .Y(ALU_FUN[1]) );
  NOR2X2M U15 ( .A(n15), .B(n6), .Y(Wr_Data[6]) );
  NAND2X2M U16 ( .A(n59), .B(n9), .Y(n26) );
  NOR2X2M U17 ( .A(n26), .B(n13), .Y(n31) );
  NOR2X2M U18 ( .A(n27), .B(n57), .Y(ALU_FUN[3]) );
  NOR2X2M U19 ( .A(n58), .B(n52), .Y(Wr_Data[1]) );
  NOR2X2M U20 ( .A(n58), .B(n22), .Y(Wr_Data[2]) );
  NOR2X2M U21 ( .A(n58), .B(n47), .Y(Wr_Data[0]) );
  NOR2XLM U22 ( .A(n58), .B(n57), .Y(Wr_Data[3]) );
  AOI21X2M U23 ( .A0(n20), .A1(n60), .B0(FIFO_FULL), .Y(WR_INC) );
  NOR2X2M U24 ( .A(n73), .B(n6), .Y(Wr_Data[4]) );
  OAI21X2M U25 ( .A0(n48), .A1(n74), .B0(n49), .Y(n45) );
  AOI21X2M U26 ( .A0(n38), .A1(n37), .B0(n50), .Y(n48) );
  NOR2X2M U27 ( .A(n39), .B(n11), .Y(n20) );
  INVX2M U28 ( .A(n23), .Y(n5) );
  AND2X2M U29 ( .A(n33), .B(n21), .Y(n49) );
  NAND3X2M U30 ( .A(n12), .B(n13), .C(n43), .Y(n33) );
  INVX2M U31 ( .A(n28), .Y(n11) );
  INVX2M U32 ( .A(n60), .Y(n8) );
  OAI211X2M U33 ( .A0(n74), .A1(n33), .B0(n4), .C0(n34), .Y(next_state[1]) );
  AOI2B1X1M U34 ( .A1N(n35), .A0(n74), .B0(En), .Y(n34) );
  INVX2M U35 ( .A(n32), .Y(n4) );
  INVX2M U36 ( .A(n18), .Y(n10) );
  NOR2X2M U37 ( .A(n9), .B(current_state[3]), .Y(n43) );
  NAND3X2M U38 ( .A(current_state[0]), .B(n13), .C(n59), .Y(n27) );
  NOR2X2M U39 ( .A(n14), .B(current_state[1]), .Y(n59) );
  NAND2X2M U40 ( .A(SYNCED_DATA[2]), .B(RX_DATA_VALID), .Y(n22) );
  INVX2M U41 ( .A(current_state[2]), .Y(n13) );
  NOR2X2M U42 ( .A(n26), .B(current_state[2]), .Y(n50) );
  NOR2BX2M U43 ( .AN(SYNCED_DATA[7]), .B(n6), .Y(Wr_Data[7]) );
  NAND2X2M U44 ( .A(SYNCED_DATA[0]), .B(RX_DATA_VALID), .Y(n47) );
  NAND2X2M U45 ( .A(SYNCED_DATA[3]), .B(RX_DATA_VALID), .Y(n57) );
  INVX2M U46 ( .A(current_state[0]), .Y(n9) );
  INVX2M U47 ( .A(current_state[3]), .Y(n14) );
  NAND3X2M U48 ( .A(current_state[1]), .B(n13), .C(n43), .Y(n35) );
  NOR2X2M U49 ( .A(FIFO_FULL), .B(n67), .Y(WR_DATA[1]) );
  AOI222X1M U50 ( .A0(ALU_OUT[9]), .A1(n8), .B0(ALU_OUT[1]), .B1(n11), .C0(
        Rd_Data[1]), .C1(n39), .Y(n67) );
  NOR2X2M U51 ( .A(FIFO_FULL), .B(n66), .Y(WR_DATA[2]) );
  AOI222X1M U52 ( .A0(ALU_OUT[10]), .A1(n8), .B0(ALU_OUT[2]), .B1(n11), .C0(
        Rd_Data[2]), .C1(n39), .Y(n66) );
  NOR2X2M U53 ( .A(FIFO_FULL), .B(n65), .Y(WR_DATA[3]) );
  AOI222X1M U54 ( .A0(ALU_OUT[11]), .A1(n8), .B0(ALU_OUT[3]), .B1(n11), .C0(
        Rd_Data[3]), .C1(n39), .Y(n65) );
  NOR2X2M U55 ( .A(FIFO_FULL), .B(n64), .Y(WR_DATA[4]) );
  AOI222X1M U56 ( .A0(ALU_OUT[12]), .A1(n8), .B0(ALU_OUT[4]), .B1(n11), .C0(
        Rd_Data[4]), .C1(n39), .Y(n64) );
  NOR2X2M U57 ( .A(FIFO_FULL), .B(n63), .Y(WR_DATA[5]) );
  AOI222X1M U58 ( .A0(ALU_OUT[13]), .A1(n8), .B0(ALU_OUT[5]), .B1(n11), .C0(
        Rd_Data[5]), .C1(n39), .Y(n63) );
  NOR2X2M U59 ( .A(FIFO_FULL), .B(n62), .Y(WR_DATA[6]) );
  AOI222X1M U60 ( .A0(ALU_OUT[14]), .A1(n8), .B0(ALU_OUT[6]), .B1(n11), .C0(
        Rd_Data[6]), .C1(n39), .Y(n62) );
  NOR2X2M U61 ( .A(FIFO_FULL), .B(n61), .Y(WR_DATA[7]) );
  AOI222X1M U62 ( .A0(ALU_OUT[15]), .A1(n8), .B0(ALU_OUT[7]), .B1(n11), .C0(
        Rd_Data[7]), .C1(n39), .Y(n61) );
  NOR4BX1M U63 ( .AN(n37), .B(n15), .C(SYNCED_DATA[1]), .D(SYNCED_DATA[5]), 
        .Y(n23) );
  NAND3X2M U64 ( .A(n21), .B(n25), .C(n36), .Y(n32) );
  AOI32X1M U65 ( .A0(n37), .A1(RX_DATA_VALID), .A2(n38), .B0(n39), .B1(
        FIFO_FULL), .Y(n36) );
  NAND4BX1M U66 ( .AN(n24), .B(n28), .C(n29), .D(n30), .Y(next_state[2]) );
  NAND2X2M U67 ( .A(ALU_OUT_VALID), .B(n10), .Y(n29) );
  AOI221XLM U68 ( .A0(n8), .A1(FIFO_FULL), .B0(n31), .B1(n74), .C0(n32), .Y(
        n30) );
  NOR4BX1M U69 ( .AN(SYNCED_DATA[2]), .B(n5), .C(n73), .D(n47), .Y(n46) );
  NOR2X2M U70 ( .A(REG_Rd_Data_valid), .B(n25), .Y(RdEn) );
  OAI22X1M U71 ( .A0(current_state[2]), .A1(RX_DATA_VALID), .B0(
        current_state[1]), .B1(n3), .Y(n44) );
  NAND4X2M U72 ( .A(current_state[3]), .B(current_state[1]), .C(
        current_state[0]), .D(n13), .Y(n18) );
  NAND4X2M U73 ( .A(current_state[3]), .B(current_state[2]), .C(
        current_state[1]), .D(current_state[0]), .Y(n25) );
  NOR4X1M U74 ( .A(n22), .B(n5), .C(SYNCED_DATA[0]), .D(SYNCED_DATA[4]), .Y(
        n24) );
  NOR2BX2M U75 ( .AN(SYNCED_DATA[5]), .B(n6), .Y(Wr_Data[5]) );
  NAND3X2M U76 ( .A(current_state[2]), .B(current_state[0]), .C(n59), .Y(n28)
         );
  NAND2X2M U77 ( .A(SYNCED_DATA[1]), .B(RX_DATA_VALID), .Y(n52) );
  INVX2M U78 ( .A(RX_DATA_VALID), .Y(n74) );
  INVX2M U79 ( .A(current_state[1]), .Y(n12) );
  NAND3X2M U80 ( .A(current_state[2]), .B(n12), .C(n43), .Y(n60) );
  NOR2X2M U81 ( .A(FIFO_FULL), .B(n68), .Y(WR_DATA[0]) );
  AND4X2M U82 ( .A(SYNCED_DATA[3]), .B(n9), .C(SYNCED_DATA[7]), .D(n54), .Y(
        n37) );
  NOR3X2M U83 ( .A(current_state[1]), .B(current_state[3]), .C(
        current_state[2]), .Y(n54) );
  NAND4X2M U84 ( .A(n40), .B(n28), .C(n41), .D(n42), .Y(next_state[0]) );
  NAND4BX1M U85 ( .AN(n52), .B(SYNCED_DATA[5]), .C(n37), .D(n53), .Y(n40) );
  NOR3BX2M U86 ( .AN(n27), .B(n10), .C(RdEn), .Y(n41) );
  AOI211X2M U87 ( .A0(n43), .A1(n44), .B0(n45), .C0(n46), .Y(n42) );
  NAND4BX1M U88 ( .AN(n16), .B(n17), .C(n18), .D(n19), .Y(next_state[3]) );
  OA22X2M U89 ( .A0(n3), .A1(n20), .B0(n21), .B1(n74), .Y(n19) );
  NAND4BX1M U90 ( .AN(n22), .B(SYNCED_DATA[4]), .C(SYNCED_DATA[0]), .D(n23), 
        .Y(n17) );
  NAND4BX1M U91 ( .AN(n24), .B(n25), .C(n26), .D(n27), .Y(n16) );
  AND4X2M U92 ( .A(SYNCED_DATA[1]), .B(SYNCED_DATA[4]), .C(SYNCED_DATA[5]), 
        .D(n51), .Y(n38) );
  NOR3BX2M U93 ( .AN(SYNCED_DATA[0]), .B(SYNCED_DATA[6]), .C(SYNCED_DATA[2]), 
        .Y(n51) );
  NOR4X1M U94 ( .A(SYNCED_DATA[6]), .B(SYNCED_DATA[4]), .C(SYNCED_DATA[2]), 
        .D(SYNCED_DATA[0]), .Y(n53) );
  OAI21X2M U95 ( .A0(ALU_OUT_VALID), .A1(n18), .B0(n27), .Y(Gate_EN) );
  OAI211X2M U96 ( .A0(n49), .A1(n47), .B0(n7), .C0(n55), .Y(n69) );
  INVX2M U97 ( .A(n50), .Y(n7) );
  NAND2X2M U98 ( .A(Addr[0]), .B(n56), .Y(n55) );
  NAND3X2M U99 ( .A(current_state[2]), .B(current_state[1]), .C(n43), .Y(n21)
         );
  OAI2BB2X1M U100 ( .B0(n49), .B1(n22), .A0N(Addr[2]), .A1N(n56), .Y(n71) );
  OAI2BB2X1M U101 ( .B0(n49), .B1(n52), .A0N(Addr[1]), .A1N(n56), .Y(n70) );
  OAI2BB2X1M U102 ( .B0(n49), .B1(n57), .A0N(Addr[3]), .A1N(n56), .Y(n72) );
  INVX2M U103 ( .A(SYNCED_DATA[4]), .Y(n73) );
  INVX2M U104 ( .A(SYNCED_DATA[6]), .Y(n15) );
  AOI222X1M U105 ( .A0(ALU_OUT[8]), .A1(n8), .B0(ALU_OUT[0]), .B1(n11), .C0(
        Rd_Data[0]), .C1(n39), .Y(n68) );
endmodule


module Register_File_Data_width8_Address_width4 ( WrData, Address, WrEn, RdEn, 
        CLK, RST, RdData, RdData_Valid, REG0, REG1, REG2, REG3 );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, RST;
  output RdData_Valid;
  wire   N11, N12, N13, N14, \Reg_File[15][7] , \Reg_File[15][6] ,
         \Reg_File[15][5] , \Reg_File[15][4] , \Reg_File[15][3] ,
         \Reg_File[15][2] , \Reg_File[15][1] , \Reg_File[15][0] ,
         \Reg_File[14][7] , \Reg_File[14][6] , \Reg_File[14][5] ,
         \Reg_File[14][4] , \Reg_File[14][3] , \Reg_File[14][2] ,
         \Reg_File[14][1] , \Reg_File[14][0] , \Reg_File[13][7] ,
         \Reg_File[13][6] , \Reg_File[13][5] , \Reg_File[13][4] ,
         \Reg_File[13][3] , \Reg_File[13][2] , \Reg_File[13][1] ,
         \Reg_File[13][0] , \Reg_File[12][7] , \Reg_File[12][6] ,
         \Reg_File[12][5] , \Reg_File[12][4] , \Reg_File[12][3] ,
         \Reg_File[12][2] , \Reg_File[12][1] , \Reg_File[12][0] ,
         \Reg_File[11][7] , \Reg_File[11][6] , \Reg_File[11][5] ,
         \Reg_File[11][4] , \Reg_File[11][3] , \Reg_File[11][2] ,
         \Reg_File[11][1] , \Reg_File[11][0] , \Reg_File[10][7] ,
         \Reg_File[10][6] , \Reg_File[10][5] , \Reg_File[10][4] ,
         \Reg_File[10][3] , \Reg_File[10][2] , \Reg_File[10][1] ,
         \Reg_File[10][0] , \Reg_File[9][7] , \Reg_File[9][6] ,
         \Reg_File[9][5] , \Reg_File[9][4] , \Reg_File[9][3] ,
         \Reg_File[9][2] , \Reg_File[9][1] , \Reg_File[9][0] ,
         \Reg_File[8][7] , \Reg_File[8][6] , \Reg_File[8][5] ,
         \Reg_File[8][4] , \Reg_File[8][3] , \Reg_File[8][2] ,
         \Reg_File[8][1] , \Reg_File[8][0] , \Reg_File[7][7] ,
         \Reg_File[7][6] , \Reg_File[7][5] , \Reg_File[7][4] ,
         \Reg_File[7][3] , \Reg_File[7][2] , \Reg_File[7][1] ,
         \Reg_File[7][0] , \Reg_File[6][7] , \Reg_File[6][6] ,
         \Reg_File[6][5] , \Reg_File[6][4] , \Reg_File[6][3] ,
         \Reg_File[6][2] , \Reg_File[6][1] , \Reg_File[6][0] ,
         \Reg_File[5][7] , \Reg_File[5][6] , \Reg_File[5][5] ,
         \Reg_File[5][4] , \Reg_File[5][3] , \Reg_File[5][2] ,
         \Reg_File[5][1] , \Reg_File[5][0] , \Reg_File[4][7] ,
         \Reg_File[4][6] , \Reg_File[4][5] , \Reg_File[4][4] ,
         \Reg_File[4][3] , \Reg_File[4][2] , \Reg_File[4][1] ,
         \Reg_File[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13,
         n14, n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n17, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n208), .Q(RdData[0]) );
  DFFRQX2M \Reg_File_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n212), .Q(
        \Reg_File[13][7] ) );
  DFFRQX2M \Reg_File_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n212), .Q(
        \Reg_File[13][6] ) );
  DFFRQX2M \Reg_File_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][5] ) );
  DFFRQX2M \Reg_File_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][4] ) );
  DFFRQX2M \Reg_File_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][3] ) );
  DFFRQX2M \Reg_File_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][2] ) );
  DFFRQX2M \Reg_File_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][1] ) );
  DFFRQX2M \Reg_File_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n211), .Q(
        \Reg_File[13][0] ) );
  DFFRQX2M \Reg_File_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][7] ) );
  DFFRQX2M \Reg_File_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][6] ) );
  DFFRQX2M \Reg_File_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][5] ) );
  DFFRQX2M \Reg_File_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][4] ) );
  DFFRQX2M \Reg_File_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][3] ) );
  DFFRQX2M \Reg_File_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][2] ) );
  DFFRQX2M \Reg_File_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][1] ) );
  DFFRQX2M \Reg_File_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n209), .Q(
        \Reg_File[9][0] ) );
  DFFRQX2M \Reg_File_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][7] ) );
  DFFRQX2M \Reg_File_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][6] ) );
  DFFRQX2M \Reg_File_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][5] ) );
  DFFRQX2M \Reg_File_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][4] ) );
  DFFRQX2M \Reg_File_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][3] ) );
  DFFRQX2M \Reg_File_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][2] ) );
  DFFRQX2M \Reg_File_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][1] ) );
  DFFRQX2M \Reg_File_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n207), .Q(
        \Reg_File[5][0] ) );
  DFFRQX2M \Reg_File_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n204), .Q(
        \Reg_File[15][7] ) );
  DFFRQX2M \Reg_File_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n213), .Q(
        \Reg_File[15][6] ) );
  DFFRQX2M \Reg_File_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n213), .Q(
        \Reg_File[15][5] ) );
  DFFRQX2M \Reg_File_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][4] ) );
  DFFRQX2M \Reg_File_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][3] ) );
  DFFRQX2M \Reg_File_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][2] ) );
  DFFRQX2M \Reg_File_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][1] ) );
  DFFRQX2M \Reg_File_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n212), .Q(
        \Reg_File[15][0] ) );
  DFFRQX2M \Reg_File_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n211), .Q(
        \Reg_File[11][7] ) );
  DFFRQX2M \Reg_File_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][6] ) );
  DFFRQX2M \Reg_File_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][5] ) );
  DFFRQX2M \Reg_File_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][4] ) );
  DFFRQX2M \Reg_File_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][3] ) );
  DFFRQX2M \Reg_File_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][2] ) );
  DFFRQX2M \Reg_File_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][1] ) );
  DFFRQX2M \Reg_File_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n210), .Q(
        \Reg_File[11][0] ) );
  DFFRQX2M \Reg_File_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][7] ) );
  DFFRQX2M \Reg_File_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][6] ) );
  DFFRQX2M \Reg_File_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][5] ) );
  DFFRQX2M \Reg_File_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][4] ) );
  DFFRQX2M \Reg_File_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][3] ) );
  DFFRQX2M \Reg_File_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][2] ) );
  DFFRQX2M \Reg_File_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][1] ) );
  DFFRQX2M \Reg_File_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n208), .Q(
        \Reg_File[7][0] ) );
  DFFRQX2M \Reg_File_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][7] ) );
  DFFRQX2M \Reg_File_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][6] ) );
  DFFRQX2M \Reg_File_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][5] ) );
  DFFRQX2M \Reg_File_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][4] ) );
  DFFRQX2M \Reg_File_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][3] ) );
  DFFRQX2M \Reg_File_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][2] ) );
  DFFRQX2M \Reg_File_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][1] ) );
  DFFRQX2M \Reg_File_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n212), .Q(
        \Reg_File[14][0] ) );
  DFFRQX2M \Reg_File_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][7] ) );
  DFFRQX2M \Reg_File_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][6] ) );
  DFFRQX2M \Reg_File_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][5] ) );
  DFFRQX2M \Reg_File_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][4] ) );
  DFFRQX2M \Reg_File_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][3] ) );
  DFFRQX2M \Reg_File_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][2] ) );
  DFFRQX2M \Reg_File_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][1] ) );
  DFFRQX2M \Reg_File_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n210), .Q(
        \Reg_File[10][0] ) );
  DFFRQX2M \Reg_File_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][7] ) );
  DFFRQX2M \Reg_File_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][6] ) );
  DFFRQX2M \Reg_File_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][5] ) );
  DFFRQX2M \Reg_File_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][4] ) );
  DFFRQX2M \Reg_File_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n208), .Q(
        \Reg_File[6][3] ) );
  DFFRQX2M \Reg_File_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][2] ) );
  DFFRQX2M \Reg_File_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][1] ) );
  DFFRQX2M \Reg_File_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n207), .Q(
        \Reg_File[6][0] ) );
  DFFRQX2M \Reg_File_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][7] ) );
  DFFRQX2M \Reg_File_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][6] ) );
  DFFRQX2M \Reg_File_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][5] ) );
  DFFRQX2M \Reg_File_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][4] ) );
  DFFRQX2M \Reg_File_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][3] ) );
  DFFRQX2M \Reg_File_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][2] ) );
  DFFRQX2M \Reg_File_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][1] ) );
  DFFRQX2M \Reg_File_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n211), .Q(
        \Reg_File[12][0] ) );
  DFFRQX2M \Reg_File_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][7] ) );
  DFFRQX2M \Reg_File_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][6] ) );
  DFFRQX2M \Reg_File_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][5] ) );
  DFFRQX2M \Reg_File_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][4] ) );
  DFFRQX2M \Reg_File_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][3] ) );
  DFFRQX2M \Reg_File_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][2] ) );
  DFFRQX2M \Reg_File_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n209), .Q(
        \Reg_File[8][1] ) );
  DFFRQX2M \Reg_File_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n208), .Q(
        \Reg_File[8][0] ) );
  DFFRQX2M \Reg_File_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][7] ) );
  DFFRQX2M \Reg_File_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][6] ) );
  DFFRQX2M \Reg_File_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][5] ) );
  DFFRQX2M \Reg_File_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n207), .Q(
        \Reg_File[4][4] ) );
  DFFRQX2M \Reg_File_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][3] ) );
  DFFRQX2M \Reg_File_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][2] ) );
  DFFRQX2M \Reg_File_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][1] ) );
  DFFRQX2M \Reg_File_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n206), .Q(
        \Reg_File[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n204), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n204), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n204), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n206), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n204), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n204), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n204), .Q(RdData[1]) );
  DFFSQX2M \Reg_File_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n204), .Q(REG2[0]) );
  DFFRQX2M RdData_Valid_reg ( .D(n48), .CK(CLK), .RN(n204), .Q(RdData_Valid)
         );
  DFFRQX2M \Reg_File_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n206), .Q(REG3[0]) );
  DFFRQX2M \Reg_File_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n205), .Q(REG2[1]) );
  DFFRQX2M \Reg_File_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n206), .Q(REG3[7]) );
  DFFSQX2M \Reg_File_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n204), .Q(REG3[5]) );
  DFFRQX2M \Reg_File_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n206), .Q(REG3[3]) );
  DFFRQX2M \Reg_File_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n206), .Q(REG3[2]) );
  DFFRQX2M \Reg_File_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n206), .Q(REG3[1]) );
  DFFRQX2M \Reg_File_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n206), .Q(REG3[6]) );
  DFFRQX2M \Reg_File_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n206), .Q(REG3[4]) );
  DFFRQX2M \Reg_File_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n206), .Q(REG2[4]) );
  DFFSQX2M \Reg_File_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n204), .Q(REG2[7]) );
  DFFRQX2M \Reg_File_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n206), .Q(REG2[5]) );
  DFFRQX2M \Reg_File_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n206), .Q(REG2[6]) );
  DFFRQX2M \Reg_File_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n205), .Q(REG2[3]) );
  DFFRQX2M \Reg_File_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[2]) );
  DFFRQX2M \Reg_File_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n204), .Q(REG0[0]) );
  DFFRQX2M \Reg_File_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n205), .Q(REG0[3]) );
  DFFRQX2M \Reg_File_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n205), .Q(REG0[4]) );
  DFFRQX2M \Reg_File_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG2[2]) );
  DFFRQX2M \Reg_File_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \Reg_File_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n205), .Q(REG0[6]) );
  DFFRHQX2M \Reg_File_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n204), .Q(REG1[6])
         );
  DFFRHQX2M \Reg_File_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n205), .Q(REG0[7])
         );
  DFFRHQX2M \Reg_File_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n205), .Q(REG1[5])
         );
  DFFRHQX1M \Reg_File_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n204), .Q(REG1[0])
         );
  DFFRHQX2M \Reg_File_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n205), .Q(REG1[4])
         );
  DFFRQX2M \Reg_File_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n205), .Q(REG0[5]) );
  DFFRHQX1M \Reg_File_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n205), .Q(REG1[1])
         );
  DFFRHQX1M \Reg_File_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n205), .Q(REG1[2])
         );
  DFFRHQX4M \Reg_File_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n204), .Q(REG1[7])
         );
  DFFRHQX8M \Reg_File_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n205), .Q(REG1[3])
         );
  NOR2X2M U3 ( .A(n221), .B(n220), .Y(n1) );
  OAI2BB2XLM U4 ( .B0(n14), .B1(n226), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  MX2XLM U5 ( .A(REG0[5]), .B(WrData[5]), .S0(n219), .Y(n54) );
  MX2XLM U6 ( .A(REG0[6]), .B(WrData[6]), .S0(n219), .Y(n55) );
  NOR2X2M U7 ( .A(n203), .B(N13), .Y(n20) );
  NOR2BX2M U8 ( .AN(N13), .B(N12), .Y(n23) );
  NOR2BX2M U9 ( .AN(N13), .B(n203), .Y(n26) );
  INVX2M U10 ( .A(n202), .Y(n200) );
  INVX2M U11 ( .A(n14), .Y(n219) );
  INVX2M U12 ( .A(n199), .Y(n201) );
  BUFX2M U13 ( .A(n202), .Y(n199) );
  INVX2M U14 ( .A(n203), .Y(n198) );
  NAND2BX2M U15 ( .AN(n221), .B(n16), .Y(n14) );
  INVX2M U16 ( .A(n18), .Y(n220) );
  INVX2M U17 ( .A(WrData[1]), .Y(n228) );
  INVX2M U18 ( .A(WrData[2]), .Y(n229) );
  INVX2M U19 ( .A(WrData[0]), .Y(n227) );
  INVX2M U20 ( .A(WrData[3]), .Y(n230) );
  INVX2M U21 ( .A(WrData[4]), .Y(n226) );
  INVX2M U22 ( .A(WrData[6]), .Y(n224) );
  INVX2M U23 ( .A(n12), .Y(n222) );
  BUFX2M U24 ( .A(n218), .Y(n204) );
  BUFX2M U25 ( .A(n218), .Y(n205) );
  BUFX2M U26 ( .A(n217), .Y(n206) );
  BUFX2M U27 ( .A(n217), .Y(n207) );
  BUFX2M U28 ( .A(n216), .Y(n208) );
  BUFX2M U29 ( .A(n216), .Y(n209) );
  BUFX2M U30 ( .A(n215), .Y(n210) );
  BUFX2M U31 ( .A(n215), .Y(n211) );
  BUFX2M U32 ( .A(n214), .Y(n212) );
  BUFX2M U33 ( .A(n214), .Y(n213) );
  NOR2BX2M U34 ( .AN(n38), .B(n200), .Y(n30) );
  NOR2BX2M U35 ( .AN(n38), .B(n202), .Y(n32) );
  NOR2BX2M U36 ( .AN(n27), .B(n200), .Y(n16) );
  NOR2BX2M U37 ( .AN(n27), .B(n202), .Y(n18) );
  NAND2X2M U38 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U39 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U40 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U41 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U42 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U43 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U44 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U45 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U46 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U47 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U48 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U49 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U50 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U51 ( .A(n26), .B(n18), .Y(n28) );
  NOR2BX2M U52 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  INVX2M U53 ( .A(WrData[7]), .Y(n223) );
  INVX2M U54 ( .A(WrData[5]), .Y(n225) );
  NAND2BX2M U55 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  INVX2M U56 ( .A(n15), .Y(n221) );
  BUFX2M U57 ( .A(RST), .Y(n217) );
  BUFX2M U58 ( .A(RST), .Y(n216) );
  BUFX2M U59 ( .A(RST), .Y(n215) );
  BUFX2M U60 ( .A(RST), .Y(n214) );
  BUFX2M U61 ( .A(RST), .Y(n218) );
  OAI2BB2X1M U62 ( .B0(n227), .B1(n22), .A0N(\Reg_File[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U63 ( .B0(n228), .B1(n22), .A0N(\Reg_File[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U64 ( .B0(n229), .B1(n22), .A0N(\Reg_File[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U65 ( .B0(n230), .B1(n22), .A0N(\Reg_File[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U66 ( .B0(n226), .B1(n22), .A0N(\Reg_File[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U67 ( .B0(n225), .B1(n22), .A0N(\Reg_File[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U68 ( .B0(n224), .B1(n22), .A0N(\Reg_File[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U69 ( .B0(n223), .B1(n22), .A0N(\Reg_File[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U70 ( .B0(n227), .B1(n24), .A0N(\Reg_File[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U71 ( .B0(n228), .B1(n24), .A0N(\Reg_File[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U72 ( .B0(n229), .B1(n24), .A0N(\Reg_File[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U73 ( .B0(n230), .B1(n24), .A0N(\Reg_File[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U74 ( .B0(n226), .B1(n24), .A0N(\Reg_File[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U75 ( .B0(n225), .B1(n24), .A0N(\Reg_File[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U76 ( .B0(n224), .B1(n24), .A0N(\Reg_File[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U77 ( .B0(n223), .B1(n24), .A0N(\Reg_File[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U78 ( .B0(n227), .B1(n25), .A0N(\Reg_File[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U79 ( .B0(n228), .B1(n25), .A0N(\Reg_File[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U80 ( .B0(n229), .B1(n25), .A0N(\Reg_File[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U81 ( .B0(n230), .B1(n25), .A0N(\Reg_File[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U82 ( .B0(n226), .B1(n25), .A0N(\Reg_File[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U83 ( .B0(n225), .B1(n25), .A0N(\Reg_File[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U84 ( .B0(n224), .B1(n25), .A0N(\Reg_File[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U85 ( .B0(n223), .B1(n25), .A0N(\Reg_File[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U86 ( .B0(n227), .B1(n28), .A0N(\Reg_File[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U87 ( .B0(n228), .B1(n28), .A0N(\Reg_File[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U88 ( .B0(n229), .B1(n28), .A0N(\Reg_File[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U89 ( .B0(n230), .B1(n28), .A0N(\Reg_File[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U90 ( .B0(n226), .B1(n28), .A0N(\Reg_File[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U91 ( .B0(n225), .B1(n28), .A0N(\Reg_File[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U92 ( .B0(n224), .B1(n28), .A0N(\Reg_File[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U93 ( .B0(n223), .B1(n28), .A0N(\Reg_File[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U94 ( .B0(n227), .B1(n29), .A0N(\Reg_File[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U95 ( .B0(n228), .B1(n29), .A0N(\Reg_File[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U96 ( .B0(n229), .B1(n29), .A0N(\Reg_File[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U97 ( .B0(n230), .B1(n29), .A0N(\Reg_File[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U98 ( .B0(n226), .B1(n29), .A0N(\Reg_File[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U99 ( .B0(n225), .B1(n29), .A0N(\Reg_File[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U100 ( .B0(n224), .B1(n29), .A0N(\Reg_File[8][6] ), .A1N(n29), 
        .Y(n119) );
  OAI2BB2X1M U101 ( .B0(n223), .B1(n29), .A0N(\Reg_File[8][7] ), .A1N(n29), 
        .Y(n120) );
  OAI2BB2X1M U102 ( .B0(n227), .B1(n31), .A0N(\Reg_File[9][0] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U103 ( .B0(n228), .B1(n31), .A0N(\Reg_File[9][1] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U104 ( .B0(n229), .B1(n31), .A0N(\Reg_File[9][2] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U105 ( .B0(n230), .B1(n31), .A0N(\Reg_File[9][3] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U106 ( .B0(n226), .B1(n31), .A0N(\Reg_File[9][4] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U107 ( .B0(n225), .B1(n31), .A0N(\Reg_File[9][5] ), .A1N(n31), 
        .Y(n126) );
  OAI2BB2X1M U108 ( .B0(n224), .B1(n31), .A0N(\Reg_File[9][6] ), .A1N(n31), 
        .Y(n127) );
  OAI2BB2X1M U109 ( .B0(n223), .B1(n31), .A0N(\Reg_File[9][7] ), .A1N(n31), 
        .Y(n128) );
  OAI2BB2X1M U110 ( .B0(n227), .B1(n33), .A0N(\Reg_File[10][0] ), .A1N(n33), 
        .Y(n129) );
  OAI2BB2X1M U111 ( .B0(n228), .B1(n33), .A0N(\Reg_File[10][1] ), .A1N(n33), 
        .Y(n130) );
  OAI2BB2X1M U112 ( .B0(n229), .B1(n33), .A0N(\Reg_File[10][2] ), .A1N(n33), 
        .Y(n131) );
  OAI2BB2X1M U113 ( .B0(n230), .B1(n33), .A0N(\Reg_File[10][3] ), .A1N(n33), 
        .Y(n132) );
  OAI2BB2X1M U114 ( .B0(n226), .B1(n33), .A0N(\Reg_File[10][4] ), .A1N(n33), 
        .Y(n133) );
  OAI2BB2X1M U115 ( .B0(n225), .B1(n33), .A0N(\Reg_File[10][5] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U116 ( .B0(n224), .B1(n33), .A0N(\Reg_File[10][6] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U117 ( .B0(n223), .B1(n33), .A0N(\Reg_File[10][7] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U118 ( .B0(n227), .B1(n34), .A0N(\Reg_File[11][0] ), .A1N(n34), 
        .Y(n137) );
  OAI2BB2X1M U119 ( .B0(n228), .B1(n34), .A0N(\Reg_File[11][1] ), .A1N(n34), 
        .Y(n138) );
  OAI2BB2X1M U120 ( .B0(n229), .B1(n34), .A0N(\Reg_File[11][2] ), .A1N(n34), 
        .Y(n139) );
  OAI2BB2X1M U121 ( .B0(n230), .B1(n34), .A0N(\Reg_File[11][3] ), .A1N(n34), 
        .Y(n140) );
  OAI2BB2X1M U122 ( .B0(n226), .B1(n34), .A0N(\Reg_File[11][4] ), .A1N(n34), 
        .Y(n141) );
  OAI2BB2X1M U123 ( .B0(n225), .B1(n34), .A0N(\Reg_File[11][5] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U124 ( .B0(n224), .B1(n34), .A0N(\Reg_File[11][6] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U125 ( .B0(n223), .B1(n34), .A0N(\Reg_File[11][7] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U126 ( .B0(n227), .B1(n35), .A0N(\Reg_File[12][0] ), .A1N(n35), 
        .Y(n145) );
  OAI2BB2X1M U127 ( .B0(n228), .B1(n35), .A0N(\Reg_File[12][1] ), .A1N(n35), 
        .Y(n146) );
  OAI2BB2X1M U128 ( .B0(n229), .B1(n35), .A0N(\Reg_File[12][2] ), .A1N(n35), 
        .Y(n147) );
  OAI2BB2X1M U129 ( .B0(n230), .B1(n35), .A0N(\Reg_File[12][3] ), .A1N(n35), 
        .Y(n148) );
  OAI2BB2X1M U130 ( .B0(n226), .B1(n35), .A0N(\Reg_File[12][4] ), .A1N(n35), 
        .Y(n149) );
  OAI2BB2X1M U131 ( .B0(n225), .B1(n35), .A0N(\Reg_File[12][5] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U132 ( .B0(n224), .B1(n35), .A0N(\Reg_File[12][6] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U133 ( .B0(n223), .B1(n35), .A0N(\Reg_File[12][7] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U134 ( .B0(n227), .B1(n36), .A0N(\Reg_File[13][0] ), .A1N(n36), 
        .Y(n153) );
  OAI2BB2X1M U135 ( .B0(n228), .B1(n36), .A0N(\Reg_File[13][1] ), .A1N(n36), 
        .Y(n154) );
  OAI2BB2X1M U136 ( .B0(n229), .B1(n36), .A0N(\Reg_File[13][2] ), .A1N(n36), 
        .Y(n155) );
  OAI2BB2X1M U137 ( .B0(n230), .B1(n36), .A0N(\Reg_File[13][3] ), .A1N(n36), 
        .Y(n156) );
  OAI2BB2X1M U138 ( .B0(n226), .B1(n36), .A0N(\Reg_File[13][4] ), .A1N(n36), 
        .Y(n157) );
  OAI2BB2X1M U139 ( .B0(n225), .B1(n36), .A0N(\Reg_File[13][5] ), .A1N(n36), 
        .Y(n158) );
  OAI2BB2X1M U140 ( .B0(n224), .B1(n36), .A0N(\Reg_File[13][6] ), .A1N(n36), 
        .Y(n159) );
  OAI2BB2X1M U141 ( .B0(n223), .B1(n36), .A0N(\Reg_File[13][7] ), .A1N(n36), 
        .Y(n160) );
  OAI2BB2X1M U142 ( .B0(n227), .B1(n37), .A0N(\Reg_File[14][0] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U143 ( .B0(n228), .B1(n37), .A0N(\Reg_File[14][1] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U144 ( .B0(n229), .B1(n37), .A0N(\Reg_File[14][2] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U145 ( .B0(n230), .B1(n37), .A0N(\Reg_File[14][3] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U146 ( .B0(n226), .B1(n37), .A0N(\Reg_File[14][4] ), .A1N(n37), 
        .Y(n165) );
  OAI2BB2X1M U147 ( .B0(n225), .B1(n37), .A0N(\Reg_File[14][5] ), .A1N(n37), 
        .Y(n166) );
  OAI2BB2X1M U148 ( .B0(n224), .B1(n37), .A0N(\Reg_File[14][6] ), .A1N(n37), 
        .Y(n167) );
  OAI2BB2X1M U149 ( .B0(n223), .B1(n37), .A0N(\Reg_File[14][7] ), .A1N(n37), 
        .Y(n168) );
  OAI2BB2X1M U150 ( .B0(n227), .B1(n39), .A0N(\Reg_File[15][0] ), .A1N(n39), 
        .Y(n169) );
  OAI2BB2X1M U151 ( .B0(n228), .B1(n39), .A0N(\Reg_File[15][1] ), .A1N(n39), 
        .Y(n170) );
  OAI2BB2X1M U152 ( .B0(n229), .B1(n39), .A0N(\Reg_File[15][2] ), .A1N(n39), 
        .Y(n171) );
  OAI2BB2X1M U153 ( .B0(n230), .B1(n39), .A0N(\Reg_File[15][3] ), .A1N(n39), 
        .Y(n172) );
  OAI2BB2X1M U154 ( .B0(n226), .B1(n39), .A0N(\Reg_File[15][4] ), .A1N(n39), 
        .Y(n173) );
  OAI2BB2X1M U155 ( .B0(n225), .B1(n39), .A0N(\Reg_File[15][5] ), .A1N(n39), 
        .Y(n174) );
  OAI2BB2X1M U156 ( .B0(n224), .B1(n39), .A0N(\Reg_File[15][6] ), .A1N(n39), 
        .Y(n175) );
  OAI2BB2X1M U157 ( .B0(n223), .B1(n39), .A0N(\Reg_File[15][7] ), .A1N(n39), 
        .Y(n176) );
  OAI2BB2X1M U158 ( .B0(n228), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U159 ( .B0(n229), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U160 ( .B0(n230), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U161 ( .B0(n226), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U162 ( .B0(n225), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U163 ( .B0(n224), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U164 ( .B0(n227), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U165 ( .B0(n228), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U166 ( .B0(n229), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U167 ( .B0(n230), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U168 ( .B0(n226), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U169 ( .B0(n224), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U170 ( .B0(n223), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  NOR2BX2M U171 ( .AN(n13), .B(N14), .Y(n27) );
  OAI2BB2X1M U172 ( .B0(n227), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U173 ( .B0(n223), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U174 ( .B0(n225), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  OAI2BB2X1M U175 ( .B0(n14), .B1(n227), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U176 ( .B0(n14), .B1(n228), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U177 ( .B0(n14), .B1(n229), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U178 ( .B0(n14), .B1(n230), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  MX2XLM U179 ( .A(REG1[1]), .B(WrData[1]), .S0(n1), .Y(n58) );
  MX2XLM U180 ( .A(REG1[2]), .B(WrData[2]), .S0(n1), .Y(n59) );
  MX2XLM U181 ( .A(REG1[5]), .B(WrData[5]), .S0(n1), .Y(n62) );
  MX2XLM U182 ( .A(REG1[4]), .B(WrData[4]), .S0(n1), .Y(n61) );
  AND2X2M U183 ( .A(N14), .B(n13), .Y(n38) );
  MX4XLM U184 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n200), 
        .S1(N12), .Y(n9) );
  MX4X1M U185 ( .A(\Reg_File[4][1] ), .B(\Reg_File[5][1] ), .C(
        \Reg_File[6][1] ), .D(\Reg_File[7][1] ), .S0(n200), .S1(N12), .Y(n8)
         );
  MX4X1M U186 ( .A(\Reg_File[4][2] ), .B(\Reg_File[5][2] ), .C(
        \Reg_File[6][2] ), .D(\Reg_File[7][2] ), .S0(n200), .S1(N12), .Y(n17)
         );
  MX4X1M U187 ( .A(\Reg_File[4][4] ), .B(\Reg_File[5][4] ), .C(
        \Reg_File[6][4] ), .D(\Reg_File[7][4] ), .S0(n200), .S1(N12), .Y(n184)
         );
  MX4X1M U188 ( .A(\Reg_File[4][5] ), .B(\Reg_File[5][5] ), .C(
        \Reg_File[6][5] ), .D(\Reg_File[7][5] ), .S0(n201), .S1(n198), .Y(n188) );
  MX4X1M U189 ( .A(\Reg_File[12][0] ), .B(\Reg_File[13][0] ), .C(
        \Reg_File[14][0] ), .D(\Reg_File[15][0] ), .S0(n200), .S1(n198), .Y(n2) );
  MX4X1M U190 ( .A(\Reg_File[12][2] ), .B(\Reg_File[13][2] ), .C(
        \Reg_File[14][2] ), .D(\Reg_File[15][2] ), .S0(n200), .S1(N12), .Y(n10) );
  MX4X1M U191 ( .A(\Reg_File[12][3] ), .B(\Reg_File[13][3] ), .C(
        \Reg_File[14][3] ), .D(\Reg_File[15][3] ), .S0(n200), .S1(N12), .Y(
        n178) );
  MX4X1M U192 ( .A(\Reg_File[12][4] ), .B(\Reg_File[13][4] ), .C(
        \Reg_File[14][4] ), .D(\Reg_File[15][4] ), .S0(n200), .S1(N12), .Y(
        n182) );
  MX4X1M U193 ( .A(\Reg_File[12][5] ), .B(\Reg_File[13][5] ), .C(
        \Reg_File[14][5] ), .D(\Reg_File[15][5] ), .S0(n201), .S1(n198), .Y(
        n186) );
  MX4X1M U194 ( .A(\Reg_File[12][6] ), .B(\Reg_File[13][6] ), .C(
        \Reg_File[14][6] ), .D(\Reg_File[15][6] ), .S0(n201), .S1(n198), .Y(
        n190) );
  MX4X1M U195 ( .A(\Reg_File[12][7] ), .B(\Reg_File[13][7] ), .C(
        \Reg_File[14][7] ), .D(\Reg_File[15][7] ), .S0(n201), .S1(n198), .Y(
        n194) );
  OAI2BB1X2M U196 ( .A0N(RdData_Valid), .A1N(n13), .B0(n12), .Y(n48) );
  AO22X1M U197 ( .A0(N43), .A1(n222), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U198 ( .A(n5), .B(n3), .C(n4), .D(n2), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U199 ( .A(\Reg_File[8][0] ), .B(\Reg_File[9][0] ), .C(
        \Reg_File[10][0] ), .D(\Reg_File[11][0] ), .S0(N11), .S1(N12), .Y(n3)
         );
  MX4X1M U200 ( .A(\Reg_File[4][0] ), .B(\Reg_File[5][0] ), .C(
        \Reg_File[6][0] ), .D(\Reg_File[7][0] ), .S0(N11), .S1(N12), .Y(n4) );
  AO22X1M U201 ( .A0(N42), .A1(n222), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U202 ( .A(n9), .B(n7), .C(n8), .D(n6), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U203 ( .A(\Reg_File[8][1] ), .B(\Reg_File[9][1] ), .C(
        \Reg_File[10][1] ), .D(\Reg_File[11][1] ), .S0(N11), .S1(N12), .Y(n7)
         );
  MX4X1M U204 ( .A(\Reg_File[12][1] ), .B(\Reg_File[13][1] ), .C(
        \Reg_File[14][1] ), .D(\Reg_File[15][1] ), .S0(n200), .S1(n198), .Y(n6) );
  AO22X1M U205 ( .A0(N41), .A1(n222), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U206 ( .A(n177), .B(n11), .C(n17), .D(n10), .S0(N14), .S1(N13), .Y(
        N41) );
  MX4XLM U207 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n200), 
        .S1(N12), .Y(n177) );
  MX4X1M U208 ( .A(\Reg_File[8][2] ), .B(\Reg_File[9][2] ), .C(
        \Reg_File[10][2] ), .D(\Reg_File[11][2] ), .S0(n200), .S1(N12), .Y(n11) );
  AO22X1M U209 ( .A0(N40), .A1(n222), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U210 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U211 ( .A(\Reg_File[8][3] ), .B(\Reg_File[9][3] ), .C(
        \Reg_File[10][3] ), .D(\Reg_File[11][3] ), .S0(n200), .S1(N12), .Y(
        n179) );
  MX4X1M U212 ( .A(\Reg_File[4][3] ), .B(\Reg_File[5][3] ), .C(
        \Reg_File[6][3] ), .D(\Reg_File[7][3] ), .S0(n200), .S1(N12), .Y(n180)
         );
  AO22X1M U213 ( .A0(N39), .A1(n222), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U214 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4XLM U215 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n201), 
        .S1(N12), .Y(n185) );
  MX4X1M U216 ( .A(\Reg_File[8][4] ), .B(\Reg_File[9][4] ), .C(
        \Reg_File[10][4] ), .D(\Reg_File[11][4] ), .S0(n200), .S1(N12), .Y(
        n183) );
  AO22X1M U217 ( .A0(N38), .A1(n222), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U218 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4XLM U219 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n201), 
        .S1(n198), .Y(n189) );
  MX4X1M U220 ( .A(\Reg_File[8][5] ), .B(\Reg_File[9][5] ), .C(
        \Reg_File[10][5] ), .D(\Reg_File[11][5] ), .S0(n201), .S1(n198), .Y(
        n187) );
  AO22X1M U221 ( .A0(N37), .A1(n222), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U222 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U223 ( .A(\Reg_File[8][6] ), .B(\Reg_File[9][6] ), .C(
        \Reg_File[10][6] ), .D(\Reg_File[11][6] ), .S0(n201), .S1(n198), .Y(
        n191) );
  MX4X1M U224 ( .A(\Reg_File[4][6] ), .B(\Reg_File[5][6] ), .C(
        \Reg_File[6][6] ), .D(\Reg_File[7][6] ), .S0(n201), .S1(n198), .Y(n192) );
  AO22X1M U225 ( .A0(N36), .A1(n222), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U226 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U227 ( .A(\Reg_File[8][7] ), .B(\Reg_File[9][7] ), .C(
        \Reg_File[10][7] ), .D(\Reg_File[11][7] ), .S0(n201), .S1(n198), .Y(
        n195) );
  MX4X1M U228 ( .A(\Reg_File[4][7] ), .B(\Reg_File[5][7] ), .C(
        \Reg_File[6][7] ), .D(\Reg_File[7][7] ), .S0(n201), .S1(n198), .Y(n196) );
  INVX2M U229 ( .A(N11), .Y(n202) );
  NOR2X2M U230 ( .A(n198), .B(N13), .Y(n15) );
  INVX2M U231 ( .A(N12), .Y(n203) );
  MX4XLM U232 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n201), 
        .S1(n198), .Y(n197) );
  MX4XLM U233 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n201), 
        .S1(n198), .Y(n193) );
  MX4XLM U234 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n201), 
        .S1(N12), .Y(n5) );
  MX4XLM U235 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n200), 
        .S1(N12), .Y(n181) );
  MX2XLM U236 ( .A(REG1[3]), .B(WrData[3]), .S0(n1), .Y(n60) );
  MX2XLM U237 ( .A(REG1[0]), .B(WrData[0]), .S0(n1), .Y(n57) );
  MX2XLM U238 ( .A(REG0[7]), .B(WrData[7]), .S0(n219), .Y(n56) );
  MX2XLM U239 ( .A(REG1[7]), .B(WrData[7]), .S0(n1), .Y(n64) );
  MX2XLM U240 ( .A(REG1[6]), .B(WrData[6]), .S0(n1), .Y(n63) );
endmodule


module ALU_input_width8_output_width16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  INVX2M U1 ( .A(n10), .Y(n1) );
  INVXLM U2 ( .A(B[2]), .Y(n8) );
  INVXLM U3 ( .A(B[5]), .Y(n5) );
  INVXLM U4 ( .A(B[1]), .Y(n9) );
  NAND2X2M U5 ( .A(n1), .B(n2), .Y(carry[1]) );
  INVX2M U6 ( .A(A[0]), .Y(n2) );
  XNOR2X2M U7 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVXLM U8 ( .A(B[3]), .Y(n7) );
  INVX2M U9 ( .A(B[4]), .Y(n6) );
  INVXLM U10 ( .A(B[7]), .Y(n3) );
  INVXLM U11 ( .A(B[6]), .Y(n4) );
  INVXLM U12 ( .A(B[0]), .Y(n10) );
  CLKINVX1M U13 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_input_width8_output_width16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;

  wire   [8:1] carry;

  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFX2M U1_0 ( .A(A[0]), .B(B[0]), .CI(1'b0), .CO(carry[1]), .S(SUM[0]) );
endmodule


module ALU_input_width8_output_width16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  INVX2M U4 ( .A(A[6]), .Y(n9) );
  XNOR2X2M U5 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  INVX2M U6 ( .A(n9), .Y(SUM[6]) );
  XNOR2X2M U7 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U8 ( .A(B[7]), .Y(n8) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_input_width8_output_width16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;

  ALU_input_width8_output_width16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , 
        \A1[11] , \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , 
        \A1[4] , \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n14, n15, 
        n13, n12, n11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), 
        .SUM(PRODUCT[15:2]) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n3), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVXLM U10 ( .A(B[1]), .Y(n31) );
  INVXLM U11 ( .A(A[6]), .Y(n34) );
  AND2X2M U12 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  XNOR2X2M U13 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U14 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U17 ( .A(\ab[0][3] ), .Y(n20) );
  INVX2M U18 ( .A(\ab[0][5] ), .Y(n22) );
  INVX2M U19 ( .A(\ab[0][6] ), .Y(n23) );
  INVX2M U20 ( .A(\ab[0][7] ), .Y(n24) );
  INVX2M U21 ( .A(\ab[0][4] ), .Y(n21) );
  XNOR2X2M U22 ( .A(\ab[1][2] ), .B(n20), .Y(\SUMB[1][2] ) );
  AND2X2M U23 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U27 ( .A(\ab[0][2] ), .Y(n19) );
  XNOR2X2M U28 ( .A(\ab[1][1] ), .B(n19), .Y(\SUMB[1][1] ) );
  AND2X2M U29 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U30 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U31 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  AND2X2M U32 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n15) );
  INVX2M U33 ( .A(A[7]), .Y(n33) );
  AND2X2M U34 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  XNOR2X2M U35 ( .A(\ab[1][4] ), .B(n22), .Y(\SUMB[1][4] ) );
  XNOR2X2M U36 ( .A(\ab[1][5] ), .B(n23), .Y(\SUMB[1][5] ) );
  XNOR2X2M U37 ( .A(\ab[1][6] ), .B(n24), .Y(\SUMB[1][6] ) );
  XNOR2X2M U38 ( .A(\ab[1][3] ), .B(n21), .Y(\SUMB[1][3] ) );
  INVX2M U39 ( .A(A[2]), .Y(n38) );
  INVX2M U40 ( .A(A[3]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n36) );
  INVX2M U42 ( .A(A[5]), .Y(n35) );
  XNOR2X2M U43 ( .A(\ab[1][0] ), .B(n18), .Y(PRODUCT[1]) );
  INVX2M U44 ( .A(\ab[0][1] ), .Y(n18) );
  INVX2M U45 ( .A(A[1]), .Y(n39) );
  INVX2M U46 ( .A(A[0]), .Y(n40) );
  INVXLM U47 ( .A(B[2]), .Y(n30) );
  INVXLM U48 ( .A(B[3]), .Y(n29) );
  INVXLM U49 ( .A(B[5]), .Y(n27) );
  INVX2M U50 ( .A(B[4]), .Y(n28) );
  INVXLM U51 ( .A(B[7]), .Y(n25) );
  INVXLM U52 ( .A(B[6]), .Y(n26) );
  INVXLM U53 ( .A(B[0]), .Y(n32) );
  NOR2X1M U55 ( .A(n33), .B(n25), .Y(\ab[7][7] ) );
  NOR2X1M U56 ( .A(n33), .B(n26), .Y(\ab[7][6] ) );
  NOR2X1M U57 ( .A(n33), .B(n27), .Y(\ab[7][5] ) );
  NOR2X1M U58 ( .A(n33), .B(n28), .Y(\ab[7][4] ) );
  NOR2X1M U59 ( .A(n33), .B(n29), .Y(\ab[7][3] ) );
  NOR2X1M U60 ( .A(n33), .B(n30), .Y(\ab[7][2] ) );
  NOR2X1M U61 ( .A(n33), .B(n31), .Y(\ab[7][1] ) );
  NOR2X1M U62 ( .A(n33), .B(n32), .Y(\ab[7][0] ) );
  NOR2X1M U63 ( .A(n25), .B(n34), .Y(\ab[6][7] ) );
  NOR2X1M U64 ( .A(n26), .B(n34), .Y(\ab[6][6] ) );
  NOR2X1M U65 ( .A(n27), .B(n34), .Y(\ab[6][5] ) );
  NOR2X1M U66 ( .A(n28), .B(n34), .Y(\ab[6][4] ) );
  NOR2X1M U67 ( .A(n29), .B(n34), .Y(\ab[6][3] ) );
  NOR2X1M U68 ( .A(n30), .B(n34), .Y(\ab[6][2] ) );
  NOR2X1M U69 ( .A(n31), .B(n34), .Y(\ab[6][1] ) );
  NOR2X1M U70 ( .A(n32), .B(n34), .Y(\ab[6][0] ) );
  NOR2X1M U71 ( .A(n25), .B(n35), .Y(\ab[5][7] ) );
  NOR2X1M U72 ( .A(n26), .B(n35), .Y(\ab[5][6] ) );
  NOR2X1M U73 ( .A(n27), .B(n35), .Y(\ab[5][5] ) );
  NOR2X1M U74 ( .A(n28), .B(n35), .Y(\ab[5][4] ) );
  NOR2X1M U75 ( .A(n29), .B(n35), .Y(\ab[5][3] ) );
  NOR2X1M U76 ( .A(n30), .B(n35), .Y(\ab[5][2] ) );
  NOR2X1M U77 ( .A(n31), .B(n35), .Y(\ab[5][1] ) );
  NOR2X1M U78 ( .A(n32), .B(n35), .Y(\ab[5][0] ) );
  NOR2X1M U79 ( .A(n25), .B(n36), .Y(\ab[4][7] ) );
  NOR2X1M U80 ( .A(n26), .B(n36), .Y(\ab[4][6] ) );
  NOR2X1M U81 ( .A(n27), .B(n36), .Y(\ab[4][5] ) );
  NOR2X1M U82 ( .A(n28), .B(n36), .Y(\ab[4][4] ) );
  NOR2X1M U83 ( .A(n29), .B(n36), .Y(\ab[4][3] ) );
  NOR2X1M U84 ( .A(n30), .B(n36), .Y(\ab[4][2] ) );
  NOR2X1M U85 ( .A(n31), .B(n36), .Y(\ab[4][1] ) );
  NOR2X1M U86 ( .A(n32), .B(n36), .Y(\ab[4][0] ) );
  NOR2X1M U87 ( .A(n25), .B(n37), .Y(\ab[3][7] ) );
  NOR2X1M U88 ( .A(n26), .B(n37), .Y(\ab[3][6] ) );
  NOR2X1M U89 ( .A(n27), .B(n37), .Y(\ab[3][5] ) );
  NOR2X1M U90 ( .A(n28), .B(n37), .Y(\ab[3][4] ) );
  NOR2X1M U91 ( .A(n29), .B(n37), .Y(\ab[3][3] ) );
  NOR2X1M U92 ( .A(n30), .B(n37), .Y(\ab[3][2] ) );
  NOR2X1M U93 ( .A(n31), .B(n37), .Y(\ab[3][1] ) );
  NOR2X1M U94 ( .A(n32), .B(n37), .Y(\ab[3][0] ) );
  NOR2X1M U95 ( .A(n25), .B(n38), .Y(\ab[2][7] ) );
  NOR2X1M U96 ( .A(n26), .B(n38), .Y(\ab[2][6] ) );
  NOR2X1M U97 ( .A(n27), .B(n38), .Y(\ab[2][5] ) );
  NOR2X1M U98 ( .A(n28), .B(n38), .Y(\ab[2][4] ) );
  NOR2X1M U99 ( .A(n29), .B(n38), .Y(\ab[2][3] ) );
  NOR2X1M U100 ( .A(n30), .B(n38), .Y(\ab[2][2] ) );
  NOR2X1M U101 ( .A(n31), .B(n38), .Y(\ab[2][1] ) );
  NOR2X1M U102 ( .A(n32), .B(n38), .Y(\ab[2][0] ) );
  NOR2X1M U103 ( .A(n25), .B(n39), .Y(\ab[1][7] ) );
  NOR2X1M U104 ( .A(n26), .B(n39), .Y(\ab[1][6] ) );
  NOR2X1M U105 ( .A(n27), .B(n39), .Y(\ab[1][5] ) );
  NOR2X1M U106 ( .A(n28), .B(n39), .Y(\ab[1][4] ) );
  NOR2X1M U107 ( .A(n29), .B(n39), .Y(\ab[1][3] ) );
  NOR2X1M U108 ( .A(n30), .B(n39), .Y(\ab[1][2] ) );
  NOR2X1M U109 ( .A(n31), .B(n39), .Y(\ab[1][1] ) );
  NOR2X1M U110 ( .A(n32), .B(n39), .Y(\ab[1][0] ) );
  NOR2X1M U111 ( .A(n25), .B(n40), .Y(\ab[0][7] ) );
  NOR2X1M U112 ( .A(n26), .B(n40), .Y(\ab[0][6] ) );
  NOR2X1M U113 ( .A(n27), .B(n40), .Y(\ab[0][5] ) );
  NOR2X1M U114 ( .A(n28), .B(n40), .Y(\ab[0][4] ) );
  NOR2X1M U115 ( .A(n29), .B(n40), .Y(\ab[0][3] ) );
  NOR2X1M U116 ( .A(n30), .B(n40), .Y(\ab[0][2] ) );
  NOR2X1M U117 ( .A(n31), .B(n40), .Y(\ab[0][1] ) );
  NOR2X1M U118 ( .A(n32), .B(n40), .Y(PRODUCT[0]) );
endmodule


module ALU_input_width8_output_width16_DW_div_uns_1 ( a, b, quotient, 
        remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] ,
         \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] , \u_div/SumTmp[1][6] ,
         \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] ,
         \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] , \u_div/SumTmp[2][5] ,
         \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] ,
         \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] , \u_div/SumTmp[4][0] ,
         \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] ,
         \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] ,
         \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][2] , \u_div/PartRem[2][3] ,
         \u_div/PartRem[2][4] , \u_div/PartRem[2][5] , \u_div/PartRem[2][6] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[5][1] , \u_div/PartRem[6][1] ,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n45, n46,
         n47, n48, n50, n51, n52, n53, n54, n55, n56, n57, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102;
  wire   [7:0] \u_div/BInv ;

  ADDFHX8M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), 
        .S(\u_div/SumTmp[5][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_3  ( .A(n41), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_4  ( .A(n48), .B(\u_div/BInv [4]), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_5  ( .A(n47), .B(\u_div/BInv [5]), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_1  ( .A(n59), .B(\u_div/BInv [1]), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_1  ( .A(n62), .B(\u_div/BInv [1]), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_5_2  ( .A(n39), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_2  ( .A(n42), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), 
        .S(\u_div/SumTmp[1][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), 
        .S(\u_div/SumTmp[1][4] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), 
        .S(\u_div/SumTmp[1][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), 
        .S(\u_div/SumTmp[1][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), 
        .S(\u_div/SumTmp[1][6] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_4_3  ( .A(n53), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(
        \u_div/BInv [7]), .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX2M \u_div/u_fa_PartRem_0_3_3  ( .A(n43), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_2  ( .A(n45), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_3_4  ( .A(n40), .B(\u_div/BInv [4]), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), 
        .S(\u_div/SumTmp[4][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_6_0  ( .A(a[6]), .B(\u_div/BInv [0]), .CI(
        1'b1), .CO(\u_div/CryTmp[6][1] ), .S(\u_div/SumTmp[6][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_0  ( .A(a[5]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[5][1] ), .S(\u_div/SumTmp[5][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_0  ( .A(a[4]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[4][1] ), .S(\u_div/SumTmp[4][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_0  ( .A(a[3]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[3][1] ), .S(\u_div/SumTmp[3][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_0  ( .A(a[2]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[2][1] ), .S(\u_div/SumTmp[2][0] ) );
  NAND2X2M U1 ( .A(\u_div/PartRem[1][1] ), .B(\u_div/CryTmp[0][1] ), .Y(n1) );
  NAND2X2M U2 ( .A(\u_div/PartRem[1][1] ), .B(\u_div/BInv [1]), .Y(n2) );
  NAND2X2M U3 ( .A(\u_div/CryTmp[0][1] ), .B(\u_div/BInv [1]), .Y(n3) );
  NAND3X2M U4 ( .A(n3), .B(n2), .C(n1), .Y(\u_div/CryTmp[0][2] ) );
  MXI2X1M U5 ( .A(n93), .B(n54), .S0(n94), .Y(\u_div/PartRem[1][1] ) );
  INVX4M U6 ( .A(b[1]), .Y(\u_div/BInv [1]) );
  NAND2X2M U7 ( .A(\u_div/CryTmp[0][2] ), .B(\u_div/PartRem[1][2] ), .Y(n4) );
  NAND2X2M U8 ( .A(\u_div/CryTmp[0][2] ), .B(\u_div/BInv [2]), .Y(n5) );
  NAND2X6M U9 ( .A(\u_div/PartRem[1][2] ), .B(\u_div/BInv [2]), .Y(n6) );
  NAND3X4M U10 ( .A(n6), .B(n5), .C(n4), .Y(\u_div/CryTmp[0][3] ) );
  NAND2X4M U11 ( .A(n14), .B(n15), .Y(\u_div/PartRem[1][2] ) );
  CLKINVX4M U12 ( .A(b[2]), .Y(\u_div/BInv [2]) );
  NOR2X2M U13 ( .A(b[2]), .B(b[1]), .Y(n7) );
  NOR2X2M U14 ( .A(n8), .B(n28), .Y(n22) );
  INVX2M U15 ( .A(n7), .Y(n8) );
  CLKAND2X3M U16 ( .A(b[0]), .B(n56), .Y(n28) );
  XOR2XLM U17 ( .A(\u_div/BInv [2]), .B(n46), .Y(n9) );
  XOR2XLM U18 ( .A(n9), .B(\u_div/CryTmp[4][2] ), .Y(\u_div/SumTmp[4][2] ) );
  NAND2X2M U19 ( .A(\u_div/CryTmp[4][2] ), .B(n46), .Y(n10) );
  NAND2X2M U20 ( .A(\u_div/CryTmp[4][2] ), .B(\u_div/BInv [2]), .Y(n11) );
  NAND2XLM U21 ( .A(n46), .B(\u_div/BInv [2]), .Y(n12) );
  NAND3X2M U22 ( .A(n12), .B(n11), .C(n10), .Y(\u_div/CryTmp[4][3] ) );
  CLKNAND2X4M U23 ( .A(n17), .B(n18), .Y(n46) );
  NAND2XLM U24 ( .A(n59), .B(n13), .Y(n14) );
  NAND2X2M U25 ( .A(\u_div/SumTmp[1][1] ), .B(quotient[1]), .Y(n15) );
  CLKINVX2M U26 ( .A(quotient[1]), .Y(n13) );
  INVX2M U27 ( .A(n102), .Y(quotient[1]) );
  NAND2XLM U28 ( .A(\u_div/PartRem[6][1] ), .B(n16), .Y(n17) );
  NAND2XLM U29 ( .A(\u_div/SumTmp[5][1] ), .B(quotient[5]), .Y(n18) );
  INVXLM U30 ( .A(quotient[5]), .Y(n16) );
  MXI2X6M U31 ( .A(n74), .B(n75), .S0(quotient[6]), .Y(\u_div/PartRem[6][1] )
         );
  AND2X1M U32 ( .A(\u_div/CryTmp[5][3] ), .B(n96), .Y(quotient[5]) );
  NAND2X2M U33 ( .A(n46), .B(n19), .Y(n20) );
  NAND2XLM U34 ( .A(\u_div/SumTmp[4][2] ), .B(quotient[4]), .Y(n21) );
  NAND2X2M U35 ( .A(n20), .B(n21), .Y(n43) );
  INVXLM U36 ( .A(quotient[4]), .Y(n19) );
  INVX8M U37 ( .A(n91), .Y(n100) );
  INVX5M U38 ( .A(n80), .Y(n96) );
  NAND2BX12M U39 ( .AN(b[6]), .B(\u_div/BInv [7]), .Y(n91) );
  INVX4M U40 ( .A(b[0]), .Y(\u_div/BInv [0]) );
  INVX12M U41 ( .A(b[3]), .Y(\u_div/BInv [3]) );
  NAND2X8M U42 ( .A(n99), .B(n100), .Y(n86) );
  INVXLM U43 ( .A(\u_div/CryTmp[4][4] ), .Y(n87) );
  INVX12M U44 ( .A(b[7]), .Y(\u_div/BInv [7]) );
  NOR2X1M U45 ( .A(n86), .B(n87), .Y(n85) );
  INVX2M U46 ( .A(\u_div/CryTmp[5][3] ), .Y(n81) );
  NAND2BX1M U47 ( .AN(n92), .B(n100), .Y(n101) );
  NAND2X6M U48 ( .A(n98), .B(\u_div/BInv [3]), .Y(n80) );
  MX2X4M U49 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(n45) );
  CLKAND2X3M U50 ( .A(\u_div/CryTmp[4][4] ), .B(n98), .Y(quotient[4]) );
  INVX4M U51 ( .A(n86), .Y(n98) );
  MXI2XLM U52 ( .A(n71), .B(n88), .S0(quotient[1]), .Y(\u_div/PartRem[1][3] )
         );
  MXI2XLM U53 ( .A(n70), .B(n82), .S0(quotient[1]), .Y(\u_div/PartRem[1][4] )
         );
  XOR2X2M U54 ( .A(\u_div/BInv [0]), .B(a[7]), .Y(n52) );
  MXI2XLM U55 ( .A(n69), .B(n76), .S0(quotient[1]), .Y(\u_div/PartRem[1][5] )
         );
  NAND3X4M U56 ( .A(n27), .B(n26), .C(n25), .Y(\u_div/CryTmp[6][2] ) );
  MXI2XLM U57 ( .A(n68), .B(n73), .S0(quotient[1]), .Y(\u_div/PartRem[1][6] )
         );
  CLKINVX8M U58 ( .A(n95), .Y(quotient[7]) );
  INVX5M U59 ( .A(n97), .Y(quotient[6]) );
  MXI2XLM U60 ( .A(\u_div/SumTmp[2][1] ), .B(n62), .S0(n101), .Y(n71) );
  MXI2X6M U61 ( .A(n64), .B(n63), .S0(n65), .Y(n62) );
  MXI2X4M U62 ( .A(n60), .B(n61), .S0(n90), .Y(n59) );
  NOR2X1M U63 ( .A(n92), .B(n91), .Y(n90) );
  INVX2M U64 ( .A(\u_div/CryTmp[3][5] ), .Y(n57) );
  NAND2X2M U65 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/BInv [1]), .Y(n33) );
  NAND2X1M U66 ( .A(\u_div/CryTmp[6][1] ), .B(\u_div/BInv [1]), .Y(n25) );
  NAND3X2M U67 ( .A(n35), .B(n34), .C(n33), .Y(\u_div/CryTmp[3][2] ) );
  NAND2X2M U68 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/CryTmp[3][1] ), .Y(n34)
         );
  CLKINVX4M U69 ( .A(\u_div/CryTmp[2][6] ), .Y(n92) );
  NOR2X2M U70 ( .A(b[5]), .B(b[4]), .Y(n99) );
  NAND2X4M U71 ( .A(n22), .B(n96), .Y(n95) );
  MXI2X4M U72 ( .A(n77), .B(n78), .S0(n79), .Y(\u_div/PartRem[5][1] ) );
  AND2X2M U73 ( .A(n96), .B(\u_div/BInv [2]), .Y(n23) );
  MXI2X4M U74 ( .A(n83), .B(n84), .S0(n85), .Y(\u_div/PartRem[4][1] ) );
  NAND2XLM U75 ( .A(n100), .B(\u_div/BInv [5]), .Y(n89) );
  NOR2X3M U76 ( .A(n81), .B(n80), .Y(n79) );
  NAND2X4M U77 ( .A(n30), .B(n31), .Y(n39) );
  NAND2X1M U78 ( .A(\u_div/SumTmp[6][1] ), .B(quotient[6]), .Y(n31) );
  CLKNAND2X2M U79 ( .A(\u_div/PartRem[4][1] ), .B(n36), .Y(n37) );
  MXI2XLM U80 ( .A(n67), .B(n72), .S0(quotient[1]), .Y(\u_div/PartRem[1][7] )
         );
  OR2X6M U81 ( .A(n57), .B(n89), .Y(n65) );
  XOR3XLM U82 ( .A(\u_div/CryTmp[6][1] ), .B(\u_div/BInv [1]), .C(n50), .Y(
        \u_div/SumTmp[6][1] ) );
  NAND2X3M U83 ( .A(\u_div/CryTmp[6][1] ), .B(n50), .Y(n26) );
  NAND2X2M U84 ( .A(\u_div/BInv [1]), .B(n50), .Y(n27) );
  MXI2X6M U85 ( .A(n51), .B(n52), .S0(quotient[7]), .Y(n50) );
  CLKNAND2X2M U86 ( .A(n66), .B(n29), .Y(n30) );
  MX2XLM U87 ( .A(n39), .B(\u_div/SumTmp[5][2] ), .S0(quotient[5]), .Y(n53) );
  XOR2XLM U88 ( .A(n32), .B(\u_div/PartRem[4][1] ), .Y(\u_div/SumTmp[3][1] )
         );
  INVXLM U89 ( .A(quotient[6]), .Y(n29) );
  XOR2XLM U90 ( .A(\u_div/CryTmp[3][1] ), .B(\u_div/BInv [1]), .Y(n32) );
  NAND2XLM U91 ( .A(\u_div/BInv [1]), .B(\u_div/CryTmp[3][1] ), .Y(n35) );
  INVXLM U92 ( .A(a[7]), .Y(n51) );
  MXI2XLM U93 ( .A(n42), .B(\u_div/SumTmp[2][2] ), .S0(quotient[2]), .Y(n70)
         );
  NOR2BX2M U94 ( .AN(\u_div/CryTmp[3][5] ), .B(n89), .Y(quotient[3]) );
  NAND2XLM U95 ( .A(\u_div/SumTmp[3][1] ), .B(quotient[3]), .Y(n38) );
  NAND2X2M U96 ( .A(n37), .B(n38), .Y(n42) );
  INVXLM U97 ( .A(quotient[3]), .Y(n36) );
  MX2XLM U98 ( .A(n43), .B(\u_div/SumTmp[3][3] ), .S0(quotient[3]), .Y(n48) );
  MX2XLM U99 ( .A(n45), .B(\u_div/SumTmp[3][2] ), .S0(quotient[3]), .Y(n41) );
  MX2XLM U100 ( .A(n53), .B(\u_div/SumTmp[4][3] ), .S0(quotient[4]), .Y(n40)
         );
  INVX2M U101 ( .A(\u_div/SumTmp[1][6] ), .Y(n72) );
  NOR2BX4M U102 ( .AN(\u_div/CryTmp[1][7] ), .B(b[7]), .Y(n94) );
  CLKINVX4M U103 ( .A(\u_div/SumTmp[6][0] ), .Y(n75) );
  INVXLM U104 ( .A(a[6]), .Y(n74) );
  INVXLM U105 ( .A(n69), .Y(\u_div/PartRem[2][4] ) );
  INVX2M U106 ( .A(n70), .Y(\u_div/PartRem[2][3] ) );
  CLKINVX1M U107 ( .A(\u_div/SumTmp[1][2] ), .Y(n88) );
  NAND2X4M U108 ( .A(\u_div/CryTmp[6][2] ), .B(n23), .Y(n97) );
  INVX2M U109 ( .A(n101), .Y(quotient[2]) );
  MXI2XLM U110 ( .A(n41), .B(\u_div/SumTmp[2][3] ), .S0(quotient[2]), .Y(n69)
         );
  MXI2XLM U111 ( .A(n48), .B(\u_div/SumTmp[2][4] ), .S0(quotient[2]), .Y(n68)
         );
  MXI2XLM U112 ( .A(n47), .B(\u_div/SumTmp[2][5] ), .S0(quotient[2]), .Y(n67)
         );
  INVX2M U113 ( .A(\u_div/SumTmp[1][3] ), .Y(n82) );
  INVX2M U114 ( .A(\u_div/SumTmp[1][5] ), .Y(n73) );
  MX2XLM U115 ( .A(n40), .B(\u_div/SumTmp[3][4] ), .S0(quotient[3]), .Y(n47)
         );
  INVX2M U116 ( .A(n67), .Y(\u_div/PartRem[2][6] ) );
  INVX2M U117 ( .A(a[7]), .Y(n56) );
  INVX2M U118 ( .A(a[5]), .Y(n77) );
  INVX2M U119 ( .A(\u_div/SumTmp[5][0] ), .Y(n78) );
  INVX2M U120 ( .A(a[4]), .Y(n83) );
  INVX2M U121 ( .A(\u_div/SumTmp[4][0] ), .Y(n84) );
  INVX2M U122 ( .A(a[2]), .Y(n60) );
  INVX2M U123 ( .A(\u_div/SumTmp[2][0] ), .Y(n61) );
  INVX2M U124 ( .A(a[3]), .Y(n63) );
  INVX2M U125 ( .A(\u_div/SumTmp[3][0] ), .Y(n64) );
  INVX2M U126 ( .A(\u_div/SumTmp[1][4] ), .Y(n76) );
  INVX2M U127 ( .A(n68), .Y(\u_div/PartRem[2][5] ) );
  OR2X1M U128 ( .A(\u_div/BInv [0]), .B(a[1]), .Y(\u_div/CryTmp[1][1] ) );
  NAND2X2M U129 ( .A(b[0]), .B(n55), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U130 ( .A(a[0]), .Y(n55) );
  XOR2XLM U131 ( .A(\u_div/BInv [0]), .B(a[1]), .Y(n54) );
  INVX2M U132 ( .A(a[1]), .Y(n93) );
  INVX2M U133 ( .A(b[5]), .Y(\u_div/BInv [5]) );
  INVX2M U134 ( .A(b[4]), .Y(\u_div/BInv [4]) );
  INVX2M U135 ( .A(n71), .Y(\u_div/PartRem[2][2] ) );
  INVXLM U136 ( .A(b[6]), .Y(\u_div/BInv [6]) );
  DLY1X1M U137 ( .A(n50), .Y(n66) );
  NAND2BX2M U138 ( .AN(b[7]), .B(\u_div/CryTmp[1][7] ), .Y(n102) );
endmodule


module ALU_input_width8_output_width16 ( A, B, ALU_FUN, Enable, CLK, RST, 
        ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input Enable, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N127,
         N128, N129, N130, N131, N132, N133, N134, N169, n35, n36, n37, n38,
         n42, n46, n47, n50, n54, n55, n56, n58, n62, n63, n64, n65, n69, n70,
         n71, n72, n76, n77, n78, n79, n83, n84, n85, n86, n102, n111, n113,
         n117, n118, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n39, n40, n41, n43, n44, n45, n48, n49, n51,
         n52, n53, n57, n59, n60, n61, n66, n67, n68, n73, n74, n75, n80, n81,
         n82, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n103, n104, n105, n106, n107, n108, n109, n110, n112,
         n114, n115, n116, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186;
  wire   [15:0] ALU_OUT_TEMP;

  ALU_input_width8_output_width16_DW01_sub_0 sub_28 ( .A({1'b0, n21, n32, n31, 
        n30, n29, n28, A[1:0]}), .B({1'b0, n27, n9, B[5:2], n11, n5}), .CI(
        1'b0), .DIFF({N108, N107, N106, N105, N104, N103, N102, N101, N100})
         );
  ALU_input_width8_output_width16_DW01_add_0 add_25 ( .A({1'b0, n21, n32, n31, 
        n30, n29, n28, A[1:0]}), .B({1'b0, n27, n10, B[5:2], n12, n6}), .CI(
        1'b0), .SUM({N99, N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_input_width8_output_width16_DW02_mult_0 mult_31 ( .A({n21, n32, n31, n30, 
        n29, n28, A[1:0]}), .B({n27, n9, B[5:2], n11, n5}), .TC(1'b0), 
        .PRODUCT({N124, N123, N122, N121, N120, N119, N118, N117, N116, N115, 
        N114, N113, N112, N111, N110, N109}) );
  ALU_input_width8_output_width16_DW_div_uns_1 div_35 ( .a({n20, n32, n31, n30, 
        n29, n28, A[1:0]}), .b({n27, n26, B[5:2], n25, n4}), .quotient({N134, 
        N133, N132, N131, N130, N129, N128, N127}) );
  DFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_TEMP[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_TEMP[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_TEMP[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_TEMP[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_TEMP[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_TEMP[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_TEMP[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_TEMP[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_TEMP[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_TEMP[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_TEMP[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_TEMP[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_TEMP[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_TEMP[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_TEMP[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M OUT_VALID_reg ( .D(Enable), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_TEMP[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  BUFX16M U3 ( .A(B[7]), .Y(n27) );
  CLKINVX6M U4 ( .A(n24), .Y(n3) );
  INVX4M U5 ( .A(n3), .Y(n4) );
  INVXLM U8 ( .A(n3), .Y(n5) );
  INVXLM U9 ( .A(n3), .Y(n6) );
  INVX2M U10 ( .A(n19), .Y(n20) );
  BUFX2M U11 ( .A(B[1]), .Y(n12) );
  BUFX2M U12 ( .A(B[1]), .Y(n11) );
  BUFX2M U13 ( .A(B[6]), .Y(n9) );
  BUFX2M U14 ( .A(B[1]), .Y(n25) );
  BUFX2M U15 ( .A(B[0]), .Y(n24) );
  NOR2X4M U16 ( .A(N127), .B(n7), .Y(n96) );
  INVX2M U17 ( .A(A[7]), .Y(n19) );
  OR2X2M U18 ( .A(n60), .B(n61), .Y(n7) );
  NOR2X2M U19 ( .A(n15), .B(n49), .Y(n8) );
  BUFX2M U20 ( .A(B[6]), .Y(n10) );
  BUFX6M U21 ( .A(A[6]), .Y(n32) );
  BUFX2M U22 ( .A(A[5]), .Y(n31) );
  BUFX4M U23 ( .A(B[6]), .Y(n26) );
  BUFX2M U24 ( .A(A[4]), .Y(n30) );
  AOI211XLM U25 ( .A0(n140), .A1(n32), .B0(n51), .C0(n46), .Y(n52) );
  AOI222XLM U26 ( .A0(N115), .A1(n13), .B0(n143), .B1(n133), .C0(n185), .C1(
        n32), .Y(n55) );
  INVXLM U27 ( .A(n32), .Y(n133) );
  OAI21BX1M U28 ( .A0(n170), .A1(n67), .B0N(n168), .Y(n97) );
  OAI221XLM U29 ( .A0(n32), .A1(n142), .B0(n133), .B1(n50), .C0(n186), .Y(n135) );
  AOI31XLM U30 ( .A0(n120), .A1(n119), .A2(n116), .B0(n176), .Y(
        ALU_OUT_TEMP[1]) );
  OAI221XLM U31 ( .A0(n30), .A1(n142), .B0(n182), .B1(n50), .C0(n186), .Y(n127) );
  AOI21XLM U32 ( .A0(n146), .A1(n144), .B0(n11), .Y(n147) );
  INVX2M U33 ( .A(n101), .Y(n134) );
  INVX2M U34 ( .A(n186), .Y(n143) );
  INVX2M U35 ( .A(n102), .Y(n141) );
  INVX2M U36 ( .A(n112), .Y(n139) );
  OAI2BB2X1M U37 ( .B0(n19), .B1(n22), .A0N(N116), .A1N(n13), .Y(n46) );
  INVX2M U38 ( .A(n99), .Y(n142) );
  OR2X2M U39 ( .A(n66), .B(n34), .Y(n186) );
  AO21XLM U40 ( .A0(n40), .A1(n66), .B0(n39), .Y(n101) );
  INVX2M U41 ( .A(n111), .Y(n39) );
  INVX2M U42 ( .A(n34), .Y(n40) );
  OR2X2M U43 ( .A(n15), .B(n45), .Y(n34) );
  INVX2M U44 ( .A(n50), .Y(n103) );
  INVX2M U45 ( .A(n59), .Y(n98) );
  NAND3BX2M U46 ( .AN(n145), .B(n113), .C(n44), .Y(n102) );
  NAND3BX2M U47 ( .AN(n145), .B(n14), .C(n66), .Y(n112) );
  INVX2M U48 ( .A(n22), .Y(n185) );
  INVX2M U49 ( .A(n113), .Y(n49) );
  NOR2X2M U50 ( .A(n59), .B(n15), .Y(n13) );
  NOR2X2M U51 ( .A(n45), .B(n44), .Y(n14) );
  OAI2BB1X2M U52 ( .A0N(N124), .A1N(n35), .B0(n36), .Y(ALU_OUT_TEMP[15]) );
  OAI2BB1X2M U53 ( .A0N(N123), .A1N(n35), .B0(n36), .Y(ALU_OUT_TEMP[14]) );
  OAI2BB1X2M U54 ( .A0N(N122), .A1N(n35), .B0(n36), .Y(ALU_OUT_TEMP[13]) );
  AOI21X2M U55 ( .A0(n37), .A1(n38), .B0(n176), .Y(ALU_OUT_TEMP[8]) );
  AOI21X2M U56 ( .A0(N99), .A1(n8), .B0(n42), .Y(n37) );
  OAI2BB1X2M U57 ( .A0N(N120), .A1N(n35), .B0(n36), .Y(ALU_OUT_TEMP[11]) );
  OAI2BB1X2M U58 ( .A0N(N121), .A1N(n35), .B0(n36), .Y(ALU_OUT_TEMP[12]) );
  OAI2BB1X2M U59 ( .A0N(N118), .A1N(n35), .B0(n36), .Y(ALU_OUT_TEMP[9]) );
  OAI2BB1X2M U60 ( .A0N(N119), .A1N(n35), .B0(n36), .Y(ALU_OUT_TEMP[10]) );
  OAI31X1M U61 ( .A0(n68), .A1(N169), .A2(n97), .B0(n109), .Y(n88) );
  NAND3BX2M U62 ( .AN(ALU_FUN[0]), .B(n23), .C(n98), .Y(n68) );
  OAI2B11X2M U63 ( .A1N(N108), .A0(n102), .B0(n186), .C0(n142), .Y(n42) );
  NOR2X2M U64 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n113) );
  NAND3X2M U65 ( .A(n113), .B(n145), .C(n23), .Y(n50) );
  NAND4BX1M U66 ( .AN(ALU_FUN[1]), .B(n14), .C(N169), .D(n145), .Y(n109) );
  INVX2M U67 ( .A(ALU_FUN[0]), .Y(n145) );
  NAND3X2M U68 ( .A(n113), .B(ALU_FUN[0]), .C(n23), .Y(n111) );
  INVX2M U69 ( .A(ALU_FUN[1]), .Y(n66) );
  OR2X2M U70 ( .A(ALU_FUN[2]), .B(n66), .Y(n59) );
  AND4X2M U71 ( .A(n23), .B(ALU_FUN[0]), .C(n98), .D(n97), .Y(n108) );
  INVX2M U72 ( .A(ALU_FUN[2]), .Y(n45) );
  AO22X1M U73 ( .A0(N98), .A1(n8), .B0(n19), .B1(n143), .Y(n51) );
  BUFX2M U74 ( .A(n47), .Y(n22) );
  NAND4BX1M U75 ( .AN(n23), .B(n66), .C(ALU_FUN[2]), .D(ALU_FUN[0]), .Y(n47)
         );
  OR2X2M U76 ( .A(n23), .B(ALU_FUN[0]), .Y(n15) );
  OAI31X1M U77 ( .A0(n33), .A1(n66), .A2(n45), .B0(n111), .Y(n99) );
  OR2X2M U78 ( .A(n23), .B(n145), .Y(n33) );
  OAI221X1M U79 ( .A0(n134), .A1(n19), .B0(n50), .B1(n21), .C0(n22), .Y(n41)
         );
  NOR2BX2M U80 ( .AN(n13), .B(n176), .Y(n35) );
  INVX2M U81 ( .A(n48), .Y(n140) );
  NAND3BX2M U82 ( .AN(ALU_FUN[0]), .B(ALU_FUN[1]), .C(n14), .Y(n48) );
  NAND2X2M U83 ( .A(n91), .B(n81), .Y(n60) );
  INVX2M U84 ( .A(n80), .Y(n75) );
  INVX2M U85 ( .A(n23), .Y(n44) );
  NOR3X2M U86 ( .A(n75), .B(n88), .C(n89), .Y(n95) );
  NOR2X2M U87 ( .A(n93), .B(n92), .Y(n94) );
  AOI31X2M U88 ( .A0(n76), .A1(n77), .A2(n78), .B0(n176), .Y(ALU_OUT_TEMP[3])
         );
  AOI22X1M U89 ( .A0(N103), .A1(n141), .B0(N94), .B1(n8), .Y(n76) );
  AOI222X1M U90 ( .A0(N112), .A1(n13), .B0(n143), .B1(n183), .C0(n29), .C1(
        n185), .Y(n77) );
  AOI221XLM U91 ( .A0(n28), .A1(n140), .B0(n30), .B1(n139), .C0(n79), .Y(n78)
         );
  AOI31X2M U92 ( .A0(n54), .A1(n55), .A2(n56), .B0(n176), .Y(ALU_OUT_TEMP[6])
         );
  AOI22X1M U93 ( .A0(N106), .A1(n141), .B0(N97), .B1(n8), .Y(n54) );
  AOI31X2M U94 ( .A0(n69), .A1(n70), .A2(n71), .B0(n176), .Y(ALU_OUT_TEMP[4])
         );
  AOI22X1M U95 ( .A0(N104), .A1(n141), .B0(N95), .B1(n8), .Y(n69) );
  AOI222X1M U96 ( .A0(N113), .A1(n13), .B0(n143), .B1(n182), .C0(n30), .C1(
        n185), .Y(n70) );
  AOI31X2M U97 ( .A0(n57), .A1(n53), .A2(n52), .B0(n176), .Y(ALU_OUT_TEMP[7])
         );
  OAI221X1M U98 ( .A0(n134), .A1(n183), .B0(n50), .B1(n29), .C0(n22), .Y(n125)
         );
  OAI221X1M U99 ( .A0(n134), .A1(n182), .B0(n50), .B1(n30), .C0(n22), .Y(n128)
         );
  OAI221X1M U100 ( .A0(n134), .A1(n181), .B0(n50), .B1(n31), .C0(n22), .Y(n131) );
  OAI221X1M U101 ( .A0(n134), .A1(n133), .B0(n50), .B1(n32), .C0(n22), .Y(n136) );
  OAI221X1M U102 ( .A0(n28), .A1(n142), .B0(n184), .B1(n50), .C0(n186), .Y(
        n121) );
  OAI221X1M U103 ( .A0(n31), .A1(n142), .B0(n181), .B1(n50), .C0(n186), .Y(
        n130) );
  NAND4X2M U104 ( .A(n87), .B(n82), .C(n81), .D(n80), .Y(n93) );
  INVX2M U105 ( .A(n169), .Y(n67) );
  NAND2X2M U106 ( .A(n87), .B(n90), .Y(n61) );
  NAND2X2M U107 ( .A(Enable), .B(n42), .Y(n36) );
  AOI31X2M U108 ( .A0(n62), .A1(n63), .A2(n64), .B0(n176), .Y(ALU_OUT_TEMP[5])
         );
  AOI22X1M U109 ( .A0(N105), .A1(n141), .B0(N96), .B1(n8), .Y(n62) );
  AOI221XLM U110 ( .A0(n30), .A1(n140), .B0(n139), .B1(n32), .C0(n65), .Y(n64)
         );
  AOI222X1M U111 ( .A0(N114), .A1(n13), .B0(n143), .B1(n181), .C0(n31), .C1(
        n185), .Y(n63) );
  INVX2M U112 ( .A(n157), .Y(n174) );
  NAND4BBX1M U113 ( .AN(n88), .BN(n89), .C(n91), .D(n90), .Y(n92) );
  MX2X2M U114 ( .A(n136), .B(n135), .S0(n178), .Y(n137) );
  MX2X2M U115 ( .A(n103), .B(n101), .S0(n12), .Y(n104) );
  BUFX2M U116 ( .A(ALU_FUN[3]), .Y(n23) );
  NAND2X2M U117 ( .A(N109), .B(n13), .Y(n81) );
  INVX2M U118 ( .A(Enable), .Y(n176) );
  OR2X2M U119 ( .A(n144), .B(n112), .Y(n80) );
  NAND2X2M U120 ( .A(N91), .B(n8), .Y(n91) );
  INVX2M U121 ( .A(n82), .Y(n138) );
  AO22X1M U122 ( .A0(N92), .A1(n8), .B0(n139), .B1(n28), .Y(n114) );
  AO21XLM U123 ( .A0(N110), .A1(n13), .B0(n110), .Y(n115) );
  MX2X2M U124 ( .A(n143), .B(n185), .S0(n11), .Y(n110) );
  INVX2M U125 ( .A(n29), .Y(n183) );
  INVX2M U126 ( .A(n30), .Y(n182) );
  INVX2M U127 ( .A(n28), .Y(n184) );
  INVX2M U128 ( .A(n31), .Y(n181) );
  AOI211X2M U129 ( .A0(A[0]), .A1(n140), .B0(n115), .C0(n114), .Y(n116) );
  NOR3BX2M U130 ( .AN(n109), .B(n108), .C(n107), .Y(n120) );
  AOI22XLM U131 ( .A0(N128), .A1(n138), .B0(N101), .B1(n141), .Y(n119) );
  AOI31X2M U132 ( .A0(n83), .A1(n84), .A2(n85), .B0(n176), .Y(ALU_OUT_TEMP[2])
         );
  AOI22X1M U133 ( .A0(N102), .A1(n141), .B0(N93), .B1(n8), .Y(n83) );
  AOI222X1M U134 ( .A0(N111), .A1(n13), .B0(n143), .B1(n184), .C0(n28), .C1(
        n185), .Y(n84) );
  AOI221XLM U135 ( .A0(A[1]), .A1(n140), .B0(n29), .B1(n139), .C0(n86), .Y(n85) );
  BUFX2M U136 ( .A(A[3]), .Y(n29) );
  AO21XLM U137 ( .A0(N129), .A1(n138), .B0(n123), .Y(n86) );
  MX2X2M U138 ( .A(n122), .B(n121), .S0(n173), .Y(n123) );
  OAI221X1M U139 ( .A0(n134), .A1(n184), .B0(n50), .B1(n28), .C0(n22), .Y(n122) );
  BUFX2M U140 ( .A(A[2]), .Y(n28) );
  MX2X2M U141 ( .A(n125), .B(n124), .S0(n175), .Y(n126) );
  OAI221X1M U142 ( .A0(n29), .A1(n142), .B0(n183), .B1(n50), .C0(n186), .Y(
        n124) );
  MX2X2M U143 ( .A(n128), .B(n127), .S0(n180), .Y(n129) );
  INVXLM U144 ( .A(B[4]), .Y(n180) );
  INVX2M U145 ( .A(n146), .Y(n172) );
  MXI2X1M U146 ( .A(n16), .B(n17), .S0(A[0]), .Y(n89) );
  NOR2X2M U147 ( .A(n143), .B(n73), .Y(n16) );
  NOR2X2M U148 ( .A(n185), .B(n74), .Y(n17) );
  INVX2M U149 ( .A(A[1]), .Y(n144) );
  MX2X2M U150 ( .A(n106), .B(n105), .S0(A[1]), .Y(n107) );
  OR2X2M U151 ( .A(n143), .B(n100), .Y(n106) );
  OR2X2M U152 ( .A(n185), .B(n104), .Y(n105) );
  MX2XLM U153 ( .A(n99), .B(n103), .S0(n11), .Y(n100) );
  INVXLM U154 ( .A(B[2]), .Y(n173) );
  AO21XLM U155 ( .A0(N132), .A1(n138), .B0(n132), .Y(n65) );
  MX2X2M U156 ( .A(n131), .B(n130), .S0(n179), .Y(n132) );
  INVXLM U157 ( .A(B[5]), .Y(n179) );
  NAND2X2M U158 ( .A(N100), .B(n141), .Y(n90) );
  NAND3X2M U159 ( .A(n18), .B(ALU_FUN[0]), .C(n98), .Y(n82) );
  AOI21X2M U160 ( .A0(n117), .A1(n118), .B0(n23), .Y(n18) );
  INVXLM U161 ( .A(B[3]), .Y(n175) );
  NAND2BXLM U162 ( .AN(n31), .B(B[5]), .Y(n166) );
  INVXLM U163 ( .A(n27), .Y(n177) );
  AOI22XLM U164 ( .A0(n177), .A1(n43), .B0(n27), .B1(n41), .Y(n57) );
  NAND2XLM U165 ( .A(n27), .B(n19), .Y(n169) );
  NOR2XLM U166 ( .A(n19), .B(n27), .Y(n168) );
  AOI22XLM U167 ( .A0(N134), .A1(n138), .B0(N107), .B1(n141), .Y(n53) );
  MX2XLM U168 ( .A(n186), .B(n22), .S0(n5), .Y(n87) );
  MX2XLM U169 ( .A(n103), .B(n101), .S0(n5), .Y(n74) );
  MX2XLM U170 ( .A(n99), .B(n103), .S0(n6), .Y(n73) );
  NOR4XLM U171 ( .A(B[3]), .B(B[2]), .C(n12), .D(n6), .Y(n117) );
  INVXLM U172 ( .A(n19), .Y(n21) );
  INVXLM U173 ( .A(n10), .Y(n178) );
  NOR4XLM U174 ( .A(n27), .B(n9), .C(B[5]), .D(B[4]), .Y(n118) );
  AOI32XLM U175 ( .A0(n152), .A1(n162), .A2(n165), .B0(n9), .B1(n133), .Y(n153) );
  XNOR2XLM U176 ( .A(n32), .B(n9), .Y(n165) );
  INVXLM U177 ( .A(n6), .Y(n171) );
  AO21XLM U178 ( .A0(N131), .A1(n138), .B0(n129), .Y(n72) );
  AOI221XLM U179 ( .A0(n29), .A1(n140), .B0(n139), .B1(n31), .C0(n72), .Y(n71)
         );
  AO21XLM U180 ( .A0(N130), .A1(n138), .B0(n126), .Y(n79) );
  AO21XLM U181 ( .A0(N133), .A1(n138), .B0(n137), .Y(n58) );
  AOI211X2M U182 ( .A0(n96), .A1(n95), .B0(n94), .C0(n176), .Y(ALU_OUT_TEMP[0]) );
  AOI22XLM U183 ( .A0(n21), .A1(n140), .B0(N117), .B1(n13), .Y(n38) );
  OAI221XLM U184 ( .A0(n21), .A1(n142), .B0(n19), .B1(n50), .C0(n186), .Y(n43)
         );
  AOI221XLM U185 ( .A0(n31), .A1(n140), .B0(n139), .B1(n21), .C0(n58), .Y(n56)
         );
  NAND2BX1M U186 ( .AN(B[4]), .B(n30), .Y(n161) );
  NAND2BX1M U187 ( .AN(n30), .B(B[4]), .Y(n150) );
  CLKNAND2X2M U188 ( .A(n161), .B(n150), .Y(n163) );
  NOR2X1M U189 ( .A(n175), .B(n29), .Y(n158) );
  NOR2X1M U190 ( .A(n173), .B(n28), .Y(n149) );
  NOR2X1M U191 ( .A(n171), .B(A[0]), .Y(n146) );
  CLKNAND2X2M U192 ( .A(n28), .B(n173), .Y(n160) );
  NAND2BX1M U193 ( .AN(n149), .B(n160), .Y(n155) );
  AOI211X1M U194 ( .A0(A[1]), .A1(n172), .B0(n155), .C0(n147), .Y(n148) );
  CLKNAND2X2M U195 ( .A(n29), .B(n175), .Y(n159) );
  OAI31X1M U196 ( .A0(n158), .A1(n149), .A2(n148), .B0(n159), .Y(n151) );
  OAI211X1M U197 ( .A0(n163), .A1(n151), .B0(n150), .C0(n166), .Y(n152) );
  NAND2BX1M U198 ( .AN(B[5]), .B(n31), .Y(n162) );
  OAI21X1M U199 ( .A0(n168), .A1(n153), .B0(n169), .Y(N169) );
  CLKNAND2X2M U200 ( .A(A[0]), .B(n171), .Y(n156) );
  OA21X1M U201 ( .A0(n156), .A1(n144), .B0(n12), .Y(n154) );
  AOI211X1M U202 ( .A0(n156), .A1(n144), .B0(n155), .C0(n154), .Y(n157) );
  AOI31X1M U203 ( .A0(n174), .A1(n160), .A2(n159), .B0(n158), .Y(n164) );
  OAI2B11X1M U204 ( .A1N(n164), .A0(n163), .B0(n162), .C0(n161), .Y(n167) );
  AOI32X1M U205 ( .A0(n167), .A1(n166), .A2(n165), .B0(n32), .B1(n178), .Y(
        n170) );
endmodule


module DF_SYNC_ADDR_WIDTH4_0 ( ptr, clk, rst, q2_ptr );
  input [3:0] ptr;
  output [3:0] q2_ptr;
  input clk, rst;

  wire   [3:0] FF_inside;

  DFFRQX2M \q2_ptr_reg[1]  ( .D(FF_inside[1]), .CK(clk), .RN(rst), .Q(
        q2_ptr[1]) );
  DFFRQX2M \q2_ptr_reg[0]  ( .D(FF_inside[0]), .CK(clk), .RN(rst), .Q(
        q2_ptr[0]) );
  DFFRQX2M \q2_ptr_reg[3]  ( .D(FF_inside[3]), .CK(clk), .RN(rst), .Q(
        q2_ptr[3]) );
  DFFRQX2M \q2_ptr_reg[2]  ( .D(FF_inside[2]), .CK(clk), .RN(rst), .Q(
        q2_ptr[2]) );
  DFFRQX2M \FF_inside_reg[3]  ( .D(ptr[3]), .CK(clk), .RN(rst), .Q(
        FF_inside[3]) );
  DFFRQX2M \FF_inside_reg[2]  ( .D(ptr[2]), .CK(clk), .RN(rst), .Q(
        FF_inside[2]) );
  DFFRQX2M \FF_inside_reg[1]  ( .D(ptr[1]), .CK(clk), .RN(rst), .Q(
        FF_inside[1]) );
  DFFRQX2M \FF_inside_reg[0]  ( .D(ptr[0]), .CK(clk), .RN(rst), .Q(
        FF_inside[0]) );
endmodule


module DF_SYNC_ADDR_WIDTH4_1 ( ptr, clk, rst, q2_ptr );
  input [3:0] ptr;
  output [3:0] q2_ptr;
  input clk, rst;

  wire   [3:0] FF_inside;

  DFFRQX2M \q2_ptr_reg[3]  ( .D(FF_inside[3]), .CK(clk), .RN(rst), .Q(
        q2_ptr[3]) );
  DFFRQX2M \q2_ptr_reg[2]  ( .D(FF_inside[2]), .CK(clk), .RN(rst), .Q(
        q2_ptr[2]) );
  DFFRQX2M \q2_ptr_reg[1]  ( .D(FF_inside[1]), .CK(clk), .RN(rst), .Q(
        q2_ptr[1]) );
  DFFRQX2M \q2_ptr_reg[0]  ( .D(FF_inside[0]), .CK(clk), .RN(rst), .Q(
        q2_ptr[0]) );
  DFFRQX2M \FF_inside_reg[3]  ( .D(ptr[3]), .CK(clk), .RN(rst), .Q(
        FF_inside[3]) );
  DFFRQX2M \FF_inside_reg[2]  ( .D(ptr[2]), .CK(clk), .RN(rst), .Q(
        FF_inside[2]) );
  DFFRQX2M \FF_inside_reg[1]  ( .D(ptr[1]), .CK(clk), .RN(rst), .Q(
        FF_inside[1]) );
  DFFRQX2M \FF_inside_reg[0]  ( .D(ptr[0]), .CK(clk), .RN(rst), .Q(
        FF_inside[0]) );
endmodule


module FIFO_WR_DATA_WIDTH8_ADDR_WIDTH4 ( winc, wq2_rptr, wclk, wrst_n, wfull, 
        wptr, wadrr );
  input [3:0] wq2_rptr;
  output [3:0] wptr;
  output [2:0] wadrr;
  input winc, wclk, wrst_n;
  output wfull;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [3:0] wptr_comb;

  DFFRQX2M \binary_wptr_reg[3]  ( .D(n10), .CK(wclk), .RN(wrst_n), .Q(
        wptr_comb[3]) );
  DFFRQX2M \binary_wptr_reg[2]  ( .D(n11), .CK(wclk), .RN(wrst_n), .Q(wadrr[2]) );
  DFFRQX2M \binary_wptr_reg[0]  ( .D(n13), .CK(wclk), .RN(wrst_n), .Q(wadrr[0]) );
  DFFRQX2M \wptr_reg[0]  ( .D(wptr_comb[0]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[0]) );
  DFFRQX2M \wptr_reg[1]  ( .D(wptr_comb[1]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[1]) );
  DFFRQX2M \wptr_reg[3]  ( .D(wptr_comb[3]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[3]) );
  DFFRQX2M \wptr_reg[2]  ( .D(wptr_comb[2]), .CK(wclk), .RN(wrst_n), .Q(
        wptr[2]) );
  DFFRQX2M \binary_wptr_reg[1]  ( .D(n12), .CK(wclk), .RN(wrst_n), .Q(wadrr[1]) );
  INVX2M U3 ( .A(n1), .Y(wfull) );
  NAND2X2M U4 ( .A(winc), .B(n1), .Y(n5) );
  NOR2BX2M U5 ( .AN(wadrr[0]), .B(n5), .Y(n4) );
  XNOR2X2M U6 ( .A(wadrr[2]), .B(n3), .Y(n11) );
  XNOR2X2M U7 ( .A(wadrr[0]), .B(n5), .Y(n13) );
  XNOR2X2M U8 ( .A(wptr_comb[3]), .B(n2), .Y(n10) );
  NAND2BX2M U9 ( .AN(n3), .B(wadrr[2]), .Y(n2) );
  NAND4X2M U10 ( .A(n6), .B(n7), .C(n8), .D(n9), .Y(n1) );
  XNOR2X2M U11 ( .A(wq2_rptr[0]), .B(wptr[0]), .Y(n6) );
  XNOR2X2M U12 ( .A(wq2_rptr[1]), .B(wptr[1]), .Y(n7) );
  CLKXOR2X2M U13 ( .A(wq2_rptr[2]), .B(wptr[2]), .Y(n8) );
  NAND2X2M U14 ( .A(n4), .B(wadrr[1]), .Y(n3) );
  CLKXOR2X2M U15 ( .A(wq2_rptr[3]), .B(wptr[3]), .Y(n9) );
  CLKXOR2X2M U16 ( .A(wadrr[1]), .B(n4), .Y(n12) );
  CLKXOR2X2M U17 ( .A(wadrr[1]), .B(wadrr[0]), .Y(wptr_comb[0]) );
  CLKXOR2X2M U18 ( .A(wadrr[2]), .B(wadrr[1]), .Y(wptr_comb[1]) );
  CLKXOR2X2M U19 ( .A(wptr_comb[3]), .B(wadrr[2]), .Y(wptr_comb[2]) );
endmodule


module FIFO_RD_ADDR_WIDTH4_DATA_WIDTH8 ( rinc, rclk, rrst_n, rq2_wptr, rempty, 
        rptr, raddr );
  input [3:0] rq2_wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rinc, rclk, rrst_n;
  output rempty;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [3:0] rptr_comb;

  DFFRQX2M \binary_rptr_reg[3]  ( .D(n10), .CK(rclk), .RN(rrst_n), .Q(
        rptr_comb[3]) );
  DFFRQX2M \rptr_reg[0]  ( .D(rptr_comb[0]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[0]) );
  DFFRQX2M \rptr_reg[1]  ( .D(rptr_comb[1]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[1]) );
  DFFRQX2M \rptr_reg[3]  ( .D(rptr_comb[3]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[3]) );
  DFFRQX2M \rptr_reg[2]  ( .D(rptr_comb[2]), .CK(rclk), .RN(rrst_n), .Q(
        rptr[2]) );
  DFFRQX2M \binary_rptr_reg[0]  ( .D(n13), .CK(rclk), .RN(rrst_n), .Q(raddr[0]) );
  DFFRQX2M \binary_rptr_reg[2]  ( .D(n11), .CK(rclk), .RN(rrst_n), .Q(raddr[2]) );
  DFFRQX2M \binary_rptr_reg[1]  ( .D(n12), .CK(rclk), .RN(rrst_n), .Q(raddr[1]) );
  INVX2M U3 ( .A(n1), .Y(rempty) );
  XNOR2X2M U4 ( .A(rq2_wptr[1]), .B(rptr[1]), .Y(n6) );
  NOR2BX2M U5 ( .AN(raddr[0]), .B(n5), .Y(n4) );
  XNOR2X2M U6 ( .A(raddr[2]), .B(n3), .Y(n11) );
  XNOR2X2M U7 ( .A(rptr_comb[3]), .B(n2), .Y(n10) );
  NAND2BX2M U8 ( .AN(n3), .B(raddr[2]), .Y(n2) );
  XNOR2X2M U9 ( .A(raddr[0]), .B(n5), .Y(n13) );
  NAND4X2M U10 ( .A(n6), .B(n7), .C(n8), .D(n9), .Y(n1) );
  XNOR2X2M U11 ( .A(rq2_wptr[3]), .B(rptr[3]), .Y(n8) );
  XNOR2X2M U12 ( .A(rq2_wptr[2]), .B(rptr[2]), .Y(n9) );
  XNOR2X2M U13 ( .A(rq2_wptr[0]), .B(rptr[0]), .Y(n7) );
  NAND2X2M U14 ( .A(n4), .B(raddr[1]), .Y(n3) );
  NAND2X2M U15 ( .A(rinc), .B(n1), .Y(n5) );
  CLKXOR2X2M U16 ( .A(raddr[1]), .B(n4), .Y(n12) );
  CLKXOR2X2M U17 ( .A(raddr[1]), .B(raddr[0]), .Y(rptr_comb[0]) );
  CLKXOR2X2M U18 ( .A(raddr[2]), .B(raddr[1]), .Y(rptr_comb[1]) );
  CLKXOR2X2M U19 ( .A(rptr_comb[3]), .B(raddr[2]), .Y(rptr_comb[2]) );
endmodule


module FIFO_MEM_CNTRL_ADDR_WIDTH4_DATA_WIDTH8 ( wdata, waddr, wfull, winc, 
        wclk, wrst_n, raddr, rdata );
  input [7:0] wdata;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] rdata;
  input wfull, winc, wclk, wrst_n;
  wire   N10, N11, N12, \FIFO_MEMORY[7][7] , \FIFO_MEMORY[7][6] ,
         \FIFO_MEMORY[7][5] , \FIFO_MEMORY[7][4] , \FIFO_MEMORY[7][3] ,
         \FIFO_MEMORY[7][2] , \FIFO_MEMORY[7][1] , \FIFO_MEMORY[7][0] ,
         \FIFO_MEMORY[6][7] , \FIFO_MEMORY[6][6] , \FIFO_MEMORY[6][5] ,
         \FIFO_MEMORY[6][4] , \FIFO_MEMORY[6][3] , \FIFO_MEMORY[6][2] ,
         \FIFO_MEMORY[6][1] , \FIFO_MEMORY[6][0] , \FIFO_MEMORY[5][7] ,
         \FIFO_MEMORY[5][6] , \FIFO_MEMORY[5][5] , \FIFO_MEMORY[5][4] ,
         \FIFO_MEMORY[5][3] , \FIFO_MEMORY[5][2] , \FIFO_MEMORY[5][1] ,
         \FIFO_MEMORY[5][0] , \FIFO_MEMORY[4][7] , \FIFO_MEMORY[4][6] ,
         \FIFO_MEMORY[4][5] , \FIFO_MEMORY[4][4] , \FIFO_MEMORY[4][3] ,
         \FIFO_MEMORY[4][2] , \FIFO_MEMORY[4][1] , \FIFO_MEMORY[4][0] ,
         \FIFO_MEMORY[3][7] , \FIFO_MEMORY[3][6] , \FIFO_MEMORY[3][5] ,
         \FIFO_MEMORY[3][4] , \FIFO_MEMORY[3][3] , \FIFO_MEMORY[3][2] ,
         \FIFO_MEMORY[3][1] , \FIFO_MEMORY[3][0] , \FIFO_MEMORY[2][7] ,
         \FIFO_MEMORY[2][6] , \FIFO_MEMORY[2][5] , \FIFO_MEMORY[2][4] ,
         \FIFO_MEMORY[2][3] , \FIFO_MEMORY[2][2] , \FIFO_MEMORY[2][1] ,
         \FIFO_MEMORY[2][0] , \FIFO_MEMORY[1][7] , \FIFO_MEMORY[1][6] ,
         \FIFO_MEMORY[1][5] , \FIFO_MEMORY[1][4] , \FIFO_MEMORY[1][3] ,
         \FIFO_MEMORY[1][2] , \FIFO_MEMORY[1][1] , \FIFO_MEMORY[1][0] ,
         \FIFO_MEMORY[0][7] , \FIFO_MEMORY[0][6] , \FIFO_MEMORY[0][5] ,
         \FIFO_MEMORY[0][4] , \FIFO_MEMORY[0][3] , \FIFO_MEMORY[0][2] ,
         \FIFO_MEMORY[0][1] , \FIFO_MEMORY[0][0] , n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];

  DFFRQX2M \FIFO_MEMORY_reg[5][7]  ( .D(n69), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[5][6]  ( .D(n68), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[5][5]  ( .D(n67), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[5][4]  ( .D(n66), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[5][3]  ( .D(n65), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[5][2]  ( .D(n64), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[5][1]  ( .D(n63), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[5][0]  ( .D(n62), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[5][0] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][7]  ( .D(n37), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[1][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][6]  ( .D(n36), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[1][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][5]  ( .D(n35), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[1][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][4]  ( .D(n34), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[1][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][3]  ( .D(n33), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[1][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][2]  ( .D(n32), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[1][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][1]  ( .D(n31), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[1][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[1][0]  ( .D(n30), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[1][0] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][7]  ( .D(n85), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][6]  ( .D(n84), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][5]  ( .D(n83), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][4]  ( .D(n82), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][3]  ( .D(n81), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][2]  ( .D(n80), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][1]  ( .D(n79), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[7][0]  ( .D(n78), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[7][0] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][7]  ( .D(n53), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[3][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][6]  ( .D(n52), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[3][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][5]  ( .D(n51), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[3][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][4]  ( .D(n50), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[3][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][3]  ( .D(n49), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[3][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][2]  ( .D(n48), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[3][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][1]  ( .D(n47), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[3][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[3][0]  ( .D(n46), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[3][0] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][7]  ( .D(n77), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[6][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][6]  ( .D(n76), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[6][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][5]  ( .D(n75), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[6][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][4]  ( .D(n74), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[6][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][3]  ( .D(n73), .CK(wclk), .RN(n100), .Q(
        \FIFO_MEMORY[6][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][2]  ( .D(n72), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[6][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][1]  ( .D(n71), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[6][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[6][0]  ( .D(n70), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[6][0] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][7]  ( .D(n45), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][6]  ( .D(n44), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][5]  ( .D(n43), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][4]  ( .D(n42), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][3]  ( .D(n41), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][2]  ( .D(n40), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][1]  ( .D(n39), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[2][0]  ( .D(n38), .CK(wclk), .RN(n103), .Q(
        \FIFO_MEMORY[2][0] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][7]  ( .D(n61), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[4][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][6]  ( .D(n60), .CK(wclk), .RN(n101), .Q(
        \FIFO_MEMORY[4][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][5]  ( .D(n59), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[4][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][4]  ( .D(n58), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[4][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][3]  ( .D(n57), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[4][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][2]  ( .D(n56), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[4][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][1]  ( .D(n55), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[4][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[4][0]  ( .D(n54), .CK(wclk), .RN(n102), .Q(
        \FIFO_MEMORY[4][0] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][7]  ( .D(n29), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][7] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][6]  ( .D(n28), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][6] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][5]  ( .D(n27), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][5] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][4]  ( .D(n26), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][4] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][3]  ( .D(n25), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][3] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][2]  ( .D(n24), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][2] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][1]  ( .D(n23), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][1] ) );
  DFFRQX2M \FIFO_MEMORY_reg[0][0]  ( .D(n22), .CK(wclk), .RN(n104), .Q(
        \FIFO_MEMORY[0][0] ) );
  BUFX2M U2 ( .A(n19), .Y(n96) );
  BUFX2M U3 ( .A(n20), .Y(n95) );
  BUFX2M U4 ( .A(n21), .Y(n94) );
  BUFX2M U5 ( .A(n14), .Y(n97) );
  BUFX2M U6 ( .A(n98), .Y(n102) );
  BUFX2M U7 ( .A(n98), .Y(n101) );
  BUFX2M U8 ( .A(n98), .Y(n100) );
  BUFX2M U9 ( .A(n99), .Y(n103) );
  BUFX2M U10 ( .A(n99), .Y(n104) );
  NOR2BX2M U11 ( .AN(winc), .B(wfull), .Y(n16) );
  BUFX2M U12 ( .A(wrst_n), .Y(n98) );
  BUFX2M U13 ( .A(wrst_n), .Y(n99) );
  NAND3X2M U14 ( .A(n113), .B(n114), .C(n18), .Y(n17) );
  NAND3X2M U15 ( .A(n113), .B(n114), .C(n12), .Y(n11) );
  INVX2M U16 ( .A(wdata[1]), .Y(n106) );
  INVX2M U17 ( .A(wdata[2]), .Y(n107) );
  INVX2M U18 ( .A(wdata[3]), .Y(n108) );
  INVX2M U19 ( .A(wdata[4]), .Y(n109) );
  INVX2M U20 ( .A(wdata[5]), .Y(n110) );
  INVX2M U21 ( .A(wdata[6]), .Y(n111) );
  INVX2M U22 ( .A(wdata[7]), .Y(n112) );
  NAND3X2M U23 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n15) );
  NAND3X2M U24 ( .A(n12), .B(n114), .C(waddr[0]), .Y(n13) );
  NOR2BX2M U25 ( .AN(n16), .B(waddr[2]), .Y(n12) );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n105), .A0N(\FIFO_MEMORY[0][0] ), .A1N(n11), 
        .Y(n22) );
  OAI2BB2X1M U27 ( .B0(n11), .B1(n106), .A0N(\FIFO_MEMORY[0][1] ), .A1N(n11), 
        .Y(n23) );
  OAI2BB2X1M U28 ( .B0(n11), .B1(n107), .A0N(\FIFO_MEMORY[0][2] ), .A1N(n11), 
        .Y(n24) );
  OAI2BB2X1M U29 ( .B0(n11), .B1(n108), .A0N(\FIFO_MEMORY[0][3] ), .A1N(n11), 
        .Y(n25) );
  OAI2BB2X1M U30 ( .B0(n11), .B1(n109), .A0N(\FIFO_MEMORY[0][4] ), .A1N(n11), 
        .Y(n26) );
  OAI2BB2X1M U31 ( .B0(n11), .B1(n110), .A0N(\FIFO_MEMORY[0][5] ), .A1N(n11), 
        .Y(n27) );
  OAI2BB2X1M U32 ( .B0(n11), .B1(n111), .A0N(\FIFO_MEMORY[0][6] ), .A1N(n11), 
        .Y(n28) );
  OAI2BB2X1M U33 ( .B0(n11), .B1(n112), .A0N(\FIFO_MEMORY[0][7] ), .A1N(n11), 
        .Y(n29) );
  OAI2BB2X1M U34 ( .B0(n105), .B1(n15), .A0N(\FIFO_MEMORY[3][0] ), .A1N(n15), 
        .Y(n46) );
  OAI2BB2X1M U35 ( .B0(n106), .B1(n15), .A0N(\FIFO_MEMORY[3][1] ), .A1N(n15), 
        .Y(n47) );
  OAI2BB2X1M U36 ( .B0(n107), .B1(n15), .A0N(\FIFO_MEMORY[3][2] ), .A1N(n15), 
        .Y(n48) );
  OAI2BB2X1M U37 ( .B0(n108), .B1(n15), .A0N(\FIFO_MEMORY[3][3] ), .A1N(n15), 
        .Y(n49) );
  OAI2BB2X1M U38 ( .B0(n109), .B1(n15), .A0N(\FIFO_MEMORY[3][4] ), .A1N(n15), 
        .Y(n50) );
  OAI2BB2X1M U39 ( .B0(n110), .B1(n15), .A0N(\FIFO_MEMORY[3][5] ), .A1N(n15), 
        .Y(n51) );
  OAI2BB2X1M U40 ( .B0(n111), .B1(n15), .A0N(\FIFO_MEMORY[3][6] ), .A1N(n15), 
        .Y(n52) );
  OAI2BB2X1M U41 ( .B0(n112), .B1(n15), .A0N(\FIFO_MEMORY[3][7] ), .A1N(n15), 
        .Y(n53) );
  OAI2BB2X1M U42 ( .B0(n105), .B1(n13), .A0N(\FIFO_MEMORY[1][0] ), .A1N(n13), 
        .Y(n30) );
  OAI2BB2X1M U43 ( .B0(n106), .B1(n13), .A0N(\FIFO_MEMORY[1][1] ), .A1N(n13), 
        .Y(n31) );
  OAI2BB2X1M U44 ( .B0(n107), .B1(n13), .A0N(\FIFO_MEMORY[1][2] ), .A1N(n13), 
        .Y(n32) );
  OAI2BB2X1M U45 ( .B0(n108), .B1(n13), .A0N(\FIFO_MEMORY[1][3] ), .A1N(n13), 
        .Y(n33) );
  OAI2BB2X1M U46 ( .B0(n109), .B1(n13), .A0N(\FIFO_MEMORY[1][4] ), .A1N(n13), 
        .Y(n34) );
  OAI2BB2X1M U47 ( .B0(n110), .B1(n13), .A0N(\FIFO_MEMORY[1][5] ), .A1N(n13), 
        .Y(n35) );
  OAI2BB2X1M U48 ( .B0(n111), .B1(n13), .A0N(\FIFO_MEMORY[1][6] ), .A1N(n13), 
        .Y(n36) );
  OAI2BB2X1M U49 ( .B0(n112), .B1(n13), .A0N(\FIFO_MEMORY[1][7] ), .A1N(n13), 
        .Y(n37) );
  OAI2BB2X1M U50 ( .B0(n105), .B1(n17), .A0N(\FIFO_MEMORY[4][0] ), .A1N(n17), 
        .Y(n54) );
  OAI2BB2X1M U51 ( .B0(n106), .B1(n17), .A0N(\FIFO_MEMORY[4][1] ), .A1N(n17), 
        .Y(n55) );
  OAI2BB2X1M U52 ( .B0(n107), .B1(n17), .A0N(\FIFO_MEMORY[4][2] ), .A1N(n17), 
        .Y(n56) );
  OAI2BB2X1M U53 ( .B0(n108), .B1(n17), .A0N(\FIFO_MEMORY[4][3] ), .A1N(n17), 
        .Y(n57) );
  OAI2BB2X1M U54 ( .B0(n109), .B1(n17), .A0N(\FIFO_MEMORY[4][4] ), .A1N(n17), 
        .Y(n58) );
  OAI2BB2X1M U55 ( .B0(n110), .B1(n17), .A0N(\FIFO_MEMORY[4][5] ), .A1N(n17), 
        .Y(n59) );
  OAI2BB2X1M U56 ( .B0(n111), .B1(n17), .A0N(\FIFO_MEMORY[4][6] ), .A1N(n17), 
        .Y(n60) );
  OAI2BB2X1M U57 ( .B0(n112), .B1(n17), .A0N(\FIFO_MEMORY[4][7] ), .A1N(n17), 
        .Y(n61) );
  INVX2M U58 ( .A(wdata[0]), .Y(n105) );
  OAI2BB2X1M U59 ( .B0(n105), .B1(n97), .A0N(\FIFO_MEMORY[2][0] ), .A1N(n97), 
        .Y(n38) );
  OAI2BB2X1M U60 ( .B0(n106), .B1(n97), .A0N(\FIFO_MEMORY[2][1] ), .A1N(n97), 
        .Y(n39) );
  OAI2BB2X1M U61 ( .B0(n107), .B1(n97), .A0N(\FIFO_MEMORY[2][2] ), .A1N(n97), 
        .Y(n40) );
  OAI2BB2X1M U62 ( .B0(n108), .B1(n97), .A0N(\FIFO_MEMORY[2][3] ), .A1N(n97), 
        .Y(n41) );
  OAI2BB2X1M U63 ( .B0(n109), .B1(n97), .A0N(\FIFO_MEMORY[2][4] ), .A1N(n97), 
        .Y(n42) );
  OAI2BB2X1M U64 ( .B0(n110), .B1(n97), .A0N(\FIFO_MEMORY[2][5] ), .A1N(n97), 
        .Y(n43) );
  OAI2BB2X1M U65 ( .B0(n111), .B1(n97), .A0N(\FIFO_MEMORY[2][6] ), .A1N(n97), 
        .Y(n44) );
  OAI2BB2X1M U66 ( .B0(n112), .B1(n97), .A0N(\FIFO_MEMORY[2][7] ), .A1N(n97), 
        .Y(n45) );
  OAI2BB2X1M U67 ( .B0(n105), .B1(n96), .A0N(\FIFO_MEMORY[5][0] ), .A1N(n96), 
        .Y(n62) );
  OAI2BB2X1M U68 ( .B0(n106), .B1(n96), .A0N(\FIFO_MEMORY[5][1] ), .A1N(n96), 
        .Y(n63) );
  OAI2BB2X1M U69 ( .B0(n107), .B1(n96), .A0N(\FIFO_MEMORY[5][2] ), .A1N(n96), 
        .Y(n64) );
  OAI2BB2X1M U70 ( .B0(n108), .B1(n96), .A0N(\FIFO_MEMORY[5][3] ), .A1N(n96), 
        .Y(n65) );
  OAI2BB2X1M U71 ( .B0(n109), .B1(n96), .A0N(\FIFO_MEMORY[5][4] ), .A1N(n96), 
        .Y(n66) );
  OAI2BB2X1M U72 ( .B0(n110), .B1(n96), .A0N(\FIFO_MEMORY[5][5] ), .A1N(n96), 
        .Y(n67) );
  OAI2BB2X1M U73 ( .B0(n111), .B1(n96), .A0N(\FIFO_MEMORY[5][6] ), .A1N(n96), 
        .Y(n68) );
  OAI2BB2X1M U74 ( .B0(n112), .B1(n96), .A0N(\FIFO_MEMORY[5][7] ), .A1N(n96), 
        .Y(n69) );
  OAI2BB2X1M U75 ( .B0(n105), .B1(n95), .A0N(\FIFO_MEMORY[6][0] ), .A1N(n95), 
        .Y(n70) );
  OAI2BB2X1M U76 ( .B0(n106), .B1(n95), .A0N(\FIFO_MEMORY[6][1] ), .A1N(n95), 
        .Y(n71) );
  OAI2BB2X1M U77 ( .B0(n107), .B1(n95), .A0N(\FIFO_MEMORY[6][2] ), .A1N(n95), 
        .Y(n72) );
  OAI2BB2X1M U78 ( .B0(n108), .B1(n95), .A0N(\FIFO_MEMORY[6][3] ), .A1N(n95), 
        .Y(n73) );
  OAI2BB2X1M U79 ( .B0(n109), .B1(n95), .A0N(\FIFO_MEMORY[6][4] ), .A1N(n95), 
        .Y(n74) );
  OAI2BB2X1M U80 ( .B0(n110), .B1(n95), .A0N(\FIFO_MEMORY[6][5] ), .A1N(n95), 
        .Y(n75) );
  OAI2BB2X1M U81 ( .B0(n111), .B1(n95), .A0N(\FIFO_MEMORY[6][6] ), .A1N(n95), 
        .Y(n76) );
  OAI2BB2X1M U82 ( .B0(n112), .B1(n95), .A0N(\FIFO_MEMORY[6][7] ), .A1N(n95), 
        .Y(n77) );
  OAI2BB2X1M U83 ( .B0(n105), .B1(n94), .A0N(\FIFO_MEMORY[7][0] ), .A1N(n94), 
        .Y(n78) );
  OAI2BB2X1M U84 ( .B0(n106), .B1(n94), .A0N(\FIFO_MEMORY[7][1] ), .A1N(n94), 
        .Y(n79) );
  OAI2BB2X1M U85 ( .B0(n107), .B1(n94), .A0N(\FIFO_MEMORY[7][2] ), .A1N(n94), 
        .Y(n80) );
  OAI2BB2X1M U86 ( .B0(n108), .B1(n94), .A0N(\FIFO_MEMORY[7][3] ), .A1N(n94), 
        .Y(n81) );
  OAI2BB2X1M U87 ( .B0(n109), .B1(n94), .A0N(\FIFO_MEMORY[7][4] ), .A1N(n94), 
        .Y(n82) );
  OAI2BB2X1M U88 ( .B0(n110), .B1(n94), .A0N(\FIFO_MEMORY[7][5] ), .A1N(n94), 
        .Y(n83) );
  OAI2BB2X1M U89 ( .B0(n111), .B1(n94), .A0N(\FIFO_MEMORY[7][6] ), .A1N(n94), 
        .Y(n84) );
  OAI2BB2X1M U90 ( .B0(n112), .B1(n94), .A0N(\FIFO_MEMORY[7][7] ), .A1N(n94), 
        .Y(n85) );
  AND2X2M U91 ( .A(waddr[2]), .B(n16), .Y(n18) );
  NAND3X2M U92 ( .A(waddr[0]), .B(n114), .C(n18), .Y(n19) );
  NAND3X2M U93 ( .A(n12), .B(n113), .C(waddr[1]), .Y(n14) );
  NAND3X2M U94 ( .A(waddr[1]), .B(n113), .C(n18), .Y(n20) );
  NAND3X2M U95 ( .A(waddr[1]), .B(waddr[0]), .C(n18), .Y(n21) );
  INVX2M U96 ( .A(waddr[1]), .Y(n114) );
  INVX2M U97 ( .A(waddr[0]), .Y(n113) );
  MX2X2M U98 ( .A(n91), .B(n90), .S0(N12), .Y(rdata[7]) );
  MX4X1M U99 ( .A(\FIFO_MEMORY[4][7] ), .B(\FIFO_MEMORY[5][7] ), .C(
        \FIFO_MEMORY[6][7] ), .D(\FIFO_MEMORY[7][7] ), .S0(n92), .S1(N11), .Y(
        n90) );
  MX4X1M U100 ( .A(\FIFO_MEMORY[0][7] ), .B(\FIFO_MEMORY[1][7] ), .C(
        \FIFO_MEMORY[2][7] ), .D(\FIFO_MEMORY[3][7] ), .S0(n93), .S1(N11), .Y(
        n91) );
  MX2X2M U101 ( .A(n89), .B(n88), .S0(N12), .Y(rdata[6]) );
  MX4X1M U102 ( .A(\FIFO_MEMORY[4][6] ), .B(\FIFO_MEMORY[5][6] ), .C(
        \FIFO_MEMORY[6][6] ), .D(\FIFO_MEMORY[7][6] ), .S0(n92), .S1(N11), .Y(
        n88) );
  MX4X1M U103 ( .A(\FIFO_MEMORY[0][6] ), .B(\FIFO_MEMORY[1][6] ), .C(
        \FIFO_MEMORY[2][6] ), .D(\FIFO_MEMORY[3][6] ), .S0(n93), .S1(N11), .Y(
        n89) );
  MX2X2M U104 ( .A(n6), .B(n5), .S0(N12), .Y(rdata[2]) );
  MX4X1M U105 ( .A(\FIFO_MEMORY[4][2] ), .B(\FIFO_MEMORY[5][2] ), .C(
        \FIFO_MEMORY[6][2] ), .D(\FIFO_MEMORY[7][2] ), .S0(n92), .S1(N11), .Y(
        n5) );
  MX4X1M U106 ( .A(\FIFO_MEMORY[0][2] ), .B(\FIFO_MEMORY[1][2] ), .C(
        \FIFO_MEMORY[2][2] ), .D(\FIFO_MEMORY[3][2] ), .S0(n93), .S1(N11), .Y(
        n6) );
  MX2X2M U107 ( .A(n8), .B(n7), .S0(N12), .Y(rdata[3]) );
  MX4X1M U108 ( .A(\FIFO_MEMORY[4][3] ), .B(\FIFO_MEMORY[5][3] ), .C(
        \FIFO_MEMORY[6][3] ), .D(\FIFO_MEMORY[7][3] ), .S0(n92), .S1(N11), .Y(
        n7) );
  MX4X1M U109 ( .A(\FIFO_MEMORY[0][3] ), .B(\FIFO_MEMORY[1][3] ), .C(
        \FIFO_MEMORY[2][3] ), .D(\FIFO_MEMORY[3][3] ), .S0(n93), .S1(N11), .Y(
        n8) );
  MX2X2M U110 ( .A(n10), .B(n9), .S0(N12), .Y(rdata[4]) );
  MX4X1M U111 ( .A(\FIFO_MEMORY[4][4] ), .B(\FIFO_MEMORY[5][4] ), .C(
        \FIFO_MEMORY[6][4] ), .D(\FIFO_MEMORY[7][4] ), .S0(n92), .S1(N11), .Y(
        n9) );
  MX4X1M U112 ( .A(\FIFO_MEMORY[0][4] ), .B(\FIFO_MEMORY[1][4] ), .C(
        \FIFO_MEMORY[2][4] ), .D(\FIFO_MEMORY[3][4] ), .S0(n93), .S1(N11), .Y(
        n10) );
  MX2X2M U113 ( .A(n2), .B(n1), .S0(N12), .Y(rdata[0]) );
  MX4X1M U114 ( .A(\FIFO_MEMORY[4][0] ), .B(\FIFO_MEMORY[5][0] ), .C(
        \FIFO_MEMORY[6][0] ), .D(\FIFO_MEMORY[7][0] ), .S0(n92), .S1(N11), .Y(
        n1) );
  MX4X1M U115 ( .A(\FIFO_MEMORY[0][0] ), .B(\FIFO_MEMORY[1][0] ), .C(
        \FIFO_MEMORY[2][0] ), .D(\FIFO_MEMORY[3][0] ), .S0(n93), .S1(N11), .Y(
        n2) );
  MX2X2M U116 ( .A(n87), .B(n86), .S0(N12), .Y(rdata[5]) );
  MX4X1M U117 ( .A(\FIFO_MEMORY[4][5] ), .B(\FIFO_MEMORY[5][5] ), .C(
        \FIFO_MEMORY[6][5] ), .D(\FIFO_MEMORY[7][5] ), .S0(n92), .S1(N11), .Y(
        n86) );
  MX4X1M U118 ( .A(\FIFO_MEMORY[0][5] ), .B(\FIFO_MEMORY[1][5] ), .C(
        \FIFO_MEMORY[2][5] ), .D(\FIFO_MEMORY[3][5] ), .S0(n93), .S1(N11), .Y(
        n87) );
  MX2X2M U119 ( .A(n4), .B(n3), .S0(N12), .Y(rdata[1]) );
  MX4X1M U120 ( .A(\FIFO_MEMORY[4][1] ), .B(\FIFO_MEMORY[5][1] ), .C(
        \FIFO_MEMORY[6][1] ), .D(\FIFO_MEMORY[7][1] ), .S0(n92), .S1(N11), .Y(
        n3) );
  MX4X1M U121 ( .A(\FIFO_MEMORY[0][1] ), .B(\FIFO_MEMORY[1][1] ), .C(
        \FIFO_MEMORY[2][1] ), .D(\FIFO_MEMORY[3][1] ), .S0(n93), .S1(N11), .Y(
        n4) );
  BUFX2M U122 ( .A(N10), .Y(n93) );
  BUFX2M U123 ( .A(N10), .Y(n92) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH4 ( W_CLK, W_RST, W_INC, WR_DATA, 
        R_CLK, R_RST, R_INC, RD_DATA, FULL, EMPTY );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   n1, n2;
  wire   [3:0] rptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] waddr;
  wire   [2:0] raddr;

  DF_SYNC_ADDR_WIDTH4_0 sync_rptr_to_wclk ( .ptr(rptr), .clk(W_CLK), .rst(n1), 
        .q2_ptr(wq2_rptr) );
  DF_SYNC_ADDR_WIDTH4_1 sync_wptr_to_rclk ( .ptr(wptr), .clk(R_CLK), .rst(
        R_RST), .q2_ptr(rq2_wptr) );
  FIFO_WR_DATA_WIDTH8_ADDR_WIDTH4 write_ctrl ( .winc(W_INC), .wq2_rptr(
        wq2_rptr), .wclk(W_CLK), .wrst_n(n1), .wfull(FULL), .wptr(wptr), 
        .wadrr(waddr) );
  FIFO_RD_ADDR_WIDTH4_DATA_WIDTH8 read_ctrl ( .rinc(R_INC), .rclk(R_CLK), 
        .rrst_n(R_RST), .rq2_wptr(rq2_wptr), .rempty(EMPTY), .rptr(rptr), 
        .raddr(raddr) );
  FIFO_MEM_CNTRL_ADDR_WIDTH4_DATA_WIDTH8 mem_ctrl ( .wdata(WR_DATA), .waddr(
        waddr), .wfull(FULL), .winc(W_INC), .wclk(W_CLK), .wrst_n(n1), .raddr(
        raddr), .rdata(RD_DATA) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
endmodule


module SYS_TOP ( UART_RX_IN, UART_CLK, REF_CLK, RST_N, UART_TX_O, parity_error, 
        framing_error );
  input UART_RX_IN, UART_CLK, REF_CLK, RST_N;
  output UART_TX_O, parity_error, framing_error;
  wire   Gate_EN_top, ALU_CLK_top, SYNC_RST_1, SYNC_RST_2, RX_CLK_top,
         TX_CLK_top, BUSY_top, RD_INC_top, RX_DATA_VALID_OUTPUT,
         RX_DATA_VALID_SYNC, FIFO_EMPTY_top, Rd_D_Vld_top, ALU_OUT_VALID_top,
         FIFO_FULL_top, WrEn_top, RdEn_top, ALU_EN_top, WR_INC_top, n1, n2, n3,
         n4, n5, n6;
  wire   [7:0] Div_ratio_MUX_top;
  wire   [7:0] Div_ratio_top;
  wire   [7:0] RX_OUTPUT;
  wire   [7:0] RX_DATA_SYNC;
  wire   [7:0] UART_CONFIG_top;
  wire   [7:0] RD_DATA_top;
  wire   [7:0] Rd_D_top;
  wire   [15:0] ALU_OUT_top;
  wire   [3:0] Addr_top;
  wire   [7:0] Wr_D_top;
  wire   [3:0] ALU_FUN_top;
  wire   [7:0] WR_DATA_top;
  wire   [7:0] OP_A_top;
  wire   [7:0] OP_B_top;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  CLK_GATE clk_gate_inst ( .CLK_EN(Gate_EN_top), .CLK(REF_CLK), .GATED_CLK(
        ALU_CLK_top) );
  RST_SYNC_NUM_STAGES2_0 rst_sync_1_inst ( .RST(RST_N), .CLK(REF_CLK), 
        .SYNC_RST(SYNC_RST_1) );
  RST_SYNC_NUM_STAGES2_1 rst_sync_2_inst ( .RST(RST_N), .CLK(UART_CLK), 
        .SYNC_RST(SYNC_RST_2) );
  ClkDiv_DivRatio_Width8_0 ClkDiv_RX_inst ( .i_ref_clk(UART_CLK), .i_rst_n(n3), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        Div_ratio_MUX_top[3:0]}), .o_div_clk(RX_CLK_top) );
  ClkDiv_DivRatio_Width8_1 ClkDiv_TX_inst ( .i_ref_clk(UART_CLK), .i_rst_n(n3), 
        .i_clk_en(1'b1), .i_div_ratio(Div_ratio_top), .o_div_clk(TX_CLK_top)
         );
  Pulse_Gen Pulse_Gen_inst ( .RST(n3), .CLK(TX_CLK_top), .LVL_SIG(BUSY_top), 
        .PULSE_SIG(RD_INC_top) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 DATA_SYNC_inst ( .unsync_bus(RX_OUTPUT), 
        .bus_enable(RX_DATA_VALID_OUTPUT), .CLK(REF_CLK), .RST(n5), .sync_bus(
        RX_DATA_SYNC), .enable_pulse(RX_DATA_VALID_SYNC) );
  CLKDIV_MUX_WIDTH8 CLKDIV_MUX_inst ( .IN(UART_CONFIG_top[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        Div_ratio_MUX_top[3:0]}) );
  UART_TOP_Data_width8 UART_TOP_inst ( .RX_IN(UART_RX_IN), .F_EMPTY_VALID(
        FIFO_EMPTY_top), .RD_Data(RD_DATA_top), .UART_CONFIG(UART_CONFIG_top), 
        .TX_CLK(TX_CLK_top), .RX_CLK(RX_CLK_top), .RST_UART(n3), .TX_OUT(
        UART_TX_O), .BUSY(BUSY_top), .parity_error(parity_error), 
        .Frame_error(framing_error), .RX_OUT(RX_OUTPUT), .RX_VALID(
        RX_DATA_VALID_OUTPUT) );
  SYS_CTRL_Data_width8_Address_width4_ALU_Operations4 sys_ctrl_inst ( 
        .Rd_Data(Rd_D_top), .REG_Rd_Data_valid(Rd_D_Vld_top), .ALU_OUT(
        ALU_OUT_top), .ALU_OUT_VALID(ALU_OUT_VALID_top), .FIFO_FULL(
        FIFO_FULL_top), .SYNCED_DATA(RX_DATA_SYNC), .RX_DATA_VALID(
        RX_DATA_VALID_SYNC), .CLK(REF_CLK), .RST(n5), .WrEn(WrEn_top), .RdEn(
        RdEn_top), .Addr(Addr_top), .Wr_Data(Wr_D_top), .Gate_EN(Gate_EN_top), 
        .ALU_FUN(ALU_FUN_top), .En(ALU_EN_top), .WR_INC(WR_INC_top), .WR_DATA(
        WR_DATA_top) );
  Register_File_Data_width8_Address_width4 register_file_inst ( .WrData(
        Wr_D_top), .Address({Addr_top[3:2], n2, n1}), .WrEn(WrEn_top), .RdEn(
        RdEn_top), .CLK(REF_CLK), .RST(n5), .RdData(Rd_D_top), .RdData_Valid(
        Rd_D_Vld_top), .REG0(OP_A_top), .REG1(OP_B_top), .REG2(UART_CONFIG_top), .REG3(Div_ratio_top) );
  ALU_input_width8_output_width16 ALU_inst ( .A(OP_A_top), .B(OP_B_top), 
        .ALU_FUN(ALU_FUN_top), .Enable(ALU_EN_top), .CLK(ALU_CLK_top), .RST(n5), .ALU_OUT(ALU_OUT_top), .OUT_VALID(ALU_OUT_VALID_top) );
  ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH4 async_fifo_inst ( .W_CLK(REF_CLK), 
        .W_RST(n5), .W_INC(WR_INC_top), .WR_DATA(WR_DATA_top), .R_CLK(
        TX_CLK_top), .R_RST(n3), .R_INC(RD_INC_top), .RD_DATA(RD_DATA_top), 
        .FULL(FIFO_FULL_top), .EMPTY(FIFO_EMPTY_top) );
  INVX2M U1 ( .A(n4), .Y(n3) );
  BUFX2M U2 ( .A(Addr_top[0]), .Y(n1) );
  BUFX2M U3 ( .A(Addr_top[1]), .Y(n2) );
  INVX4M U4 ( .A(n6), .Y(n5) );
  INVX2M U5 ( .A(SYNC_RST_1), .Y(n6) );
  INVX2M U6 ( .A(SYNC_RST_2), .Y(n4) );
endmodule

