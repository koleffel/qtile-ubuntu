#!/bin/bash
# Update system
sudo apt-get update

# Install core dependencies
sudo apt-get install -y python3-cffi libpangocairo-1.0-0 --reinstall

#Your distribution is trying to protect you against mixing apt provided packages and pip provided packages. Mixing two package #managers (apt and pip here) is always a bad idea and the source of many issues.
# so in order to work you need to install full version of python3-full and/or extra argument "--break-system-packages" at the end of #line

#We are installing the full python package 
sudo apt install python3-full -y

# the current version on git doesn't require you to install xcffib and cairocffi beforehands anymore
# but we will install them anyway :) you can remove them if you dont want them

# Install xcffib with pip
pip3 install xcffib==0.12.1 --break-system-packages

# Install cairocffi with pip

pip3 install --no-cache-dir --no-build-isolation cairocffi==1.4.0 --break-system-packages

# Install Qtile from GIT version or ...
#pip3 install qtile==0.22.1 --force-reinstall --break-system-packages
pip3 install git+https://github.com/qtile/qtile --break-system-packages


# Create a desktop entry for Qtile
echo "[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=qtile start
Type=Application
Keywords=wm;tiling" | sudo tee /usr/share/xsessions/qtile.desktop

echo "Qtile installation completed successfully. You can select Qtile from your session manager."
