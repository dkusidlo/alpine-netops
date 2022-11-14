FROM alpine:3.16.3

RUN set -ex && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
    bind-tools \
    conntrack-tools \
    curl \
    fping \
    git \
    htop \
    iperf3 \
    iproute2 \
    ipset \
    iputils \
    jq \
    net-tools \
    nmap \
    nmap-ncat \
    nmap-scripts \
    openssh \
    openssl \
    tcpdump \
    vim \
    zsh

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
COPY configs/zshrc .zshrc

CMD ["zsh"]
