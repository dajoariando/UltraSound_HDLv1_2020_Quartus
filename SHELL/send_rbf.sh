#!/bin/bash

C:/intelFPGA/17.1/quartus/bin64/quartus_cpf.exe -c ../SoC/output_files/DE10_Standard_GHRD.sof -o bitstream_compression=on soc_system.rbf


# ssh root@129.22.143.84 "mount /dev/mmcblk0p1 /media/sdcard"

scp ./soc_system.rbf root@192.168.100.5:/root/bootdir/soc_system.rbf
