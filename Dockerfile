FROM ubuntu

RUN DEBIAN_FRONTEND=noninteractive bash -c 'apt-get update -qqy && apt-get dist-upgrade -qqy && apt-get install git curl build-essential gcc-arm-none-eabi libusb-dev gcc-avr sudo wget pkg-config libusb-1.0-0-dev rsync -qqy'
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

WORKDIR /opt

RUN git clone https://github.com/OpenAnnePro/qmk_firmware.git annepro-qmk --recursive --depth 1
RUN git clone https://github.com/OpenAnnePro/annepro2-shine.git --recursive
RUN git clone https://github.com/OpenAnnePro/AnnePro2-Tools.git

RUN cd /opt/annepro-qmk && ./util/qmk_install.sh

RUN mkdir /root/output

COPY entrypoint.sh /entrypoint.sh 
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
