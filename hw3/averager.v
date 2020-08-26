`timescale 1ns/1ps

module averager(average, i0, i1, i2, i3, i4, i5, i6, i7, i8);
//DO NOT CHANGE!
	input  [5:0] i0, i1, i2, i3, i4 , i5, i6, i7, i8;
	output [5:0] average;
//---------------------------------------------------
    wire [8:0]  a0,a1,a2,a3,a4,a5,a6,a7,a8;
    assign a0={i0[5],i0[5],i0[5],i0};
    assign a1={i1[5],i1[5],i1[5],i1};
    assign a2={i2[5],i2[5],i2[5],i2};
    assign a3={i3[5],i3[5],i3[5],i3};
    assign a4={i4[5],i4[5],i4[5],i4};
    assign a5={i5[5],i5[5],i5[5],i5};
    assign a6={i6[5],i6[5],i6[5],i6};
    assign a7={i7[5],i7[5],i7[5],i7};
    assign a8={i8[5],i8[5],i8[5],i8};
    
    wire [8:0]sum4;
    CSAdd_9 add1(a7,a0,a1,a3,a6,a8,a4,a2,a5,sum4);
    

    // 10bits
    divider div1(average,sum4); 

endmodule

module CSAdd_9(I1, I2, I3, I4, I5, I6, I7, I8, I9, O);
        input  [8:0] I1, I2, I3, I4, I5, I6, I7, I8, I9;
        output [8:0] O;
        
        wire   [8:0] c1,s1,c2,s2,c3,s3,c4,s4,c5,s5,c6,s6,c7,s7;
        assign a = 1'b0;
        
        assign c1[0] = a;
        assign c2[0] = a;
        assign c3[0] = a;
        assign c4[0] = a;
        assign c5[0] = a;
        assign c6[0] = a;
        assign c7[0] = a;
        
        wire c9,c10,c11,c12,c13,c14,c15;

        FA1 fa0(c1[1], s1[0], I1[0], I2[0], I3[0]);
        FA1 fa1(c1[2], s1[1], I1[1], I2[1], I3[1]);
        FA1 fa2(c1[3], s1[2], I1[2], I2[2], I3[2]);        
        FA1 fa3(c1[4], s1[3], I1[3], I2[3], I3[3]);
        FA1 fa4(c1[5], s1[4], I1[4], I2[4], I3[4]);
        FA1 fa5(c1[6], s1[5], I1[5], I2[5], I3[5]);
        FA1 fa6(c1[7], s1[6], I1[6], I2[6], I3[6]);
        FA1 fa7(c1[8], s1[7], I1[7], I2[7], I3[7]);
        FA1 fa8(c9, s1[8], I1[8], I2[8], I3[8]);

        FA1 fa10(c2[1], s2[0], I4[0], I5[0], I6[0]);
        FA1 fa11(c2[2], s2[1], I4[1], I5[1], I6[1]);
        FA1 fa12(c2[3], s2[2], I4[2], I5[2], I6[2]);        
        FA1 fa13(c2[4], s2[3], I4[3], I5[3], I6[3]);
        FA1 fa14(c2[5], s2[4], I4[4], I5[4], I6[4]);
        FA1 fa15(c2[6], s2[5], I4[5], I5[5], I6[5]);
        FA1 fa16(c2[7], s2[6], I4[6], I5[6], I6[6]);
        FA1 fa17(c2[8], s2[7], I4[7], I5[7], I6[7]);
        FA1 fa18(c10, s2[8], I4[8], I5[8], I6[8]);
        
        FA1 fa20(c3[1], s3[0], I7[0], I8[0], I9[0]);
        FA1 fa21(c3[2], s3[1], I7[1], I8[1], I9[1]);
        FA1 fa22(c3[3], s3[2], I7[2], I8[2], I9[2]);        
        FA1 fa23(c3[4], s3[3], I7[3], I8[3], I9[3]);
        FA1 fa24(c3[5], s3[4], I7[4], I8[4], I9[4]);
        FA1 fa25(c3[6], s3[5], I7[5], I8[5], I9[5]);
        FA1 fa26(c3[7], s3[6], I7[6], I8[6], I9[6]);
        FA1 fa27(c3[8], s3[7], I7[7], I8[7], I9[7]);
        FA1 fa28(c11, s3[8], I7[8], I8[8], I9[8]);
        
//        HA1 fa30(c4[1], s4[0], c2[0], c3[0]);
        assign c4[1] = 1'b0;
        assign s4[0] = 1'b0;
        
        FA1 fa31(c4[2], s4[1], c1[1], c2[1], c3[1]);
        FA1 fa32(c4[3], s4[2], c1[2], c2[2], c3[2]);        
        FA1 fa33(c4[4], s4[3], c1[3], c2[3], c3[3]);
        FA1 fa34(c4[5], s4[4], c1[4], c2[4], c3[4]);
        FA1 fa35(c4[6], s4[5], c1[5], c2[5], c3[5]);
        FA1 fa36(c4[7], s4[6], c1[6], c2[6], c3[6]);
        FA1 fa37(c4[8], s4[7], c1[7], c2[7], c3[7]);
        FA1 fa38(c12, s4[8], c1[8], c2[8], c3[8]);
        
        FA1 fa40(c5[1], s5[0], s1[0], s2[0], s3[0]);
        FA1 fa41(c5[2], s5[1], s1[1], s2[1], s3[1]);
        FA1 fa42(c5[3], s5[2], s1[2], s2[2], s3[2]);        
        FA1 fa43(c5[4], s5[3], s1[3], s2[3], s3[3]);
        FA1 fa44(c5[5], s5[4], s1[4], s2[4], s3[4]);
        FA1 fa45(c5[6], s5[5], s1[5], s2[5], s3[5]);
        FA1 fa46(c5[7], s5[6], s1[6], s2[6], s3[6]);
        FA1 fa47(c5[8], s5[7], s1[7], s2[7], s3[7]);
        FA1 fa48(c13, s5[8], s1[8], s2[8], s3[8]);
        
//        HA1 fa50(c6[1], s6[0], c5[0], s4[0]);
        assign s6[0] = s4[0];
        assign c6[1] = 1'b0;
        
        FA1 fa51(c6[2], s6[1], c4[1], c5[1], s4[1]);
        FA1 fa52(c6[3], s6[2], c4[2], c5[2], s4[2]);        
        FA1 fa53(c6[4], s6[3], c4[3], c5[3], s4[3]);
        FA1 fa54(c6[5], s6[4], c4[4], c5[4], s4[4]);
        FA1 fa55(c6[6], s6[5], c4[5], c5[5], s4[5]);
        FA1 fa56(c6[7], s6[6], c4[6], c5[6], s4[6]);
        FA1 fa57(c6[8], s6[7], c4[7], c5[7], s4[7]);
        FA1 fa58(c14, s6[8], c4[8], c5[8], s4[8]);
        
        HA1 fa60(c7[1], s7[0], s6[0], s5[0]);
        FA1 fa61(c7[2], s7[1], c6[1], s6[1], s5[1]);
        FA1 fa62(c7[3], s7[2], c6[2], s6[2], s5[2]);        
        FA1 fa63(c7[4], s7[3], c6[3], s6[3], s5[3]);
        FA1 fa64(c7[5], s7[4], c6[4], s6[4], s5[4]);
        FA1 fa65(c7[6], s7[5], c6[5], s6[5], s5[5]);
        FA1 fa66(c7[7], s7[6], c6[6], s6[6], s5[6]);
        FA1 fa67(c7[8], s7[7], c6[7], s6[7], s5[7]);
        FA1 fa68(c15, s7[8], c6[8], s6[8], s5[8]);
        
        wire c16,c17,c18,c19,c20,c21,c22,c23,c24;
        
//        HA1 fa70(c16, O[0], c7[0], s7[0]);
        assign O[0] = s7[0];
        
        HA1 fa71(c17, O[1], c7[1], s7[1]);
        FA1 fa72(c18, O[2], c7[2], s7[2], c17);        
        FA1 fa73(c19, O[3], c7[3], s7[3], c18);
        FA1 fa74(c20, O[4], c7[4], s7[4], c19);
        FA1 fa75(c21, O[5], c7[5], s7[5], c20);
        FA1 fa76(c22, O[6], c7[6], s7[6], c21);
        FA1 fa77(c23, O[7], c7[7], s7[7], c22);
        FA1 fa78(c24, O[8], c7[8], s7[8], c23);
        

endmodule

module CSAdd(I1, I2, I3, O);
        input  [8:0] I1, I2, I3;
        output [8:0] O;
        
        wire   [8:0] c,s;
        assign a = 1'b0;
        assign c[0] = a;
        wire c10,c0,c1,c2,c3,c4,c5,c6,c7,c8;

        FA1 fa0(c[1], s[0], I1[0], I2[0], I3[0]);
        FA1 fa1(c[2], s[1], I1[1], I2[1], I3[1]);
        FA1 fa2(c[3], s[2], I1[2], I2[2], I3[2]);        
        FA1 fa3(c[4], s[3], I1[3], I2[3], I3[3]);
        FA1 fa4(c[5], s[4], I1[4], I2[4], I3[4]);
        FA1 fa5(c[6], s[5], I1[5], I2[5], I3[5]);
        FA1 fa6(c[7], s[6], I1[6], I2[6], I3[6]);
        FA1 fa7(c[8], s[7], I1[7], I2[7], I3[7]);
        FA1 fa8(c10, s[8], I1[8], I2[8], I3[8]);

//        HA1 fa10(c0, O[0], c[0], s[0]);
        assign O[0] = s[0];
        HA1 fa11(c1, O[1], c[1], s[1]);
        FA1 fa12(c2, O[2], c[2], s[2], c1);        
        FA1 fa13(c3, O[3], c[3], s[3], c2);
        FA1 fa14(c4, O[4], c[4], s[4], c3);
        FA1 fa15(c5, O[5], c[5], s[5], c4);
        FA1 fa16(c6, O[6], c[6], s[6], c5);
        FA1 fa17(c7, O[7], c[7], s[7], c6);
        FA1 fa18(c8, O[8], c[8], s[8], c7);

endmodule


module add6(c, sum, a, b, c_last);
    input [5:0] a, b;
    input c_last;
    
    output [5:0] sum;
    output c;
    
    wire c0,c1,c2,c3,c4;

    FA1 fa0(c0,sum[0],a[0],b[0],c_last);
    FA1 fa1(c1,sum[1],a[1],b[1],c0);
    FA1 fa2(c2,sum[2],a[2],b[2],c1);
    FA1 fa3(c3,sum[3],a[3],b[3],c2);
    FA1 fa4(c4,sum[4],a[4],b[4],c3);
    FA1 fa5(c,sum[5],a[5],b[5],c4);

endmodule

module hadd6(c, sum, a, b);
    input [5:0] a, b;
    
    output [5:0] sum;
    output c;
    
    wire c0,c1,c2,c3,c4;

    HA1 fa0(c0,sum[0],a[0],b[0]);
    FA1 fa1(c1,sum[1],a[1],b[1],c0);
    FA1 fa2(c2,sum[2],a[2],b[2],c1);
    FA1 fa3(c3,sum[3],a[3],b[3],c2);
    FA1 fa4(c4,sum[4],a[4],b[4],c3);
    FA1 fa5(c,sum[5],a[5],b[5],c4);

endmodule


module divider(ave, a);
    input [8:0]a;
    output [5:0]ave;
    
    wire s = a[8];
    wire[5:0] int16;
    wire[5:0] int32;
    wire[5:0] int64;
    wire[5:0] int512;
    
    wire[5:0] digit32;
    wire[5:0] digit16;
    wire[5:0] digit64;
    wire[5:0] digit512;
   
    assign int16 = {s,a[8:4]};
    assign int32 = {s,s,a[8:5]};
    assign int64 = {s,s,s,a[8:6]};
    assign int512 = {s,s,s,s,s,s};

    assign digit16 = {a[3],a[2],a[1],a[0],1'b0,1'b0};
    assign digit32 = {a[4],a[3],a[2],a[1],a[0],1'b0};
    assign digit64 = {a[5],a[4],a[3],a[2],a[1],a[0]};
    assign digit512 = {a[8],a[7],a[6],a[5],a[4],a[3]};

    wire c0,c1,c2,c3,c4,c5,c9,c10,c11;
    wire [5:0] sum1, sum2, sum3;
    wire [5:0] sum4, sum5, sum6;
    
    wire [5:0] c6,c7,c8;
    wire [5:0] average1,average2,average3;
    
    CSAdd csadd_1(int32,int16,int64,sum1);
    hadd6 add6_3(c2,sum3,int512,sum1);

    hadd6 add6_4(c3,sum4,digit64,digit32);
    hadd6 add6_5(c5,sum5,digit512,digit16);
    hadd6 add6_6(c4,sum6,sum4,sum5);
    
    assign c6 = {5'b0,c3};
    assign c7 = {5'b0,c4};
    assign c8 = {5'b0,c5};
    
    add6 add6_7(c9,average1,sum3,c8,sum6[5]);
    CSAdd csadd_4(c7,c6,average1,ave);

endmodule
