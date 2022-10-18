#删除原路由表
route del -net 169.254.0.0/16 dev ens192
route del -net 169.254.0.0/16 dev ens160
route del -net 192.168.1.224/27 dev ens160
route del -net 192.168.1.224/27 dev ens192

route add 192.168.1.233 dev ens160
route add 192.168.1.236 dev ens192

route add 192.168.1.229 gw 192.168.1.233 dev ens160
route add 192.168.1.230 gw 192.168.1.233 dev ens160
route add 192.168.1.231 gw 192.168.1.233 dev ens160
route add 192.168.1.232 gw 192.168.1.233 dev ens160

route add 192.168.1.237 gw 192.168.1.236 dev ens192
route add 192.168.1.238 gw 192.168.1.236 dev ens192

#为进行丢包测试，改变写法
#route add -net 192.168.2.0/24 gw 192.168.1.233 dev ens160
route add 192.168.2.1 gw 192.168.1.233 dev ens160
route add 192.168.2.2 gw 192.168.1.233 dev ens160
route add 192.168.2.3 gw 192.168.1.233 dev ens160
route add 192.168.2.4 gw 192.168.1.233 dev ens160
route add 192.168.2.5 gw 192.168.1.233 dev ens160
route add 192.168.2.6 gw 192.168.1.233 dev ens160
route add 192.168.2.7 gw 192.168.1.233 dev ens160
route add 192.168.2.8 gw 192.168.1.233 dev ens160
route add 192.168.2.9 gw 192.168.1.233 dev ens160
route add 192.168.2.10 gw 192.168.1.233 dev ens160
route add 192.168.2.11 gw 192.168.1.233 dev ens160
route add 192.168.2.12 gw 192.168.1.233 dev ens160
route add 192.168.2.13 gw 192.168.1.233 dev ens160
route add 192.168.2.14 gw 192.168.1.233 dev ens160
route add 192.168.2.15 gw 192.168.1.233 dev ens160
route add 192.168.2.16 gw 192.168.1.233 dev ens160
route add 192.168.2.17 gw 192.168.1.233 dev ens160
route add 192.168.2.18 gw 192.168.1.233 dev ens160
route add 192.168.2.19 gw 192.168.1.233 dev ens160
route add 192.168.2.20 gw 192.168.1.233 dev ens160

route add -net 192.168.3.0/24 gw 192.168.1.236 dev ens192
