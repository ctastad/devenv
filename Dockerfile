# Use an Ubuntu base image
ARG BASE_IMAGE=ubuntu:latest 
FROM ${BASE_IMAGE}

# Install system dependencies and add PPAs in one RUN command
RUN apt-get update && apt-get install -y software-properties-common \
    && add-apt-repository ppa:neovim-ppa/unstable \
    && apt-get install -y \
        git \
        curl \
        python3 \
        nodejs \
        npm \
        cargo \
        neovim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
    && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    && tar xf lazygit.tar.gz lazygit \
    && mv lazygit /usr/local/bin/ \
    && rm lazygit.tar.gz

## Add a non-root user
#RUN useradd -m c
#USER c
#WORKDIR /home/c

# Clone AstroNvim
RUN git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ctastad/.dotfiles.git tmpdotfiles \
    && mkdir -p ~/.config \
    && cp -r tmpdotfiles/.config/nvim ~/.config/nvim \
    && rm -r tmpdotfiles
