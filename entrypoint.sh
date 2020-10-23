#!/bin/bash

cd /opt/AnnePro2-Tools/ && git fetch --all && git reset --hard
cd /opt/annepro2-shine/ && git fetch --all && git reset --hard
cd /opt/annepro-qmk/    && git fetch --all && git reset --hard

if [[ -d /opt/customization/ ]]
then
    rsync -avz /opt/customization/ /opt/annepro-qmk/
else
    echo "[*] Customization dir not present!"
fi

cd /opt/AnnePro2-Tools/ && source $HOME/.cargo/env && cargo build --release
cd /opt/annepro2-shine/ && make C18
cd /opt/annepro-qmk/    && make annepro2/c18

cp /opt/AnnePro2-Tools/target/release/annepro2_tools /root/output/
cp /opt/annepro2-shine/build/*.bin /root/output/
cp /opt/annepro-qmk/*.bin /root/output/
