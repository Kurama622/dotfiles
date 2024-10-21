if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ];
then
export ClientIP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -f 1 -d '/')
export HostIP=$(cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}')

# ======================= wsl proxy ====================
showproxy()
{
    echo ''
    echo 'Show Proxy:'
    echo "http_proxy=$http_proxy"
    echo "https_proxy=$https_proxy"
    echo "ftp_proxy=$ftp_proxy"
    echo "ALL_PROXY=$ALL_PROXY"
    echo ''
}

setproxy()
{
    export http_proxy=http://$HostIP:10809/
    export https_proxy=http://$HostIP:10809/
    export ftp_proxy=http://$HostIP:10809/
    export ALL_PROXY=socks5://$HostIP:10808/
    showproxy
    echo "curl --connect-timeout 5 google.com"
    curl --connect-timeout 5 google.com
}

unsetproxy()
{
    unset https_proxy
    unset http_proxy
    unset ftp_proxy
    unset ALL_PROXY
    showproxy
    echo "curl --connect-timeout 5 163.com"
    curl --connect-timeout 5 163.com
}

fi
# ======================= clash proxy for linux ====================

proxy_on() {
	export http_proxy=http://127.0.0.1:7890
	export https_proxy=http://127.0.0.1:7890
	export no_proxy=127.0.0.1,localhost
  export HTTP_PROXY=http://127.0.0.1:7890
  export HTTPS_PROXY=http://127.0.0.1:7890
 	export NO_PROXY=127.0.0.1,localhost
	echo -e "\033[32m[√] 已开启代理\033[0m"
}

# 关闭系统代理
proxy_off(){
	unset http_proxy
	unset https_proxy
	unset no_proxy
  unset HTTP_PROXY
	unset HTTPS_PROXY
	unset NO_PROXY
	echo -e "\033[31m[×] 已关闭代理\033[0m"
}

# ============ hosts ============
get_host(){
  wget https://hosts.gitcdn.top/hosts.txt -O /tmp/hosts.txt
}

