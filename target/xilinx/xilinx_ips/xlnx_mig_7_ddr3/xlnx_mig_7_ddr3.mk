# Copyright 2024 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

ROOT_xlnx_mig_7_ddr3               := $(CHS_XIL_DIR)/xilinx_ips/xlnx_mig_7_ddr3 
ARTIFACTS_FILES_xlnx_mig_7_ddr3    := xlnx_mig_7_ddr3.mk tcl/run.tcl mig_genesys2.prj mig_kc705.prj mig_vc707.prj
ARTIFACTS_VARS_xlnx_mig_7_ddr3     := xilinx_part chs_xilinx_board xilinx_board_long
XILINX_USE_ARTIFACTS_xlnx_mig_7_ddr3  := 1
