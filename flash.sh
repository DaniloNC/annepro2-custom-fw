#!/bin/bash

if [[ ! -f output/annepro2_tools ]]
then
    echo "annepro2_tools not found, try building with ./build.sh"
    exit 1
fi

if [[ ! -f output/annepro2_c18_danilonc.bin ]]
then
    echo "annepro2_c18_danilonc.bin not found, try building with ./build.sh"
fi 

echo "[*] This script will install the custom firmware and anne-pro shine firmware."
echo "Press enter to start the process, you will have 10 seconds to put the device in APU mode"

read a
sleep 10

./output/annepro2_tools ./output/annepro2_c18_danilonc.bin
./output/annepro2_tools -t led ./output/annepro2-shine-C18.bin

echo "[*] Completed"
