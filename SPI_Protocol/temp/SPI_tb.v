#! /usr/bin/vvp
:ivl_version "10.3 (stable)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x55d6be41f350 .scope module, "SPI_Master" "SPI_Master" 2 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /INPUT 1 "rst"
    .port_info 2 /INPUT 1 "enable"
    .port_info 3 /INPUT 32 "data_out"
    .port_info 4 /INPUT 8 "commands"
    .port_info 5 /INPUT 24 "Address"
    .port_info 6 /OUTPUT 1 "CS"
    .port_info 7 /OUTPUT 1 "SCLK"
    .port_info 8 /OUTPUT 1 "MOSI"
    .port_info 9 /OUTPUT 1 "MISO"
P_0x55d6be41f4d0 .param/l "IDLE" 0 2 13, C4<00>;
P_0x55d6be41f510 .param/l "START" 0 2 14, C4<01>;
P_0x55d6be41f550 .param/l "STOP" 0 2 16, C4<11>;
P_0x55d6be41f590 .param/l "TRANSFER" 0 2 15, C4<10>;
o0x7f30d4e0a018 .functor BUFZ 24, C4<zzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55d6be3dd3c0_0 .net "Address", 23 0, o0x7f30d4e0a018;  0 drivers
v0x55d6be436f00_0 .var "CS", 0 0;
v0x55d6be436fc0_0 .var "MISO", 0 0;
v0x55d6be437090_0 .var "MOSI", 0 0;
v0x55d6be437150_0 .var "SCLK", 0 0;
v0x55d6be437210_0 .var "Slave_reg", 31 0;
o0x7f30d4e0a138 .functor BUFZ 1, C4<z>; HiZ drive
v0x55d6be4372f0_0 .net "clk", 0 0, o0x7f30d4e0a138;  0 drivers
v0x55d6be4373b0_0 .var "clk_count", 1 0;
o0x7f30d4e0a198 .functor BUFZ 8, C4<zzzzzzzz>; HiZ drive
v0x55d6be437490_0 .net "commands", 7 0, o0x7f30d4e0a198;  0 drivers
v0x55d6be437570_0 .var "current_state", 1 0;
o0x7f30d4e0a1f8 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x55d6be437650_0 .net "data_out", 31 0, o0x7f30d4e0a1f8;  0 drivers
o0x7f30d4e0a228 .functor BUFZ 1, C4<z>; HiZ drive
v0x55d6be437730_0 .net "enable", 0 0, o0x7f30d4e0a228;  0 drivers
v0x55d6be4377f0_0 .var/i "i", 31 0;
v0x55d6be4378d0_0 .var "next_state", 1 0;
o0x7f30d4e0a2b8 .functor BUFZ 1, C4<z>; HiZ drive
v0x55d6be4379b0_0 .net "rst", 0 0, o0x7f30d4e0a2b8;  0 drivers
v0x55d6be437a70_0 .var "shift_count", 5 0;
v0x55d6be437b50_0 .var "shift_reg", 31 0;
v0x55d6be437d40_0 .var/i "z", 31 0;
E_0x55d6be3dd910/0 .event edge, v0x55d6be437570_0, v0x55d6be437730_0, v0x55d6be4372f0_0, v0x55d6be3dd3c0_0;
E_0x55d6be3dd910/1 .event edge, v0x55d6be437490_0, v0x55d6be437150_0, v0x55d6be4377f0_0, v0x55d6be437b50_0;
E_0x55d6be3dd910/2 .event edge, v0x55d6be437090_0, v0x55d6be437210_0, v0x55d6be437a70_0, v0x55d6be437650_0;
E_0x55d6be3dd910/3 .event edge, v0x55d6be437d40_0;
E_0x55d6be3dd910 .event/or E_0x55d6be3dd910/0, E_0x55d6be3dd910/1, E_0x55d6be3dd910/2, E_0x55d6be3dd910/3;
E_0x55d6be414f10 .event posedge, v0x55d6be4372f0_0;
S_0x55d6be3dd1b0 .scope module, "clock_divider" "clock_divider" 3 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /INPUT 1 "rst"
    .port_info 2 /OUTPUT 1 "SCLK_2"
    .port_info 3 /OUTPUT 1 "SCLK_4"
v0x55d6be438000_0 .var "SCLK_2", 0 0;
v0x55d6be4380e0_0 .var "SCLK_4", 0 0;
o0x7f30d4e0a5b8 .functor BUFZ 1, C4<z>; HiZ drive
v0x55d6be4381a0_0 .net "clk", 0 0, o0x7f30d4e0a5b8;  0 drivers
v0x55d6be438240_0 .var "clk_count", 1 0;
o0x7f30d4e0a618 .functor BUFZ 1, C4<z>; HiZ drive
v0x55d6be438320_0 .net "rst", 0 0, o0x7f30d4e0a618;  0 drivers
E_0x55d6be414aa0 .event posedge, v0x55d6be438320_0, v0x55d6be4381a0_0;
    .scope S_0x55d6be41f350;
T_0 ;
    %pushi/vec4 3, 0, 2;
    %store/vec4 v0x55d6be4373b0_0, 0, 2;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be437b50_0, 0, 32;
    %pushi/vec4 0, 0, 6;
    %store/vec4 v0x55d6be437a70_0, 0, 6;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be437210_0, 0, 32;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be4377f0_0, 0, 32;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be437d40_0, 0, 32;
    %end;
    .thread T_0;
    .scope S_0x55d6be41f350;
T_1 ;
    %wait E_0x55d6be414f10;
    %load/vec4 v0x55d6be4379b0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.0, 8;
    %pushi/vec4 0, 0, 2;
    %assign/vec4 v0x55d6be437570_0, 0;
    %jmp T_1.1;
T_1.0 ;
    %load/vec4 v0x55d6be4378d0_0;
    %store/vec4 v0x55d6be437570_0, 0, 2;
    %load/vec4 v0x55d6be4373b0_0;
    %addi 1, 0, 2;
    %store/vec4 v0x55d6be4373b0_0, 0, 2;
    %load/vec4 v0x55d6be4373b0_0;
    %parti/s 1, 0, 2;
    %inv;
    %store/vec4 v0x55d6be437150_0, 0, 1;
T_1.1 ;
    %jmp T_1;
    .thread T_1;
    .scope S_0x55d6be41f350;
T_2 ;
    %wait E_0x55d6be3dd910;
    %load/vec4 v0x55d6be437570_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 2;
    %cmp/u;
    %jmp/1 T_2.0, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 2;
    %cmp/u;
    %jmp/1 T_2.1, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 2;
    %cmp/u;
    %jmp/1 T_2.2, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 2;
    %cmp/u;
    %jmp/1 T_2.3, 6;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v0x55d6be4378d0_0, 0, 2;
    %jmp T_2.5;
T_2.0 ;
    %load/vec4 v0x55d6be437730_0;
    %flag_set/vec4 8;
    %jmp/0 T_2.6, 8;
    %pushi/vec4 1, 0, 2;
    %jmp/1 T_2.7, 8;
T_2.6 ; End of true expr.
    %pushi/vec4 0, 0, 2;
    %jmp/0 T_2.7, 8;
 ; End of false expr.
    %blend;
T_2.7;
    %store/vec4 v0x55d6be4378d0_0, 0, 2;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55d6be436f00_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55d6be437150_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55d6be436fc0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55d6be437090_0, 0, 1;
    %pushi/vec4 0, 0, 6;
    %store/vec4 v0x55d6be437a70_0, 0, 6;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be437b50_0, 0, 32;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be437210_0, 0, 32;
    %load/vec4 v0x55d6be4372f0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.8, 8;
    %load/vec4 v0x55d6be3dd3c0_0;
    %load/vec4 v0x55d6be437490_0;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v0x55d6be437b50_0, 0, 32;
T_2.8 ;
    %jmp T_2.5;
T_2.1 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55d6be436f00_0, 0, 1;
    %load/vec4 v0x55d6be437150_0;
    %nor/r;
    %load/vec4 v0x55d6be4372f0_0;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.10, 8;
    %load/vec4 v0x55d6be437b50_0;
    %load/vec4 v0x55d6be4377f0_0;
    %part/s 1;
    %store/vec4 v0x55d6be437090_0, 0, 1;
    %load/vec4 v0x55d6be437090_0;
    %load/vec4 v0x55d6be437210_0;
    %parti/s 31, 1, 2;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v0x55d6be437210_0, 0, 32;
    %load/vec4 v0x55d6be437a70_0;
    %addi 1, 0, 6;
    %store/vec4 v0x55d6be437a70_0, 0, 6;
    %load/vec4 v0x55d6be4377f0_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55d6be4377f0_0, 0, 32;
T_2.10 ;
    %load/vec4 v0x55d6be437a70_0;
    %pad/u 32;
    %cmpi/e 32, 0, 32;
    %jmp/0xz  T_2.12, 4;
    %pushi/vec4 0, 0, 6;
    %store/vec4 v0x55d6be437a70_0, 0, 6;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be4377f0_0, 0, 32;
    %pushi/vec4 2, 0, 2;
    %store/vec4 v0x55d6be4378d0_0, 0, 2;
T_2.12 ;
    %jmp T_2.5;
T_2.2 ;
    %load/vec4 v0x55d6be4372f0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.14, 8;
    %load/vec4 v0x55d6be437650_0;
    %store/vec4 v0x55d6be437b50_0, 0, 32;
T_2.14 ;
    %load/vec4 v0x55d6be437490_0;
    %cmpi/e 0, 0, 8;
    %jmp/0xz  T_2.16, 4;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x55d6be436fc0_0, 0, 1;
    %jmp T_2.17;
T_2.16 ;
    %load/vec4 v0x55d6be437490_0;
    %cmpi/e 105, 0, 8;
    %jmp/0xz  T_2.18, 4;
    %load/vec4 v0x55d6be437150_0;
    %nor/r;
    %load/vec4 v0x55d6be4372f0_0;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.20, 8;
    %load/vec4 v0x55d6be437b50_0;
    %load/vec4 v0x55d6be437d40_0;
    %part/s 1;
    %store/vec4 v0x55d6be437090_0, 0, 1;
    %load/vec4 v0x55d6be437090_0;
    %load/vec4 v0x55d6be437210_0;
    %parti/s 31, 1, 2;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v0x55d6be437210_0, 0, 32;
    %load/vec4 v0x55d6be437a70_0;
    %addi 1, 0, 6;
    %store/vec4 v0x55d6be437a70_0, 0, 6;
    %load/vec4 v0x55d6be437d40_0;
    %addi 1, 0, 32;
    %store/vec4 v0x55d6be437d40_0, 0, 32;
    %load/vec4 v0x55d6be437a70_0;
    %pad/u 32;
    %cmpi/e 32, 0, 32;
    %jmp/0xz  T_2.22, 4;
    %pushi/vec4 0, 0, 6;
    %store/vec4 v0x55d6be437a70_0, 0, 6;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x55d6be437d40_0, 0, 32;
    %pushi/vec4 3, 0, 2;
    %store/vec4 v0x55d6be4378d0_0, 0, 2;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55d6be437150_0, 0, 1;
    %jmp T_2.23;
T_2.22 ;
    %load/vec4 v0x55d6be437570_0;
    %store/vec4 v0x55d6be4378d0_0, 0, 2;
T_2.23 ;
T_2.20 ;
T_2.18 ;
T_2.17 ;
    %jmp T_2.5;
T_2.3 ;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v0x55d6be4378d0_0, 0, 2;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55d6be437150_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x55d6be436f00_0, 0, 1;
    %jmp T_2.5;
T_2.5 ;
    %pop/vec4 1;
    %jmp T_2;
    .thread T_2, $push;
    .scope S_0x55d6be3dd1b0;
T_3 ;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v0x55d6be438240_0, 0, 2;
    %end;
    .thread T_3;
    .scope S_0x55d6be3dd1b0;
T_4 ;
    %wait E_0x55d6be414aa0;
    %load/vec4 v0x55d6be438320_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_4.0, 8;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v0x55d6be438000_0, 0;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v0x55d6be4380e0_0, 0;
    %jmp T_4.1;
T_4.0 ;
    %load/vec4 v0x55d6be438240_0;
    %addi 1, 0, 2;
    %assign/vec4 v0x55d6be438240_0, 0;
T_4.1 ;
    %load/vec4 v0x55d6be438240_0;
    %parti/s 1, 0, 2;
    %store/vec4 v0x55d6be438000_0, 0, 1;
    %load/vec4 v0x55d6be438240_0;
    %parti/s 1, 1, 2;
    %store/vec4 v0x55d6be4380e0_0, 0, 1;
    %jmp T_4;
    .thread T_4;
# The file index is used to find the file name in the following table.
:file_names 4;
    "N/A";
    "<interactive>";
    "/home/zain/Desktop/Verilog_Practice/SPI_Protocol/SPI/src/SPI.v";
    "/home/zain/Desktop/Verilog_Practice/SPI_Protocol/SPI/src/clock.v";
