#删除原路由表
route del -net 169.254.0.0/16 dev ens192
route del -net 169.254.0.0/16 dev ens160
route del -net 192.168.1.224/27 dev ens160
route del -net 192.168.1.224/27 dev ens192

route add 192.168.1.237 dev ens160

route add -net 192.168.1.224/27 gw 192.168.1.237 dev ens160

route add -net 192.168.2.0/24 gw 192.168.1.237 dev ens160
route add 192.168.3.1 dev ens160
