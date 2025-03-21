#!/bin/bash

# ✅ Colors
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESET="\e[0m"

# ✅ Stylish Header
clear
echo -e "${MAGENTA}======================================="
echo -e "     🔥 ${CYAN}EgaleX5 - Instaforce Setup 🔥${MAGENTA}"
echo -e "=======================================${RESET}"

# ✅ Updating & Installing Packages with Animation
echo -ne "${YELLOW}[+] Updating package lists... ${RESET}"
pkg update -y &> /dev/null && pkg upgrade -y &> /dev/null
echo -e "${GREEN}✅ Done!${RESET}"

echo -ne "${YELLOW}[+] Installing required Termux packages... ${RESET}"
pkg install -y python tor &> /dev/null
echo -e "${GREEN}✅ Installed!${RESET}"

# ✅ Installing Python Libraries
echo -ne "${YELLOW}[+] Installing Python Libraries... ${RESET}"
pip install requests pysocks stem colorama &> /dev/null
echo -e "${GREEN}✅ Done!${RESET}"

# ✅ Configuring TOR (Optional)
echo -ne "${YELLOW}[+] Configuring TOR... ${RESET}"
mkdir -p ~/.config/tor &> /dev/null
echo "ControlPort 9051" > ~/.config/tor/torrc
echo "HashedControlPassword 16:your_hashed_password_here" >> ~/.config/tor/torrc
echo -e "${GREEN}✅ Configured!${RESET}"

# ✅ Completion Message
echo -e "\n${MAGENTA}[✔] ${CYAN}Setup Complete! Run '${GREEN}python brute${CYAN}' to start.${RESET}"
