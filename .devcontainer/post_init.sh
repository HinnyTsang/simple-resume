#!/bin/bash

# Intall typstsudo apt install fonts-roboto
sudo wget https://github.com/typst/typst/releases/download/v0.14.0/typst-x86_64-unknown-linux-musl.tar.xz
sudo tar -xvf typst-x86_64-unknown-linux-musl.tar.xz
sudo mv ./typst-x86_64-unknown-linux-musl/typst /usr/local/bin
sudo rm -rf typst-x86_64-unknown-linux-musl*

# Install fonts
sudo apt install -y \
    fonts-font-awesome \
    fonts-roboto \
    fontconfig

cd /tmp && \
    git clone https://github.com/adobe-fonts/source-sans && \
    sudo cp source-sans/OTF/*.otf /usr/share/fonts/ && \
    sudo fc-cache -f -v && \
    rm -rf source-sans

cd /tmp && \
    wget -q https://use.fontawesome.com/releases/v7.1.0/fontawesome-free-7.1.0-desktop.zip && \
    unzip -q fontawesome-free-7.1.0-desktop.zip && \
    sudo cp fontawesome-free-7.1.0-desktop/otfs/*.otf /usr/share/fonts/ && \
    sudo fc-cache -f