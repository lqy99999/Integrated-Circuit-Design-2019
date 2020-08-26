/* ----------------------------- DO NOT CHANGE ! ---------------------------- */
`timescale 1ns/1ps

module COA(clk, rst_n, A, B, C, D, valid_in, valid_out, COA_num);
    input clk, rst_n;
    
    // Input/Output Data
    input   [5-1:0] A;
    input   [5-1:0] B;
    input   [5-1:0] C;
    output [10-1:0] D;

    // Handshake signal
    input  valid_in;
    output valid_out;

    // Area count
    output [50:0] COA_num;
/* ----------------------------- DO NOT CHANGE ! ---------------------------- */

/* --------------------- Write your code from this line --------------------- */
    //A*A
    wire [9:0] result1,result2,result3;
    wire [50:0] num1,num2,num3;
    wire [50:0] num4,num5,num6,num7,num8,num9,num10;
    wire [50:0] num11,num12,num13,num14,num15,num16,num17,num18,num19,num20;
    wire [50:0] num21,num22,num23;
    square sq1(A,result1,num1);
    square sq2(B,result2,num2);
    square sq3(C,result3,num3);
    
    wire [9:0] a2,b2,c2;
    reg10 reg10_2(a2,result1,clk,rst_n,num19);
    reg10 reg10_3(b2,result2,clk,rst_n,num20);
    reg10 reg10_4(c2,result3,clk,rst_n,num21);
    
    //change to -A
    wire [9:0] ir1;
        
    IV iv4(ir1[0],a2[0],num4);   
    IV iv5(ir1[1],a2[1],num5);
    IV iv6(ir1[2],a2[2],num6);
    IV iv7(ir1[3],a2[3],num7);
    IV iv8(ir1[4],a2[4],num8);
    IV iv9(ir1[5],a2[5],num9);
    IV iv10(ir1[6],a2[6],num10);
    IV iv11(ir1[7],a2[7],num11);
    IV iv12(ir1[8],a2[8],num12);
    IV iv13(ir1[9],a2[9],num13);
    
//    IV iv4(ir1[0],result1[0],num4);
//    IV iv5(ir1[1],result1[1],num5);
//    IV iv6(ir1[2],result1[2],num6);
//    IV iv7(ir1[3],result1[3],num7);
//    IV iv8(ir1[4],result1[4],num8);
//    IV iv9(ir1[5],result1[5],num9);
//    IV iv10(ir1[6],result1[6],num10);
//    IV iv11(ir1[7],result1[7],num11);
//    IV iv12(ir1[8],result1[8],num12);
//    IV iv13(ir1[9],result1[9],num13);
    
    wire [9:0] ir2;
    wire c1;
    hadd10 hadd10_1(ir1,1'b1,c1,ir2,num14);
//    reg10 reg10_2(a2,ir2,clk,rst_n,num19);

    wire [10:0] final;
    wire[10:0] reg1;
    wire DD;
    //B*B+C*C-A*A
//    CSAdd11 csa11_1({1'b1,ir2},{1'b0,b2},{1'b0,c2},final,num15);
//    add11 add11_1(reg1,{1'b1,ir2},{1'b0,result2},num15);
//    add11 add11_2(final,reg1,{1'b0,result3},num18);
    add11 add11_1(reg1,{1'b0,c2},{1'b0,b2},num15);
    add11 add11_2(final,reg1,{1'b1,ir2},num16);
    
//    FD2 fd2_2(valid_out,valid_in,clk,rst_n,num17);
    reg10 reg10_1(D,final[10:1],clk,rst_n,num17);
    
    OR2 for20(DD, valid_out, c2[0], num18);
    FD2 fd0(valid_out, DD, clk, rst_n, num22);
   
/* -------------------- Add up your number of transistors ------------------- */
    assign COA_num = num1+num2+num3+num4+num5+num6+num7+num8+num9+num10
                +num11+num12+num13+num14+num15+num16+num17+num18
//                +num19+num20+num21
                +num22;


endmodule

module reg10(Q,DD,clk,reset,reg3_num);
    output [9:0] Q;
    input [9:0] DD;
    input clk,reset;
    
    output wire[50:0] reg3_num;
    wire[50:0] fd_num0,fd_num1,fd_num2,fd_num3,fd_num4,fd_num5;
    wire[50:0] fd_num6,fd_num7,fd_num8,fd_num9;
    
    FD2 fd0(Q[0],DD[0],clk,reset,fd_num0);
    FD2 fd1(Q[1],DD[1],clk,reset,fd_num1);
    FD2 fd2(Q[2],DD[2],clk,reset,fd_num2);
    FD2 fd3(Q[3],DD[3],clk,reset,fd_num3);
    FD2 fd4(Q[4],DD[4],clk,reset,fd_num4);
    FD2 fd5(Q[5],DD[5],clk,reset,fd_num5);
    FD2 fd6(Q[6],DD[6],clk,reset,fd_num6);
    FD2 fd7(Q[7],DD[7],clk,reset,fd_num7);
    FD2 fd8(Q[8],DD[8],clk,reset,fd_num8);
    FD2 fd9(Q[9],DD[9],clk,reset,fd_num9);
    
    assign reg3_num=fd_num0+fd_num1+fd_num2+fd_num3+fd_num4+fd_num5
                   +fd_num6+fd_num7+fd_num8+fd_num9;
endmodule

module square(a,result,number);
    input wire[4:0] a;
    output [9:0] result;
    output wire[50:0] number;
    
    wire a_s1,a_d1,a_n1;
    wire [50:0]a_num1, a_num2;
    wire [5:0]a_p0;
    boothencoder_0 be1(a[0],a[1],a_s1,a_d1,a_n1,a_num1);
    boothselector bs1(a,a_s1,a_d1,a_n1,a_p0,a_num2);
    
    wire a_s2,a_d2,a_n2;
    wire [50:0]a_num3, a_num4;
    wire [5:0]a_p1;
    boothencoder be2(a[1],a[2],a[3],a_s2,a_d2,a_n2,a_num3);
    boothselector bs2(a,a_s2,a_d2,a_n2,a_p1,a_num4);
    
    wire a_s3,a_d3,a_n3;
    wire [50:0]a_num5, a_num6;
    wire [5:0]a_p2;
    boothencoder_2 be3(a[3],a[4],a_s3,a_d3,a_n3,a_num5); // 1'b0?
    boothselector bs3(a,a_s3,a_d3,a_n3,a_p2,a_num6);
    
    wire [50:0]a_num9,a_num10;
    wire[9:0] r1;
    
//    CSAdd csa1({a_n1,a_n1,a_n1,a_n1,a_p0[5:0]},
//               {a_n2,a_n2,a_p1[5:0],1'b0,a_n1},
//               {a_p2[5:0],1'b0,a_n2,1'b0,1'b0},
//               result[9:0],a_num9);
    add10 add10_1(r1,{a_n1,a_n1,a_n1,a_n1,a_p0[5:0]},
               {a_n2,a_n2,a_p1[5:0],1'b0,a_n1},a_num9);
    add10 add10_2(result[9:0],{a_p2[5:0],1'b0,a_n2,1'b0,1'b0},r1,a_num10);
    
    assign number=a_num1+a_num2+a_num3+a_num4+a_num5+a_num6+a_num9+a_num10;
endmodule

//a=2i-1, b=2i, c=2i+1
module boothencoder (a,b,c,single,double,neg,number);
    input wire a,b,c;
    output single, double, neg;
    output wire[50:0]number;
    
    wire[50:0] number1,number2,number3,number4,number5,number6,number7;
    wire a1,b1,c1,d1,d2;
    EO eo1(single,a,b,number1);
    
    IV iv1(c1,c,number2);
    IV iv2(a1,a,number3);
    IV iv3(b1,b,number4);
    ND3 nd3_1(d1,a,b,c1,number5);
    ND3 nd3_2(d2,a1,b1,c,number6);
    ND2 nd2_1(double,d1,d2,number7); 
    
    assign neg = c;
    assign number = number1+number2+number3+number4+number5+number6+number7;
    
endmodule

module boothencoder_0 (b,c,single,double,neg,number);
    input wire b,c;
    output single, double, neg;
    output wire[50:0]number;
    wire a=1'b0;
    
    wire[50:0] number4,number7;
    wire a1,b1,c1,d1,d2;
    assign single = b;
    assign a1 = 1'b1;
    
    IV iv3(b1,b,number4);
    AN2 nd2_1(double,b1,c,number7); 
    
    assign neg = c;
    assign number = number4+number7;
    
endmodule

module boothencoder_2 (a,b,single,double,neg,number);
    input wire a,b;
    output single, double, neg;
    output wire[50:0]number;
    wire c = 1'b0;
    
    wire[50:0] number1,number7;
    wire a1,b1,d1,d2;
    
    EO eo1(single,a,b,number1);
    AN2 nd2_1(double,a,b,number7); 
    
    assign neg = c;
    assign number = number1+number7;
    
endmodule

module boothselector (y,single,double,neg,p,number);
    input wire[4:0] y;
    input wire single,double,neg;
    output wire[5:0] p;
    output wire[50:0]number;
    
    wire[50:0] number1,number2,number3,number4,number5,number6,number7,number8,number9,number10;
    wire[50:0] number11,number12,number13,number14,number15,number16,number17,number18,number19,number20;
    wire[50:0] number21,number22;
    wire[5:0] ch1,ch2,ch3;
    
    AN2 an2_2(ch1[0],y[0],single,number1);
    AN2 an2_3(ch1[1],y[1],single,number2);
    AN2 an2_4(ch1[2],y[2],single,number3);
    AN2 an2_5(ch1[3],y[3],single,number4);
    AN2 an2_6(ch1[4],y[4],single,number5);
    assign ch1[5] = 1'b0;
    
    assign ch2[0] = 1'b0;
    AN2 an2_8(ch2[1],y[0],double,number7);
    AN2 an2_9(ch2[2],y[1],double,number8);
    AN2 an2_10(ch2[3],y[2],double,number9);
    AN2 an2_11(ch2[4],y[3],double,number10);
    AN2 an2_7(ch2[5],y[4],double,number6);
    
    OR2 or2_1(ch3[0],ch1[0],ch2[0],number11);
    OR2 or2_2(ch3[1],ch1[1],ch2[1],number12);
    OR2 or2_3(ch3[2],ch1[2],ch2[2],number13);
    OR2 or2_4(ch3[3],ch1[3],ch2[3],number14);
    OR2 or2_5(ch3[4],ch1[4],ch2[4],number15);
    OR2 or2_6(ch3[5],ch1[5],ch2[5],number21);
    
    EO eo2(p[0],ch3[0],neg,number16);
    EO eo3(p[1],ch3[1],neg,number17);
    EO eo4(p[2],ch3[2],neg,number18);
    EO eo5(p[3],ch3[3],neg,number19);
    EO eo6(p[4],ch3[4],neg,number20);
    EO eo7(p[5],ch3[5],neg,number22);
    
    assign number=number1+number2+number3+number4+number5+number6+number7+number8+number9+number10
                 +number11+number12+number13+number14+number15+number16+number17+number18+number19+
                 +number20+number21+number22;

endmodule

module add10(sum, a, b, number);
    input [9:0] a, b;
    
    output [9:0] sum;
    output[50:0]number;
    
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9;
    wire[50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10;
    
    HA1 fa0_10(c0,sum[0],a[0],b[0],num1);
    FA1 fa1_10(c1,sum[1],a[1],b[1],c0,num2);
    FA1 fa2_10(c2,sum[2],a[2],b[2],c1,num3);
    FA1 fa3_10(c3,sum[3],a[3],b[3],c2,num4);
    FA1 fa4_10(c4,sum[4],a[4],b[4],c3,num5);
    FA1 fa5_10(c5,sum[5],a[5],b[5],c4,num6);
    FA1 fa6_10(c6,sum[6],a[6],b[6],c5,num7);
    FA1 fa7_10(c7,sum[7],a[7],b[7],c6,num8);
    FA1 fa8_10(c8,sum[8],a[8],b[8],c7,num9);
    EO3 fa9_10(sum[9],a[9],b[9],c8,num10);
//    FA1 fa9_10(c9,sum[9],a[9],b[9],c8,num10);
    
    assign number=num1+num2+num3+num4+num5+num6+num7+num8+num9+num10;

endmodule

module add11(sum, a, b, number);
    input [10:0] a, b;
    
    output [10:0] sum;
    output[50:0]number;
    
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10;
    wire[50:0]num1,num2,num3,num4,num5,num6,num7,num8,num9,num10,num11;
    
    HA1 fa0_10(c0,sum[0],a[0],b[0],num1);
    FA1 fa1_10(c1,sum[1],a[1],b[1],c0,num2);
    FA1 fa2_10(c2,sum[2],a[2],b[2],c1,num3);
    FA1 fa3_10(c3,sum[3],a[3],b[3],c2,num4);
    FA1 fa4_10(c4,sum[4],a[4],b[4],c3,num5);
    FA1 fa5_10(c5,sum[5],a[5],b[5],c4,num6);
    FA1 fa6_10(c6,sum[6],a[6],b[6],c5,num7);
    FA1 fa7_10(c7,sum[7],a[7],b[7],c6,num8);
    FA1 fa8_10(c8,sum[8],a[8],b[8],c7,num9);
    FA1 fa9_10(c9,sum[9],a[9],b[9],c8,num10);
    EO3 fa10_10(sum[10],a[10],b[10],c9,num11);
//    FA1 fa10_10(c10,sum[10],a[10],b[10],c9,num11);
    
    assign number=num1+num2+num3+num4+num5+num6+num7+num8+num9+num10+num11;

endmodule

module CSAdd11(I1, I2, I3, O, number);
        input  [10:0] I1, I2, I3;
        output [10:0] O;
        output wire[50:0] number;
        
        wire   [10:0] c,s;
        assign c[0] = 1'b0;
        wire c10,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9;

    wire[50:0] number1,number2,number3,number4,number5,number6,number7,number8,number9,number10;
    wire[50:0] number11,number12,number13,number14,number15,number16,number17,number18,number19;
    wire[50:0] number20,number21;
        
        FA1 fa0(c[1], s[0], I1[0], I2[0], I3[0], number1);
        FA1 fa1(c[2], s[1], I1[1], I2[1], I3[1], number2);
        FA1 fa2(c[3], s[2], I1[2], I2[2], I3[2], number3);        
        FA1 fa3(c[4], s[3], I1[3], I2[3], I3[3], number4);
        FA1 fa4(c[5], s[4], I1[4], I2[4], I3[4], number5);
        FA1 fa5(c[6], s[5], I1[5], I2[5], I3[5], number6);
        FA1 fa6(c[7], s[6], I1[6], I2[6], I3[6], number7);
        FA1 fa7(c[8], s[7], I1[7], I2[7], I3[7], number8);
        FA1 fa8(c[9], s[8], I1[8], I2[8], I3[8], number16);
        FA1 fa9(c[10], s[9], I1[9], I2[9], I3[9], number17);
        assign s[10]=1'b1;

        assign O[0] = s[0];
        HA1 fa11(c1, O[1], c[1], s[1], number9);
        FA1 fa12(c2, O[2], c[2], s[2], c1, number10);        
        FA1 fa13(c3, O[3], c[3], s[3], c2, number11);
        FA1 fa14(c4, O[4], c[4], s[4], c3, number12);
        FA1 fa15(c5, O[5], c[5], s[5], c4, number13);
        FA1 fa16(c6, O[6], c[6], s[6], c5, number14);
        FA1 fa17(c7, O[7], c[7], s[7], c6, number15);
        FA1 fa18(c8, O[8], c[8], s[8], c7, number18);
        FA1 fa19(c9, O[9], c[9], s[9], c8, number19);
        EO3 fa20(O[10], c[10], s[10], c9, number21);
//        FA1 fa20(c10, O[10], c[10], s[10], c9, number21);
        
    assign number=number1+number2+number3+number4+number5+number6+number7+number8+number9+number10
                     +number11+number12+number13+number14+number15
                     +number16+number17+number18+number19+number21;

endmodule

module hadd10(a, b, c, sum, number);
    input [9:0] a;
    input b;

    output [9:0] sum;
    output c;
    output [50:0] number;
    
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8;
    wire[50:0] number1,number2,number3,number4,number5,number6,number7,number8,number9,number10;
    
    HA1 ha0(c0,sum[0],a[0],b,number1);
    HA1 ha1(c1,sum[1],a[1],c0,number2);
    HA1 ha2(c2,sum[2],a[2],c1,number3);
    HA1 ha3(c3,sum[3],a[3],c2,number4);
    HA1 ha4(c4,sum[4],a[4],c3,number5);
    HA1 ha5(c5,sum[5],a[5],c4,number6);
    HA1 ha6(c6,sum[6],a[6],c5,number7);
    HA1 ha7(c7,sum[7],a[7],c6,number8);
    HA1 ha8(c8,sum[8],a[8],c7,number9);
    EO ha9(sum[9],a[9],c8,number10);
    
    assign number=number1+number2+number3+number4+number5+number6+number7+number8+number9+number10;
endmodule


