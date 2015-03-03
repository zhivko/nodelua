#!/bin/bash -x
cd .output/eagle/release/image
esptool -eo eagle.app.v6.out -bo eagle.app.v6.flash.bin -bs .text -bs .data -bs .rodata -bc -ec
xtensa-lx106-elf-objcopy --only-section .irom0.text -O binary eagle.app.v6.out eagle.app.v6.irom0text.bin
cp eagle.app.v6.flash.bin ../bin/
cp eagle.app.v6.irom0text.bin ../bin/

python ../../../../../tools/esptool.py --port /dev/ttyUSB0 write_flash 0x00000 .output/eagle/release/bin/eagle.app.v6.flash.bin 0x40000 .output/eagle/release/bin/eagle.app.v6.irom0text.bin
