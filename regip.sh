#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/kuhing/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/kuhing/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/kuhing/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)

mkdir /etc/github > /dev/null 2>&1

sleep 2
echo "lailafauziyah00@gmail.com" > /etc/github/email
echo "kuhing" > /etc/github/username
echo "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" > /etc/github/api
clear

function add_ip(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/tarap
sleep 1
REQIP=$(curl -sS https://raw.githubusercontent.com/${USERGIT}/ip/main/vps | awk '{print $4}' | grep $MYIP)
if [[ $MYIP = $REQIP ]]; then
echo -e "$COLOR1 ${NC}  [INFO] VPS IP Already Registered!!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
fi
exp=$(date -d "1 days" +"%Y-%m-%d")
hariini=$(date -d "0 days" +"%Y-%m-%d")
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/vps.git &> /dev/null
cd /root/tarap/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ipvps &> /dev/null
echo "### Trial $exp $daftar" >>/root/tarap/vps
git add .
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/vps.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/vps.git &> /dev/null
sleep 1
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Daftar IP Trial Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Client Name   : Trial"
echo -e "$COLOR1 ${NC}  IP VPS        : $MYIP"
echo -e "$COLOR1 ${NC}  Register Date : $hariini"
echo -e "$COLOR1 ${NC}  Expired Date  : $exp"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
}
cd
rm -rf /root/tarap
