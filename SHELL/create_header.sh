#!/bin/bash

sopc-create-header-files ../SoC/soc_system.sopcinfo --single "./hps_soc_system.h" --module hps_0
# copy to the C folder
cp ./hps_soc_system.h "D:\GDrive\WORKSPACES\DS5_2019\ultrasound_2019_pcb_v2\soc_variables\soc_system.h"
