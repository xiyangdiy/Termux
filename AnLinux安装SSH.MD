# AnLinux版Linux系统，设置SSH

### 1.使用AnLinux代码安装Linux
### 2.Linux挂载sdcard
  ```
  sed -i 's:#command+=" -b /sdcard":command+=" -b /sdcard":g' Linux启动脚本
  ```
### 3.进入Linux安装SSH
### 4.在Linux中，生成秘钥
  ```
  ssh-keygen
  ```
默认保存位置，两次输入秘钥密码，生成Id_rsa.pub(公钥）和Id_rsa(私钥）
### 5.复制秘钥到存储空间Key文件夹
  ```
  cp -r /root/.ssh/ /sdcard/Key
  ```
### 6.退出Linux，安装openssh
  ```
  apt update
  ```
  ```
  apt install openssh
  ```
### 7.添加公钥信息到Termux
  ```
  cat /sdcard/Key/id_rsa.pub >> /data/data/com.termux/files/home/.ssh/authorized_keys
  ```
### 8.启动sshd服务
  ```
  sshd
  ```
### 9.SSH连接信息
  用户名：任意数字字母  
  IP地址：127.0.0.1  
  端口：8022  
  秘钥：id_rsa  
