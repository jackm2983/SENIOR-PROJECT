FROM ryancramer22/carp-tools:latest
USER root
ENV PDK_ROOT=/foss/pdks
ENV PDK=sky130A
ENV PDKPATH=/foss/pdks/sky130A
ENV PATH=/foss/tools/bin:/foss/tools/sak:/usr/local/riscv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/foss/tools/klayout:/foss/tools/libman:/foss/tools/osic-multitool:/foss/tools/rftoolkit/bin:/foss/tools/yosys/bin
ENV XSCHEM_USER_LIBRARY_PATH=/home/ubuntu/workspace/MagicAndSpice/EE431_FinalProj
ENV HOME=/home/ubuntu

RUN apt-get update && apt-get install -y \
    nano \
    vim \
    python3-pip \
    python3-matplotlib \
    python3-numpy \
    python3-scipy \
    python3-pandas \
    vim-gtk3 xclip \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/pdk && \
    ln -sfn /foss/pdks/sky130A /usr/local/share/pdk/sky130A

RUN mkdir -p /home/ee431/workspace && \
    ln -sfn /home/ubuntu/workspace/MagicAndSpice /home/ee431/workspace/6SAR_CDAC

RUN mkdir -p /home/ee431/scripts && \
    mkdir -p /home/ee431/.xschem && \
    chown -R ubuntu:ubuntu /home/ee431

RUN echo 'set bell-style none' >> /root/.inputrc

COPY LVS /home/ee431/scripts/LVS
COPY LVS /usr/local/bin/LVS
COPY vimrc /home/ee431/.vimrc
COPY vimrc /home/ubuntu/.vimrc

RUN chmod +x /home/ee431/scripts/LVS /usr/local/bin/LVS && \
    chown ubuntu:ubuntu /home/ubuntu/.vimrc

RUN echo 'export PS1="\[\e[35m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ "' >> /home/ubuntu/.bashrc


RUN echo 'alias magic="magic -d XR -rcfile /foss/pdks/sky130A/libs.tech/magic/sky130A.magicrc"' >> /home/ubuntu/.bashrc

RUN sed -i '/run a command as administrator/d' /etc/bash.bashrc && \
    sed -i '/See.*sudo_root/d' /etc/bash.bashrc

USER ubuntu
WORKDIR /home/ubuntu/workspace
