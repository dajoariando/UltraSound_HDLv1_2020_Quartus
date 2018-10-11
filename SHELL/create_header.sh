#!/bin/bash

sopc-create-header-files ../SoC/soc_system.sopcinfo --single "./hps_soc_system.h" --module hps_0
# copy to the C folder
cp ./hps_soc_system.h "D:\GDrive\DS5_Workspace\de10-standard_test\soc_variables\soc_system.h"
