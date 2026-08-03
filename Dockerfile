FROM ubuntu:latest 
LABEL MAINTAINER="networkmit"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    TZ=Europe/Amsterdam \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0

# 1. Double RUN ko theek kiya aur locales/tzdata package add kiya
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        locales \
        tzdata \
        bash \
        git \
        net-tools \
        xfce4 \
        xfce4-terminal \
        nano \
        nginx \
        gedit \
        novnc \
        tigervnc-standalone-server \
        vim-tiny \
        firefox \
    && locale-gen en_US.UTF-8 \
    && cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html \
    && echo "UI.connect()" >> /usr/share/novnc/app/ui.js \
    && sed -i 's/off/remote/g' /usr/share/novnc/app/ui.js \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# 2. Pehle folder create kiya taaki COPY fail na ho
RUN mkdir -p /root/.vnc

COPY code/xstartup /root/.vnc/xstartup
COPY code/start.sh /root/start.sh

# 3. Scripts ko executable permission di taaki VNC aur container bina kisi error ke start ho sakein
RUN chmod +x /root/.vnc/xstartup /root/start.sh

WORKDIR /root

EXPOSE 8080

CMD ["/root/start.sh"]