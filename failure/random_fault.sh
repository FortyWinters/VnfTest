#!/bin/bash
#getTimestam $pointnumber $lable 
getTimestamp(){
	for i in `seq $1`
    	do
		echo $(date),$2,$(free|awk -F " " 'NR==2'|awk -F " " '{print $2}'),$(free|awk -F " " 'NR==2'|awk -F " " '{print $3}')>>t.csv
        sleep 1
    	done
}

random_f(){
	for NUM in 1 2 3 4
	do
		RANK=$(($RANDOM%3+1))
		echo $NUM,$RANK>>f.csv 
		getTimestamp 25 0
		if [ $NUM == 1 ];then
			echo "CPU FAULT START (RANK: $RANK)"
			cpu_f $RANK
		elif [ $NUM == 2 ];then
			echo "VM FAULT START (RANK: $RANK)"
			vm_f $RANK
		elif [ $NUM == 3 ];then
                	echo "IO FAULT START (RANK: $RANK)"
			io_f $RANK
		else
                	echo "PACKET LOST START (RANK: $RANK)"
			pl_f $RANK
		fi
		getTimestamp 25 0
	done
}

cpu_f(){
	if [ $1 == 1 ];then
		./stress-ng/stress-ng --cpu 4 &
		getTimestamp 25 1
		pkill -9 stress
	elif [ $1 == 2 ];then
		./stress-ng/stress-ng --cpu 5 &
		getTimestamp 25 1
		pkill -9 stress
	else
		./stress-ng/stress-ng --cpu 6 &
		getTimestamp 25 1
		pkill -9 stress
	fi
}

vm_f(){
	if [ $1 == 1 ];then
                ./stress-ng/stress-ng --vm 4 --vm-bytes 4G &
                getTimestamp 25 2
	        pkill -9 stress
	elif [ $1 == 2 ];then
                ./stress-ng/stress-ng --vm 5 --vm-bytes 5G &
                getTimestamp 25 2
	        pkill -9 stress
	else
                ./stress-ng/stress-ng --vm 6 --vm-bytes 6G &
                getTimestamp 25 2
	        pkill -9 stress
	fi
}

io_f(){
        if [ $1 == 1 ];then
		./stress-ng/stress-ng --iomix 4 --iomix-bytes 40% &
                getTimestamp 25 3
	        pkill -9 stress
        elif [ $1 == 2 ];then
                ./stress-ng/stress-ng --iomix 5 --iomix-bytes 50% &
                getTimestamp 25 3
	        pkill -9 stress
        else
                ./stress-ng/stress-ng --iomix 6 --iomix-bytes 60% &
                getTimestamp 25 3
	        pkill -9 stress
        fi
}

pl_f(){
        if [ $1 == 1 ];then
		route del 192.168.2.1 gw 192.168.1.233 dev ens160
                route del 192.168.2.2 gw 192.168.1.233 dev ens160
                route del 192.168.2.3 gw 192.168.1.233 dev ens160
                route del 192.168.2.4 gw 192.168.1.233 dev ens160
		getTimestamp 25 4
		route add 192.168.2.1 gw 192.168.1.233 dev ens160
		route add 192.168.2.2 gw 192.168.1.233 dev ens160
		route add 192.168.2.3 gw 192.168.1.233 dev ens160
		route add 192.168.2.4 gw 192.168.1.233 dev ens160
        elif [ $1 == 2 ];then
		route del 192.168.2.1 gw 192.168.1.233 dev ens160
                route del 192.168.2.2 gw 192.168.1.233 dev ens160
                route del 192.168.2.3 gw 192.168.1.233 dev ens160
                route del 192.168.2.4 gw 192.168.1.233 dev ens160
                route del 192.168.2.5 gw 192.168.1.233 dev ens160
		getTimestamp 25 4
		route add 192.168.2.1 gw 192.168.1.233 dev ens160
		route add 192.168.2.2 gw 192.168.1.233 dev ens160
		route add 192.168.2.3 gw 192.168.1.233 dev ens160
		route add 192.168.2.4 gw 192.168.1.233 dev ens160
		route add 192.168.2.5 gw 192.168.1.233 dev ens160
        else
               	route del 192.168.2.1 gw 192.168.1.233 dev ens160
              	route del 192.168.2.2 gw 192.168.1.233 dev ens160
                route del 192.168.2.3 gw 192.168.1.233 dev ens160
                route del 192.168.2.4 gw 192.168.1.233 dev ens160
                route del 192.168.2.5 gw 192.168.1.233 dev ens160
                route del 192.168.2.6 gw 192.168.1.233 dev ens160
		getTimestamp 25 4
           	route add 192.168.2.1 gw 192.168.1.233 dev ens160
          	route add 192.168.2.2 gw 192.168.1.233 dev ens160
          	route add 192.168.2.3 gw 192.168.1.233 dev ens160
         	route add 192.168.2.4 gw 192.168.1.233 dev ens160
           	route add 192.168.2.5 gw 192.168.1.233 dev ens160
         	route add 192.168.2.6 gw 192.168.1.233 dev ens160
        fi
}


main(){
	echo lable,rank>f.csv
	echo timestamp,lable,mem_total,mem_used>t.csv
	for i in `seq 5`
	do
		echo "FAILURE NUMBER: $i"
		random_f
	done
	cp t.csv /home/csy/Downloads/random.csv
	cp f.csv /home/csy/Downloads/fault.csv
	echo "FINISHED!!!"
}

main
