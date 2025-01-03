# ----------------------------------------------------------------------------------------------------
# Copyright (c) 2024 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------------------------

create_bd_design $module


create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e
set_property -dict [ list \
  CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS18} \
  CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS18} \
  CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
  CONFIG.PSU_BANK_3_IO_STANDARD {LVCMOS18} \
] [get_bd_cells zynq_ultra_ps_e]
set_property -dict [ list \
  CONFIG.PSU__DISPLAYPORT__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__DP__REF_CLK_SEL {Ref Clk3} \
  CONFIG.PSU__DP__LANE_SEL {Dual Lower} \
  CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {DPLL} \
  CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL} \
  CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {DPLL} \
  CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {DPLL} \
] [get_bd_cells zynq_ultra_ps_e]
set_property -dict [ list \
  CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {200} \
  CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {1} \
  CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
  CONFIG.PSU__SD0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__SD0__SLOT_TYPE {eMMC} \
  CONFIG.PSU__SD0__PERIPHERAL__IO {MIO 13 .. 22} \
  CONFIG.PSU__SD0__DATA_TRANSFER_MODE {8Bit} \
  CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__SD1__SLOT_TYPE {SD 2.0} \
  CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 46 .. 51} \
  CONFIG.PSU__SD1__GRP_CD__ENABLE {1} \
  CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 10 .. 11} \
  CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__UART0__PERIPHERAL__IO {MIO 38 .. 39} \
  CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__ENET0__GRP_MDIO__ENABLE {1} \
  CONFIG.PSU__ENET0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB__RESET__MODE {Disable} \
  CONFIG.PSU__USB1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB3_1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB0__REF_CLK_SEL {Ref Clk2} \
  CONFIG.PSU__USB0__REF_CLK_FREQ {100} \
  CONFIG.PSU__USB1__REF_CLK_SEL {Ref Clk2} \
  CONFIG.PSU__USB1__REF_CLK_FREQ {100} \
  CONFIG.PSU__FPGA_PL1_ENABLE {1} \
  CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {50} \
  CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__GPIO2_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU_MIO_12_PULLUPDOWN {disable} \
] [get_bd_cells zynq_ultra_ps_e]

if { $PS_DDR == "PS_D10H"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Disabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {32 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR == "PS_D11"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Disabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR == "PS_D12E"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Enabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR == "PS_D12"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Disabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR == "PS_D13E"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {16384 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {17} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Enabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

if { $PS_DDR == "PS_D13"} {
  set_property -dict [ list \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2400T} \
    CONFIG.PSU__DDRC__CWL {12} \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {16384 MBits} \
    CONFIG.PSU__DDRC__DRAM_WIDTH {16 Bits} \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {17} \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {1} \
    CONFIG.PSU__DDRC__ECC {Disabled} \
    CONFIG.PSU__DDRC__PARITY_ENABLE {1} \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  ] [get_bd_cells zynq_ultra_ps_e]
}

create_bd_cell -type ip -vlnv xilinx.com:ip:system_management_wiz system_management_wiz
set_property -dict [ list \
  CONFIG.TEMPERATURE_ALARM_OT_TRIGGER {85} \
  CONFIG.CHANNEL_ENABLE_VP_VN {false} \
] [get_bd_cells system_management_wiz]
set_property -dict [ list \
  CONFIG.PSU_MIO_13_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_14_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_15_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_16_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_17_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_18_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_19_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_20_PULLUPDOWN {disable} \
  CONFIG.PSU_MIO_21_PULLUPDOWN {disable} \
  CONFIG.PSU__SD0__PERIPHERAL__IO {MIO 13 .. 22} \
  CONFIG.PSU__SD0__DATA_TRANSFER_MODE {8Bit} \
  CONFIG.PSU__USE__IRQ0  {1} \
] [get_bd_cells zynq_ultra_ps_e]
set_property -dict [ list \
  CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__I2C1__PERIPHERAL__IO {EMIO} \
] [get_bd_cells zynq_ultra_ps_e]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio led
set_property -dict [ list \
  CONFIG.C_GPIO_WIDTH {3} \
  CONFIG.C_ALL_OUTPUTS {1} \
  CONFIG.C_DOUT_DEFAULT {0x00000007} \
] [get_bd_cells led]
set_property -dict [ list \
  CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB3_0__PERIPHERAL__IO {GT Lane2} \
] [get_bd_cells zynq_ultra_ps_e]

connect_bd_net [get_bd_pins zynq_ultra_ps_e/maxihpm0_lpd_aclk] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 ps_sys_rst
connect_bd_net [get_bd_pins ps_sys_rst/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
connect_bd_net [get_bd_pins ps_sys_rst/ext_reset_in] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]
connect_bd_net [get_bd_pins system_management_wiz/ip2intc_irpt] [get_bd_pins zynq_ultra_ps_e/pl_ps_irq0]
set IIC_FPGA [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_FPGA ]
connect_bd_intf_net [get_bd_intf_ports IIC_FPGA] [get_bd_intf_pins zynq_ultra_ps_e/IIC_1]

create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_00
set_property -dict [list CONFIG.NUM_MI {2} CONFIG.NUM_CLKS {1} CONFIG.NUM_SI {1}] [get_bd_cells smartconnect_00]
connect_bd_intf_net [get_bd_intf_pins zynq_ultra_ps_e/M_AXI_HPM0_LPD] [get_bd_intf_pins smartconnect_00/S00_AXI]
connect_bd_net [get_bd_pins zynq_ultra_ps_e/pl_clk0] [get_bd_pins smartconnect_00/aclk]
connect_bd_net [get_bd_pins ps_sys_rst/interconnect_aresetn] [get_bd_pins smartconnect_00/aresetn]
connect_bd_intf_net [get_bd_intf_pins smartconnect_00/M00_AXI ] [get_bd_intf_pins system_management_wiz/S_AXI_LITE]
connect_bd_intf_net [get_bd_intf_pins smartconnect_00/M01_AXI ] [get_bd_intf_pins led/S_AXI]

connect_bd_net [get_bd_pins ps_sys_rst/peripheral_aresetn] [get_bd_pins system_management_wiz/s_axi_aresetn]
connect_bd_net [get_bd_pins zynq_ultra_ps_e/pl_clk0] [get_bd_pins system_management_wiz/s_axi_aclk]
connect_bd_net [get_bd_pins ps_sys_rst/peripheral_aresetn] [get_bd_pins led/s_axi_aresetn]
connect_bd_net [get_bd_pins zynq_ultra_ps_e/pl_clk0] [get_bd_pins led/s_axi_aclk]

set DP_AUX_OUT [ create_bd_port -dir O DP_AUX_OUT]
connect_bd_net [get_bd_ports DP_AUX_OUT] [get_bd_pins zynq_ultra_ps_e/dp_aux_data_out]
set DP_AUX_OE [ create_bd_port -dir O DP_AUX_OE]
connect_bd_net [get_bd_ports DP_AUX_OE] [get_bd_pins zynq_ultra_ps_e/dp_aux_data_oe_n]
set DP_AUX_IN [ create_bd_port -dir I DP_AUX_IN]
connect_bd_net [get_bd_ports DP_AUX_IN] [get_bd_pins zynq_ultra_ps_e/dp_aux_data_in]
set DP_HPD [ create_bd_port -dir I DP_HPD]
connect_bd_net [get_bd_ports DP_HPD] [get_bd_pins zynq_ultra_ps_e/dp_hot_plug_detect]
set Clk100 [ create_bd_port -dir O -type clk Clk100]
connect_bd_net [get_bd_ports Clk100] [get_bd_pins zynq_ultra_ps_e/pl_clk0]
set Clk50 [ create_bd_port -dir O -type clk Clk50]
connect_bd_net [get_bd_ports Clk50] [get_bd_pins zynq_ultra_ps_e/pl_clk1]
set Rst_N [ create_bd_port -dir O -type rst Rst_N]
connect_bd_net [get_bd_ports Rst_N] [get_bd_pins zynq_ultra_ps_e/pl_resetn0]
set LED_N [ create_bd_port -dir O -from 2 -to 0 LED_N]
connect_bd_net [get_bd_ports LED_N] [get_bd_pins LED/gpio_io_o]
assign_bd_address
save_bd_design
validate_bd_design
save_bd_design
