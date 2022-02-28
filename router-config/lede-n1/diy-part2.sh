#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' ./feeds/luci/collections/luci/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/lean/default-settings/files/zzz-default-settings
echo "DISTRIB_SOURCECODE='lede'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate

# Modify default root's password（FROM 'password'[$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.] CHANGE TO 'your password'）
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' /etc/shadow
sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root:$1$.q1gt4pK$9FjAkAv7TvFUyZYwWK8Td0:18923:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add 晶晨宝盒 luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/vpei/luci-app-amlogic

# Add zerotier luci-app-zerotier
svn co https://github.com/harryzwh/luci-app-zerotier/trunk/ package/vpei/luci-app-zerotier
sed -i 's#../../luci.mk#$(TOPDIR)/feeds/luci/luci.mk#' package/vpei/luci-app-zerotier/Makefile

# Add shadowsocks and shadowsocksR
# svn co https://github.com/openwrt/packages/trunk/net/shadowsocks-libev package/vpei/shadowsocks-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocks-rust package/vpei/shadowsocks-rust
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/vpei/shadowsocksr-libev

# Add p7zip
svn co https://github.com/hubutui/p7zip-lede/trunk/ package/vpei/p7zip

# Fix runc version error
# rm -rf ./feeds/packages/utils/runc/Makefile
# svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile

# coolsnowwolf default software package replaced with Lienol related software package
# rm -rf feeds/packages/utils/{containerd,libnetwork,runc,tini}
# svn co https://github.com/Lienol/openwrt-packages/trunk/utils/{containerd,libnetwork,runc,tini} feeds/packages/utils

# Add third-party software packages (The entire repository)
# git clone https://github.com/libremesh/lime-packages.git package/lime-packages

# Add third-party software packages (Specify the package)
# svn co https://github.com/libremesh/lime-packages/trunk/packages/{shared-state-pirania,pirania-app,pirania} package/lime-packages/packages
# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
# sed -i "/DEFAULT_PACKAGES/ s/$/ pirania-app pirania ip6tables-mod-nat ipset shared-state-pirania uhttpd-mod-lua/" target/linux/armvirt/Makefile

# 替换软件包
# rm include/feeds.mk
# wget -P include https://raw.githubusercontent.com/openwrt/openwrt/master/include/feeds.mk

# rm -rf feeds/packages/net/openssh
# svn co https://github.com/openwrt/packages/trunk/net/openssh package/openssh

# rm -rf package/lean/luci-app-cpufreq
# svn co https://github.com/breakings/OpenWrt/trunk/general/luci-app-cpufreq package/luci-app-cpufreq

# luci-app-socat
# svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-socat package/vpei/luci-app-socat

# rm -rf package/libs/elfutils
# svn co https://github.com/neheb/openwrt/branches/elf/package/libs/elfutils package/libs/elfutils

# rm -rf feeds/packages/utils/gnupg
# svn co https://github.com/breakings/OpenWrt/trunk/general/gnupg feeds/packages/utils/gnupg

# rm -rf feeds/packages/net/kcptun
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/kcptun package/kcptun

# fix nginx-ssl-util error (do not use fallthrough attribute)
# rm feeds/packages/net/nginx-util/src/nginx-ssl-util.hpp
# wget -P feeds/packages/net/nginx-util/src https://raw.githubusercontent.com/openwrt/packages/master/net/nginx-util/src/nginx-ssl-util.hpp

# fdk-aac
# rm -rf feeds/packages/sound/fdk-aac
# svn co https://github.com/openwrt/packages/trunk/sound/fdk-aac feeds/packages/sound/fdk-aac

# lvm2
# rm -rf feeds/packages/utils/lvm2
# svn co https://github.com/openwrt/packages/trunk/utils/lvm2 feeds/packages/utils/lvm2

# tini
# rm -rf feeds/packages/utils/tini
# svn co https://github.com/openwrt/packages/trunk/utils/tini feeds/packages/utils/tini

# ntfs3
# rm -rf package/lean/ntfs3
# svn co https://github.com/breakings/OpenWrt/trunk/general/ntfs3 package/lean/ntfs3
# fix ntfs3 generating empty package
# sed -i 's/KCONFIG:=CONFIG_NLS_DEFAULT="utf8"/#KCONFIG:=CONFIG_NLS_DEFAULT="utf8"/'g package/lean/ntfs3/Makefile

# naiveproxy
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/naiveproxy
# fix NaïveProxy typo error
# sed -i 's/NaveProxy/NaïveProxy/g' package/naiveproxy/Makefile

# 添加xray-core xray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/vpei/xray-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-plugin package/vpei/xray-plugin
# sed -i 's/PKG_HASH:=.*/PKG_HASH:=4a178a2bacffcc2fd374c57e47b71eb0cb5667bfe747690a16501092c0618707/' package/vpei/xray-plugin/Makefile

# 添加额外软件包
# svn co https://github.com/immortalwrt/luci-app-unblockneteasemusic/trunk package/vpei/luci-app-unblockneteasemusic
svn co https://github.com/jerrykuku/lua-maxminddb/trunk package/vpei/lua-maxminddb
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/vpei/simple-obfs
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/vpei/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/vpei/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/vpei/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan package/vpei/trojan
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/vpei/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/vpei/trojan-plus

svn co https://github.com/jerrykuku/luci-app-vssr/trunk package/vpei/luci-app-vssr
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/vpei/luci-app-openclash
svn co https://github.com/project-lede/luci-app-godproxy/trunk package/vpei/luci-app-godproxy
# svn co https://github.com/openwrt/luci/trunk/modules/luci-mod-dashboard feeds/luci/modules/luci-mod-dashboard
# svn co https://github.com/openwrt/packages/trunk/libs/libfido2 package/libfido2
# svn co https://github.com/openwrt/packages/trunk/libs/libcbor package/libcbor

# 添加京东自动签到 luci-app-jd-dailybonus
# rm -rf package/lean/luci-app-jd-dailybonus
svn co https://github.com/jerrykuku/luci-app-jd-dailybonus/trunk package/vpei/luci-app-jd-dailybonus

# 编译 po2lmo (如果有po2lmo可跳过)
# pushd package/luci-app-openclash/tools/po2lmo
# make && sudo make install popd

# 添加luci-app-filebrowser
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/vpei/luci-app-filebrowser

# svn co https://github.com/project-openwrt/openwrt/trunk/package/lienol/luci-app-fileassistant package/luci-app-fileassistant

# 添加passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/vpei/luci-app-passwall

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/vpei/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/vpei/dns2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/vpei/ipt2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/vpei/microsocks 
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/vpei/pdnsd-alt
# svn co https://github.com/fw876/helloworld/trunk/tcping package/vpei/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/vpei/hysteria

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-core package/vpei/v2ray-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/vpei/v2ray-plugin

# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-gost package/vpei/luci-app-gost
# svn co https://github.com/kenzok8/openwrt-packages/trunk/gost package/vpei/gost
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos package/vpei/luci-app-eqos

# 微信推送serverchan
svn co https://github.com/tty228/luci-app-serverchan/trunk package/vpei/luci-app-serverchan

# 添加luci-app-ssr-plus
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/vpei/luci-app-ssr-plus
# svn co https://github.com/semigodking/redsocks/trunk package/vpei/redsocks2

# 添加luci-app-adguardhome
svn co https://github.com/rufengsuixing/luci-app-adguardhome/trunk package/vpei/luci-app-adguardhome

# 添加luci-app-smartdns
# rm -rf feeds/packages/net/smartdns
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/smartdns package/vpei/smartdns
svn co https://github.com/kenzok8/openwrt-packages/branches/main/luci-app-smartdns package/vpei/luci-app-smartdns
# svn co https://github.com/pymumu/luci-app-smartdns/trunk package/vpei/luci-app-smartdns
# sed -i 's|include ../../luci.mk|include $(TOPDIR)/feeds/luci/luci.mk|' package/vpei/luci-app-smartdns/Makefile
# 替换smartdns文件成新版本
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.2021.34/' feeds/packages/net/smartdns/Makefile
#sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=756029f5e9879075c042030bd3aa3db06d700270/' feeds/packages/net/smartdns/Makefile
#sed -i 's/PKG_MIRROR_HASH:=.*/PKG_MIRROR_HASH:=c2979d956127946861977781beb3323ad9a614ae55014bc99ad39beb7a27d481/' feeds/packages/net/smartdns/Makefile

# 修改bypass的makefile
# git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
# find package/luci-app-bypass/*/ -maxdepth 8 -path "*" | xargs -i sed -i 's/smartdns-le/smartdns/g' {}

# 添加ddnsto
# svn co https://github.com/linkease/ddnsto-openwrt/trunk/ddnsto package/vpei/ddnsto
# svn co https://github.com/linkease/ddnsto-openwrt/trunk/luci-app-ddnsto package/vpei/luci-app-ddnsto

# 添加udp2raw
# git clone https://github.com/sensec/openwrt-udp2raw package/vpei/openwrt-udp2raw
# git clone https://github.com/sensec/luci-app-udp2raw package/vpei/luci-app-udp2raw
# sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=f2f90a9a150be94d50af555b53657a2a4309f287/" package/vpei/openwrt-udp2raw/Makefile
# sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=20200920\.0/" package/vpei/openwrt-udp2raw/Makefile

# themes
# git clone https://github.com/rosywrt/luci-theme-purple.git package/vpei/luci-theme-purple
# git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/vpei/luci-theme-opentomcat
# svn co https://github.com/Leo-Jo-My/luci-theme-opentomcat/trunk package/vpei/luci-theme-opentomcat
# svn co https://github.com/Leo-Jo-My/luci-theme-opentomato/trunk package/vpei/luci-theme-opentomato
# svn co https://github.com/sirpdboy/luci-theme-opentopd/trunk package/vpei/luci-theme-opentopd
# git clone https://github.com/kevin-morgan/luci-theme-argon-dark.git package/vpei/luci-theme-argon-dark
# svn co https://github.com/kevin-morgan/luci-theme-argon-dark/trunk package/vpei/luci-theme-argon-dark
# svn co https://github.com/openwrt/luci/trunk/themes/luci-theme-openwrt-2020 package/vpei/luci-theme-openwrt-2020

#删除docker无脑初始化教程
# sed -i '31,39d' package/lean/luci-app-docker/po/zh-cn/docker.po
# rm -rf lean/luci-app-docker/root/www

# Apply patch
# git apply ../router-config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

