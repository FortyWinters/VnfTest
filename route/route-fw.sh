#删除原路由表
route del -net 169.254.0.0/16 dev ens160
route del -net 169.254.0.0/16 dev ens192
route del -net 192.168.1.224/27 dev ens160
route del -net 192.168.1.224/27 dev ens192

route add 192.168.1.229 dev ens160
route add 192.168.1.232 dev ens192

route add 192.168.1.233 gw 192.168.1.232 dev ens192
route add 192.168.1.234 gw 192.168.1.232 dev ens192
route add 192.168.1.235 gw 192.168.1.232 dev ens192
route add 192.168.1.236 gw 192.168.1.232 dev ens192
route add 192.168.1.237 gw 192.168.1.232 dev ens192
route add 192.168.1.238 gw 192.168.1.232 dev ens192

route add -net 192.168.2.0/24 dev ens160
route add -net 192.168.3.0/24 gw 192.168.1.232 dev ens192