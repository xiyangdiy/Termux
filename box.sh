#!/data/data/com.termux/files/usr/bin/bash

main_menu(){
    clear
    echo "####################################"
    echo "#                                  #"
    echo "#           Termux工具箱           #"
    echo "#                                  #"
    echo "####################################"
    
echo "
 1.Termux更换软件源
 2.Nextcloud私人云盘
 9.退出
"

read -p "请输入数字：" num
    case "$num" in
    1)
    change_source
    ;;
    2)
    install_nextcloud
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
	echo 
	main_menu
	;;
    esac
}

change_source(){
clear
echo 
echo "Termux换源"
echo "
 1.官方源
 2.清华源
 3.返回
"

read -p "请输入数学：" num
    case "$num" in
    1)
    txt=$(grep "deb https://termux.org/packages/ stable main" $PREFIX/etc/apt/sources.list)
    if [ "${txt}" == "#deb https://termux.org/packages/ stable main" ];then
        sed -i 's!#deb https://termux.org/packages/ stable main!deb https://termux.org/packages/ stable main!g' $PREFIX/etc/apt/sources.list
    fi
    txt=$(grep "deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main" $PREFIX/etc/apt/sources.list)
    if [ "${txt}" == "deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main" ];then
        sed -i 's!deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main!#deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main!g' $PREFIX/etc/apt/sources.list
    fi
    
    txt=$(grep "deb https://dl.bintray.com/grimler/game-packages-24 games stable" $PREFIX/etc/apt/sources.list.d/game.list)
    if [ "${txt}" == "#deb https://dl.bintray.com/grimler/game-packages-24 games stable" ];then
        sed -i 's!#deb https://dl.bintray.com/grimler/game-packages-24 games stable!deb https://dl.bintray.com/grimler/game-packages-24 games stable!g' $PREFIX/etc/apt/sources.list.d/game.list
    fi
    txt=$(grep "deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable" $PREFIX/etc/apt/sources.list.d/game.list)
    if [ "${txt}" == "deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable" ];then
        sed -i 's!deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable!#deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable!g' $PREFIX/etc/apt/sources.list.d/game.list
    fi
    
    txt=$(grep "deb https://dl.bintray.com/grimler/science-packages-24 science stable" $PREFIX/etc/apt/sources.list.d/science.list)
    if [ "${txt}" == "#deb https://dl.bintray.com/grimler/science-packages-24 science stable" ];then
        sed -i 's!#deb https://dl.bintray.com/grimler/science-packages-24 science stable!deb https://dl.bintray.com/grimler/science-packages-24 science stable!g' $PREFIX/etc/apt/sources.list.d/science.list
    fi
    txt=$(grep "deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable" $PREFIX/etc/apt/sources.list.d/science.list)
    if [ "${txt}" == "deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable" ];then
        sed -i 's!deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable!#deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable!g' $PREFIX/etc/apt/sources.list.d/science.list
    fi
    pkg update && apt upgrade
    clear
	echo 
	echo "已更换为官方源"
	sleep 3s
	clear
	echo 
    change_source
    ;;
    2)
    txt=$(grep "deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main" $PREFIX/etc/apt/sources.list)
    if [ "${txt}" == "" ];then
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main" >> $PREFIX/etc/apt/sources.list
        elif [ "${txt}" == "#deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main" ];then
            sed -i 's!#deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main!deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main!g' $PREFIX/etc/apt/sources.list
    fi
    txt=$(grep "deb https://termux.org/packages/ stable main" $PREFIX/etc/apt/sources.list)
    if [ "${txt}" == "deb https://termux.org/packages/ stable main" ];then
        sed -i 's!deb https://termux.org/packages/ stable main!#deb https://termux.org/packages/ stable main!g' $PREFIX/etc/apt/sources.list
    fi
    
    txt=$(grep "deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable" $PREFIX/etc/apt/sources.list.d/game.list)
    if [ "${txt}" == "" ];then
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable" >> $PREFIX/etc/apt/sources.list.d/game.list
        elif [ "${txt}" == "#deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable" ];then
            sed -i 's!#deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable!deb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable!g' $PREFIX/etc/apt/sources.list.d/game.list
    fi
    txt=$(grep "deb https://dl.bintray.com/grimler/game-packages-24 games stable" $PREFIX/etc/apt/sources.list.d/game.list)
    if [ "${txt}" == "deb https://dl.bintray.com/grimler/game-packages-24 games stable" ];then
        sed -i 's!deb https://dl.bintray.com/grimler/game-packages-24 games stable!#deb https://dl.bintray.com/grimler/game-packages-24 games stable!g' $PREFIX/etc/apt/sources.list.d/game.list
    fi
    
    txt=$(grep "deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable" $PREFIX/etc/apt/sources.list.d/science.list)
    if [ "${txt}" == "" ];then
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable" >> $PREFIX/etc/apt/sources.list.d/science.list
        elif [ "${txt}" == "#deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable" ];then
            sed -i 's!#deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable!deb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable!g' $PREFIX/etc/apt/sources.list.d/science.list
    fi
    txt=$(grep "deb https://dl.bintray.com/grimler/science-packages-24 science stable" $PREFIX/etc/apt/sources.list.d/science.list)
    if [ "${txt}" == "deb https://dl.bintray.com/grimler/science-packages-24 science stable" ];then
        sed -i 's!deb https://dl.bintray.com/grimler/science-packages-24 science stable!#deb https://dl.bintray.com/grimler/science-packages-24 science stable!g' $PREFIX/etc/apt/sources.list.d/science.list
    fi
    pkg update && apt upgrade
    clear
	echo 
	echo "已更换为清华源"
	sleep 3s
	clear
	echo 
    change_source
    ;;
    3)
    main_menu
    ;;
    *)
    clear
	echo 
	echo "请输入正确数字！"
	sleep 3s
	clear
	echo 
	change_source
	;;
    esac
}

install_nextcloud(){
clear
echo 
echo "Nextcloud管理面板"
echo "
 1.安装Nextcloud
 2.启动Nextcloud
 3.自启Nextcloud
 4.添加信任IP或域名
 5.清除信任IP或域名
 6.Nextcloud默认网页
 7.卸载Nextcloud
 8.返回
"

read -p "请输入数学：" num
    case "$num" in
    1)
    if [ -d "$PREFIX/nextcloud" ];then
        clear
	    echo 
	    echo "Nextcloud已安装"
	    sleep 3s
	    clear
    	install_nextcloud
    fi
    pkg update
    pkg install php php-fpm sqlite coreutils openssl-tool
    rm -f $PREFIX/nextcloud.zip
    latest_version=$(wget -qO- "https://download.nextcloud.com/server/releases/?C=N;O=D"|grep 'zip">nextcloud-'|head -1|sed -r "s/.*nextcloud-//g"|sed "s/.zip.*$//g")
    clear
    echo 
    echo "如果没有VPN，自动下载速度可能极慢，可选择手动下载"
    echo "
     1.自动
     2.手动
     3.返回
    "
    read -p "请输入数字：" num
        case "$num" in
	1)
	wget https://download.nextcloud.com/server/releases/nextcloud-${latest_version}.zip -O $PREFIX/nextcloud.zip
	;;
	2)
	clear
	echo 
	echo "请使用浏览器等外部下载器下载Nextcloud安装包"
	echo 
	echo "保存在外部存储器根目录"
	echo 
	echo "https://download.nextcloud.com/server/releases/nextcloud-${latest_version}.zip"
	echo 
	read -p "请按任意键继续" num
	    case "$num" in
	    *)
	    ;;
	    esac
	if [ ! -f "/sdcard/nextcloud-${latest_version}.zip" ];then
	    clear
	    echo 
	    echo "nextcloud-${latest_version}.zip 未保存在外部存储器根目录"
	    sleep 3s
	    clear
    	    install_nextcloud
	    else
	    mv /sdcard/nextcloud-${latest_version}.zip $PREFIX/nextcloud.zip
	fi
	;;
	3)
	install_nextcloud
	;;
	*)
	clear
	echo 
        echo "请输入正确数字！"
    	sleep 3s
	clear
    	echo 
    	install_nextcloud
	;;
	esac    
    unzip -d $PREFIX $PREFIX/nextcloud.zip
    rm -f $PREFIX/nextcloud.zip
    clear
	echo 
	echo "Nextcloud已安装"
    echo 
    echo "第一次安装请务必使用浏览器完成安装"
    echo 
    echo "http://127.0.0.1:1100"
    echo 
    echo "请先启动Nextcloud"
    echo 
	read -p "请按任意键返回" any
	    case "$any" in
	    *)
	    install_nextcloud
	    ;;
	    esac
    ;;
    2)
    if [ ! -d "$PREFIX/nextcloud" ];then
        clear
	    echo 
	    echo "Nextcloud未安装"
	    sleep 3s
	    clear
    	install_nextcloud
    	else
    	php -S 0.0.0.0:1100 -t $PREFIX/nextcloud
    fi
    ;;
    3)
    if [ ! -d "$PREFIX/nextcloud" ];then
        clear
	    echo 
	    echo "Nextcloud未安装"
	    sleep 3s
	    clear
    	install_nextcloud
    	else
    clear
    echo 
    echo "自启Nextcloud"
    echo "
     1.开
     2.关
     3.返回
     "
    read -p "请输入数字：" num
        case "$num" in
	1)
        touch $HOME/.bashrc
        txt=$(grep "nextcloud" /data/data/com.termux/files/home/.bashrc)
        if [ "${txt}" == "echo 请打开新会话继续使用 && echo  && php -S 0.0.0.0:1100 -t $PREFIX/nextcloud" ];then
        clear
        echo 
        echo "Nextcloud已自启"
        sleep 3s
        clear
        install_nextcloud
        else
        echo "echo 请打开新会话继续使用 && echo  && php -S 0.0.0.0:1100 -t $PREFIX/nextcloud" >> $HOME/.bashrc
        chmod 777 $HOME/.bashrc
        clear
        echo 
        echo "Nextcloud已自启"
        sleep 3s
        clear
        install_nextcloud
        fi
	;;
	2)
	touch $HOME/.bashrc
        txt=$(grep "nextcloud" $HOME/.bashrc)
	if [ "${txt}" == "echo 请打开新会话继续使用 && echo  && php -S 0.0.0.0:1100 -t $PREFIX/nextcloud" ];then
	a=$(cat $HOME/.bashrc | grep -n nextcloud | sed "s/\:.*$//g")
	sed -i "$a d" $HOME/.bashrc
	clear
        echo 
        echo "Nextcloud自启已关闭"
        sleep 3s
        clear
        install_nextcloud
	fi
	;;
	3)
	install_nextcloud
	;;
	*)
        clear
	echo 
        echo "请输入正确数字！"
    	sleep 3s
	clear
    	echo 
    	install_nextcloud
    	;;
        esac   
    fi
    ;;
    4)
    if [ ! -d "$PREFIX/nextcloud" ];then
        clear
	    echo 
	    echo "Nextcloud未安装"
	    sleep 3s
	    clear
    	install_nextcloud
    	else
    clear
    echo 
    txt=$(grep "127.0.0.1" $PREFIX/nextcloud/config/config.php)
    if [ "$txt" == "" ];then
        echo "未进行初始化安装，请启动Nextcloud,打开浏览器进入："
	echo 
	echo "http://127.0.0.1:1100"
	echo 
	read -p "请按任意键返回" num
        case "$num" in
        *)
        install_nextcloud
        ;;
        esac
    fi
    echo "局域网访问，内网穿透访问需要添加可信任IP或域名"
    echo 
    echo "局域网访问需要登陆路由器固定IP"
    echo 
    echo "例如：192.168.1.101，demo.example.org"
    echo 
    read -p "请输入有效的IP或域名：" num
    sed -i "8a \    0 => '$num',\    #XX添加XX#" $PREFIX/nextcloud/config/config.php
    echo 
    echo "可访问 http://$num:1100 登陆Nextcloud"
    echo 
    read -p "请按任意键返回" num
        case "$num" in
        *)
        install_nextcloud
        ;;
        esac
    fi
    ;;
    5)
    if [ ! -d "$PREFIX/nextcloud" ];then
        clear
	    echo 
	    echo "Nextcloud未安装"
	    sleep 3s
	    clear
    	install_nextcloud
    	else
    clear
    echo 
    echo "清除信任IP或域名"
    echo "
     1.指定IP或域名
     2.所有IP或域名
     3.返回
     "
    read -p "请输入数学：" num
        case "$num" in
        1)
        clear
        echo 
        echo "清除指定IP或域名"
        echo 
        read -p "请输入指定IP或域名：" num
        txt=$(grep "$num" $PREFIX/nextcloud/config/config.php)
        echo "请确定删除只有一行且格式为 0 => 'IP或域名',    #添加#
        
        $txt"
        echo 
        read -p ​"​请确认是否继续 ? [Y/n] :​"​ yn
            case "$yn" in
	        Y)
	        a=$(cat $PREFIX/nextcloud/config/config.php | grep -n $num | sed "s/\:.*$//g")
	        sed -i "$a d" $PREFIX/nextcloud/config/config.php
	        clear
	        echo 
        	echo "已清除指定IP或域名"
	        sleep 3s
	        clear
        	echo 
            install_nextcloud
	        ;;
            y)
            a=$(cat $PREFIX/nextcloud/config/config.php | grep -n $num | sed "s/\:.*$//g")
	        sed -i "$a d" $PREFIX/nextcloud/config/config.php
	        clear
	        echo 
        	echo "已清除所有IP或域名"
	        sleep 3s
	        clear
        	echo 
            install_nextcloud
        	;;
	        Yes)
    	    a=$(cat $PREFIX/nextcloud/config/config.php | grep -n $num | sed "s/\:.*$//g")
	        sed -i "$a d" $PREFIX/nextcloud/config/config.php
	        clear
	        echo 
        	echo "已清除指定IP或域名"
	        sleep 3s
	        clear
        	echo 
            install_nextcloud
	        ;;
        	yes)
            a=$(cat $PREFIX/nextcloud/config/config.php | grep -n $num | sed "s/\:.*$//g")
	        sed -i "$a d" $PREFIX/nextcloud/config/config.php
	        clear
	        echo 
        	echo "已清除指定IP或域名"
	        sleep 3s
	        clear
        	echo 
            install_nextcloud
    	    ;;
            *)
            install_nextcloud
	        ;;
            esac
        ;;
        2)
        a=$(cat $PREFIX/nextcloud/config/config.php | grep -n XX | sed "s/\:.*$//g" | head -1)
        until [[ $a != 9 ]]
        do
        sed -i '9d' $PREFIX/nextcloud/config/config.php
        a=$(cat $PREFIX/nextcloud/config/config.php | grep -n XX | sed "s/\:.*$//g" | head -1)
        done
	clear
	echo 
        echo "已清除指定IP或域名"
	sleep 3s
	echo 
        install_nextcloud
        ;;
        3)
        install_nextcloud
        ;;
        *)
        clear
	    echo 
	    echo "请输入正确数字！"
    	sleep 3s
	    clear
    	echo 
    	install_nextcloud
    	;;
        esac
    fi
    ;;
    6)
    if [ ! -d "$PREFIX/nextcloud" ];then
        clear
	    echo 
	    echo "Nextcloud未安装"
	    sleep 3s
	    clear
    	install_nextcloud
    	else
    clear
    echo 
    echo "启动Nextcloud后，浏览器进入"
    echo 
    echo "http://127.0.0.1:1100"
    echo 
    read -p "请按任意键返回" any
	    case "$any" in
	    *)
	    install_nextcloud
	    ;;
	    esac
    fi
    ;;
    7)
    if [ ! -d "$PREFIX/nextcloud" ];then
        clear
	    echo 
	    echo "Nextcloud未安装"
	    sleep 3s
	    clear
    	install_nextcloud
    	else
    clear
    echo 
    echo "卸载Nextcloud？"
    echo 
    read -p ​"​请确认是否继续 ? [Y/n] :​"​ yn
        case "$yn" in
	    Y)
	    touch $HOME/.bashrc
            txt=$(grep "nextcloud" $HOME/.bashrc)
	    if [ "${txt}" == "echo 请打开新会话继续使用 && echo  && php -S 0.0.0.0:1100 -t $PREFIX/nextcloud" ];then
	    a=$(cat $HOME/.bashrc | grep -n nextcloud | sed "s/\:.*$//g")
	    sed -i "$a d" $HOME/.bashrc
	    fi
	    rm -rf $PREFIX/nextcloud
	    clear
    	    echo 
	    echo "Nextcloud已卸载"
    	    sleep 3s
            clear
	    echo 
	    install_nextcloud
	    ;;
            y)
            touch $HOME/.bashrc
            txt=$(grep "nextcloud" $HOME/.bashrc)
	    if [ "${txt}" == "echo 请打开新会话继续使用 && echo  && php -S 0.0.0.0:1100 -t $PREFIX/nextcloud" ];then
	    a=$(cat $HOME/.bashrc | grep -n nextcloud | sed "s/\:.*$//g")
	    sed -i "$a d" $HOME/.bashrc
	    fi
	    rm -rf $PREFIX/nextcloud
            clear
    	    echo 
	    echo "Nextcloud已卸载"
    	    sleep 3s
	    clear
	    echo 
	    install_nextcloud
            ;;
	    Yes)
            touch $HOME/.bashrc
            txt=$(grep "nextcloud" $HOME/.bashrc)
	    if [ "${txt}" == "echo 请打开新会话继续使用 && echo  && php -S 0.0.0.0:1100 -t $PREFIX/nextcloud" ];then
	    a=$(cat $HOME/.bashrc | grep -n nextcloud | sed "s/\:.*$//g")
	    sed -i "$a d" $HOME/.bashrc
	    fi
	    rm -rf $PREFIX/nextcloud
	    clear
    	    echo 
	    echo "Nextcloud已卸载"
	    sleep 3s
	    clear
	    echo 
    	    install_nextcloud
	    ;;
    	    yes)
    	    touch $HOME/.bashrc
            txt=$(grep "nextcloud" $HOME/.bashrc)
	    if [ "${txt}" == "echo 请打开新会话继续使用 && echo  && php -S 0.0.0.0:1100 -t $PREFIX/nextcloud" ];then
	    a=$(cat $HOME/.bashrc | grep -n nextcloud | sed "s/\:.*$//g")
	    sed -i "$a d" $HOME/.bashrc
	    fi
	    rm -rf $PREFIX/nextcloud
    	    clear
	    echo 
    	    echo "Nextcloud已卸载"
	    sleep 3s
	    clear
	    echo 
	    install_nextcloud
    	    ;;
            *)
            install_nextcloud
	    ;;
        esac
    fi
    ;;
    8)
    main_menu
    ;;
    *)
    clear
	echo 
	echo "请输入正确数字！"
	sleep 3s
	clear
	echo 
	install_nextcloud
	;;
    esac
}

main_menu
