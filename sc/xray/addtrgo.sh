#!/bin/bash
clear
exitsc="\033[0m"
y="\033[1;93m"
j="\033[0;33m"
function lane() {
echo -e "${y}────────────────────────────────────────────${exitsc}"
}
url_izin="https://raw.githubusercontent.com/Farukbrowser/izinsc/main/ip"
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
useexp=$(wget -qO- $url_izin | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
lane
echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          ${exitsc}"
lane
echo -e ""
echo -e "            \033[0;35mPERMISSION DENIED !${exitsc}"
echo -e "   ${j}Your VPS${exitsc} $ipsaya ${j}Has been Banned${exitsc}"
echo -e "     ${j}Buy access permissions for scripts${exitsc}"
echo -e "             ${j}Contact Admin :${exitsc}"
echo -e "      \033[0;36mWhatsapp${exitsc} wa.me/6285935195701"
lane
exit
fi
}
checking_sc
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/xdxl/ipvps.conf
domain=$(cat /etc/xray/domain)
trgo="$(cat ~/log-install.txt | grep -w "Trojan Go" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
clear
echo -e "===============[ Add Title Account ]=============="
echo -e ""
		read -rp "Username : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
            echo -e "======================================"
			echo ""
			echo -e "Nama Sudah ada, Silahkan Ganti dengan username lain !!"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "masa aktif : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan-go://${uuid}@isi_bug_disini:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=%2Ftrojango#$user"
link1="trojan://${uuid}@${domain}:2087/?sni=${domain}&type=ws&host=${domain}&path=%2Ftrojan-go#$user"
clear
echo -e "===============[ TROJAN GO ]=============="
echo -e "Username   : ${user}" | tee -a /etc/log-create-user.log
echo -e "Domain     : ${domain}" | tee -a /etc/log-create-user.log
echo -e "Port       : 2087" | tee -a /etc/log-create-user.log
echo -e "Uuid       : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Encryption : none" | tee -a /etc/log-create-user.log
echo -e "Path       : /trojan-go" | tee -a /etc/log-create-user.log
echo -e "Created On : $hariini" | tee -a /etc/log-create-user.log
echo -e "Expired On : $exp" | tee -a /etc/log-create-user.log
echo -e "===============" | tee -a /etc/log-create-user.log
echo -e "Link TrGO : ${link1}" | tee -a /etc/log-create-user.log
echo -e "===============" | tee -a /etc/log-create-user.log
