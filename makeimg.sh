#!/bin/bash
#Cleanup before build

echo "Remove Any files"
cd ../../../rf-tools/AIK-Linux

sudo ./cleanup.sh

echo "Copy Ramdisk"

sudo cp -a ../../../rf-tools/ramdisk/ ../../../rf-tools/AIK-Linux/ramdisk

	
93ba4a5
echo "copy split-img"

sudo cp -a ../../../rf-tools/split_img/ ../../../rf-tools/AIK-Linux/split_img

echo "copy compiled zimage"

sudo cp ../../../arch/arm/boot/zImage ../../../rf-tools/AIK-Linux/split_img/boot.img-zImage

echo "copy compiled dtb"

sudo cp ../../../boot.img-dtb ../../../rf-tools/AIK-Linux/split_img/boot.img-dtb

echo "packing image"

sudo ./repackimg.sh

echo "Copy boot.img"

sudo cp ../../../rf-tools/AIK-Linux/image-new.img ../../../rf-tools/out/boot.img

echo "Cleanup after packing"

cd ../../../rf-tools/AIK-Linux

sudo ./cleanup.sh

echo "boot.img saved to /rf-tools/out"
