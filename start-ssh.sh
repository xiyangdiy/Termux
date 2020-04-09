#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage

print_info(){
    clear
    echo "####################################"
    echo "#                                  #"
    echo "#        Termux一键安装SSH         #"
    echo "#                                  #"
    echo "####################################"
    echo 
}

print_warn(){
    echo "Termux只支持使用秘钥验证登陆SSH！"
}

main_menu(){
echo "
 1.未拥有秘钥
 2.已拥有秘钥
 3.退出
"

read -p "请输入数字 [1-3]:" num
case "$num" in
	1)
	linux_ssh
	;;
	2)
	termux_ssh
	;;
	3)
	exit 1
	;;
	*)
	clear
	echo 
	echo "请输入正确数字！"
	sleep 3s
	clear
	echo 
	print_warn
	main_menu
	;;
esac
}

start_menu(){
clear
echo 
echo "本脚本支持使用来源于AnLinux.apk仪表盘的Linux生成秘钥"
echo 
echo "本脚本支持使用来源于魔改版UTermux.apk"
echo "常用功能--更多linux--安装其他发行版的Linux生成秘钥"
echo 
echo "且仅支持以下发行版的Linux，并确保至少已安装一种"
echo "
 1.Ubuntu
 2.Debian
 3.Kali
 4.BackBox
 5.Fedora
 6.CentOS
 7.Arch Linux
 8.Black Arch
 9.退出
"

read -p "请选择已安装的Linux [1-9]:" num
case "$num" in
	1)
	system="ubuntu"
	cur_ssh="wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Apt/ssh-apt.sh && bash ssh-apt.sh"
	;;
	2)
	system="debian"
	cur_ssh="wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Apt/ssh-apt.sh && bash ssh-apt.sh"
	;;
	3)
	system="kali"
	cur_ssh="wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Apt/ssh-apt.sh && bash ssh-apt.sh"
	;;
	4)
	system="backbox"
	cur_ssh="wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Apt/ssh-apt.sh && bash ssh-apt.sh"
	;;
	5)
	system="fedora"
	cur_ssh="yum install wget -y && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Yum/ssh-yum.sh && bash ssh-yum.sh"
	;;
	6)
	system="centos"
	cur_ssh="yum install wget -y && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Yum/ssh-yum.sh && bash ssh-yum.sh"
	;;
	7)
	system="arch"
	cur_ssh="pacman -Sy --noconfirm wget && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Pacman/ssh-pac.sh && bash ssh-pac.sh"
	;;
	8)
	system="arch"
	cur_ssh="pacman -Sy --noconfirm wget && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/SSH/Pacman/ssh-pac.sh && bash ssh-pac.sh"
	;;
	9)
	exit 1
	;;
	*)
	clear
	echo 
	echo "请输入正确数字！"
	sleep 3s
	clear
	linux_ssh
	;;
esac
}

check_system(){
    if [ ! -d "/data/data/com.termux/files/home/${system}-fs" ]; then
    echo 
    echo -e "${system}未安装！"
    echo 
    echo -e "请重新选择！"
    sleep 3s
    clear
    linux_ssh
    else
    echo -e "${system}已安装！"
    fi
}

mount_sdcard(){
    sed -i 's:#command+=" -b /sdcard":command+=" -b /sdcard":g' start-${system}.sh
   
}

make_ssh(){
    if [ -f "/data/data/com.termux/files/home/make-ssh.sh" ];then
    rm -f make-ssh.sh
    fi
    bin=make-ssh.sh
    cat > $bin <<- EOM
#!/bin/bash
rm -f ssh-apt.sh
${cur_ssh}
clear
echo 
echo "请回车键默认保存位置"
echo 
ssh-keygen
cp -r /root/.ssh/* /sdcard/Key
clear
echo 
echo ​"​请在Termux终端再次执行安装命令"​
echo 
EOM
    chmod 777 make-ssh.sh
}

move_ssh(){
mv -f make-ssh.sh /data/data/com.termux/files/home/${system}-fs/root/make-ssh.sh
}

check_ssh(){
    if [ -f "/data/data/com.termux/files/home/${system}-fs/root/make-ssh.sh" ]; then
    rm -f make-ssh.sh
    echo 
    echo "请确保在Linux中已执行 bash make-ssh.sh"
    echo 
    read -p ​"​请确认是否继续 ? [Y/n] :​"​ yn
    case "$yn" in
    Y)
    ;;
    y)
    ;;
    Yes)
    ;;
    yes)
    ;;
    *)
    exit 0
    ;;
    esac
    else
    move_ssh
    echo "请进入${system}执行 bash make-ssh.sh"
    echo 
read -p ​"​请确认是否直接进入 ${system}? [Y/n] :​"​ yn
case "$yn" in
    Y)
    bash start-${system}.sh
    ;;
    y)
    bash start-${system}.sh
    ;;
    Yes)
    bash start-${system}.sh
    ;; 
    yes)
    bash start-${system}.sh
    ;;
    *)
    exit 0
    ;;
esac    
    exit 0
    fi
}

check_key(){
    echo 
    echo "请将 公钥.pub 复制到 /sdcard/Key 文件夹，并重命名为 id_rsa.pub"
    echo 
    read -p ​"​请确认是否继续 ? [Y/n] :​"​ yn
    case "$yn" in
    Y)
    ;;
    y)
    ;;
    Yes)
    ;;
    yes)
    ;;
    *)
    exit 0
    ;;
    esac
    if [ -f "/sdcard/Key/id_rsa.pub" ]; then
    echo 
    echo "公钥已在指定位置！"
    echo 
    else
    clear
    echo "公钥 id_rsa.pub 未在指定位置！"
    sleep 3s
    clear
    termux_ssh
    fi
}
    
install_openssh(){
    apt update
    apt install openssh
}

add_key(){
    cat /sdcard/Key/id_rsa.pub >> /data/data/com.termux/files/home/.ssh/authorized_keys
}

start_sshd(){
    sshd
}

print_ssh_info1(){
    clear
    echo -e "用户名：任意数字字母"
    echo -e "IP地址：127.0.0.1"
    echo -e "端口：8022"
    echo -e "秘钥：/sdcard/Key/id_rsa"
}

print_ssh_info2(){
    clear
    echo -e "用户名：任意数字字母"
    echo -e "IP地址：127.0.0.1"
    echo -e "端口：8022"
    echo -e "秘钥：私钥"
}

linux_ssh(){
start_menu
check_system
mount_sdcard
make_ssh
check_ssh
install_openssh
add_key
start_sshd
print_ssh_info1
exit 0
}

termux_ssh(){
check_key
install_openssh
add_key
start_sshd
print_ssh_info2
exit 0
}

print_info
print_warn
main_menu
