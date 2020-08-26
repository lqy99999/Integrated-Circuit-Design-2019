`resetall
`timescale 1ns/1ps

`define HALF_CYCLE      3.59           // Modified your clock cycle here
`define CYCLE           (`HALF_CYCLE*2)     // If cycle time is set shorter than critical path, then your test will fail
`define N               1000                // Number of test data
`define MAX_SIM_CYCLE   10000               // Maximum number of simulation cycles
`define REG_DELAY       0.441
`define DEBUG           0                   // Change 0 to 1 to enable debugging

module test;

reg clk, rst_n;
wire [50:0] COA_num;

reg  [5-1:0]   A_mem[0:`N-1];
reg  [5-1:0]   B_mem[0:`N-1];
reg  [5-1:0]   C_mem[0:`N-1];
reg [10-1:0]   D_mem[0:`N-1];
reg [10-1:0] Ans_mem[0:`N-1];

reg   [5-1:0] A;
reg   [5-1:0] B;
reg   [5-1:0] C;
wire [10-1:0] D;

reg  valid_in;
wire valid_out;

integer i, i_cycle, i_idx, o_idx;
integer err_cnt, errnum;

COA PPL(
    .clk(clk), .rst_n(rst_n),
    .A(A), .B(B), .C(C), .D(D),
    .valid_in(valid_in),
    .valid_out(valid_out),
    .COA_num(COA_num));

initial begin
    // Read data
    $readmemb("A.dat"     , A_mem  );
    $readmemb("B.dat"     , B_mem  );
    $readmemb("C.dat"     , C_mem  );
    $readmemb("answer.dat", Ans_mem);

    // Dump data for nWave to read
    $fsdbDumpfile("COA.fsdb");
    $fsdbDumpvars(0, test);

    // Initial input signal
    clk      = 1;
    rst_n    = 1;

    i        = 0;
    i_cycle  = 0;
    err_cnt  = 0;
    valid_in = 0;

    // Reset system
    # 1 rst_n = 0;
    # (`HALF_CYCLE) rst_n = 1'b1;

    // Wait for next cycle
    for (i=0; i<2; i=i+1)
        @(posedge clk);
    
    // Sending
    for (i_idx=0; i_idx<`N; i_idx=i_idx+1) begin
        // Start sending data to the COA module
        #(`REG_DELAY);
        valid_in = 1;
        A = A_mem[i_idx];
        B = B_mem[i_idx];
        C = C_mem[i_idx];

        if (`DEBUG === 1)
            $display("[SEND   ] %5d,  index: %5d,\t\t %c[1;31mA: %4d, %c[1;32mB: %4d, %c[1;33mC: %4d%c[0m", i_cycle, i_idx, 27, A, 27, B, 27, C, 27);

        @(posedge clk);
    end
end

initial begin
    // Receiving
    for (o_idx=0; o_idx<`N; o_idx=o_idx+1) begin
        // Wait for the "valid_out" to pull up
        while (valid_out !== 1'b1) begin
            if (`DEBUG === 1) begin
                $display("\n%c[1;34m[RECEIVE]%c[0m %5d,  Waiting valid_out...", 27, 27, i_cycle);
            end
            @(posedge clk);
        end

        // Write data to D_mem
        D_mem[o_idx] = D;
        if (`DEBUG === 1)
            $display("\n%c[1;34m[RECEIVE]%c[0m %5d,  index: %5d, D: %4d", 27, 27, i_cycle, o_idx, D);

        @(posedge clk);
    end

    // Check the difference between D_mem and Ans_mem
    $display("\n");
    for (o_idx=0; o_idx<`N; o_idx=o_idx+1) begin
        if (D_mem[o_idx] !== Ans_mem[o_idx]) begin
            err_cnt = err_cnt + 1;
            if (err_cnt <= 10) begin
                $display("[ERROR ] index: %5d, D: %5d, Answer: %5d", o_idx, D_mem[o_idx], Ans_mem[o_idx]);
            end
        end
    end
    

    // Result
    if (err_cnt === 0) begin
        $display("%c[0;32m",27);
        $display("---- All passed. Congratulations! ----");
        $display("%c[0m",27);
        $display("Your score is %c[0;32m%4d%c[0m.", 27, 40 * (`N - err_cnt) / 1000, 27);
    end
    else begin
        $display("There are %5d errors.\n", err_cnt);
        $display("Your score is %c[0;31m%4d%c[0m.", 27, 40 * (`N - err_cnt) / 1000, 27);
    end
    
    $display("\n======================================");
    $display("Summary:");
    $display("--------------------------------------");
    $display(
        "Cycle           :%18.2F ns\nNumber of Cycles:%15d\nExecution Time  :%18.2F ns\nArea            :%15d\nArea x Time     :%18.2F",
        `CYCLE,
        i_cycle,
        i_cycle*`CYCLE,
        COA_num,
        COA_num * i_cycle*`CYCLE);
    $display("======================================\n");
    $finish;

end

always # (`HALF_CYCLE) begin
    clk = ~clk;
end

always @(posedge clk) begin
    i_cycle = i_cycle + 1;
    if (i_cycle >= `MAX_SIM_CYCLE) begin
        $display("Out of time!\n");
        $finish;
    end
end

endmodule
