#!/bin/bash
echo -e "\nDumping $1\n"

# extracting system and vendor imgs
unzip $1 system.transfer.list system.new.dat*
unzip $1 vendor.transfer.list vendor.new.dat*
brotli --decompress --output=system.new.dat system.new.dat.br
brotli --decompress --output=vendor.new.dat vendor.new.dat.br

# clone sdat2img
git clone https://github.com/xpirt/sdat2img

# making system and vendor imgs
python sdat2img/sdat2img.py system.transfer.list system.new.dat system.img
python sdat2img/sdat2img.py vendor.transfer.list vendor.new.dat vendor.img

# mount system and vendor
mkdir system/
sudo mount system.img system/
sudo mkdir system/vendor
sudo mount vendor.img system/vendor/

echo -e "\nDone!\n"
