import time
import socket,sys,threading
 
def sendhttp(host, port, pkt_time):
	for i in range(120):
		print('Http sending...:', time.time())
		sock=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		sock.connect((host,port))
		#request_url = 'GET / HTTP/1.0\r\nHost: 192.168.6.60:8080\r\nAccept: */*\r\n\r\n'
		request_url = 'GET / HTTP/1.0\r\nHost: 192.168.6.60:8080\r\nAccept: */*\r\nUser-Agent: ' + 10000*'A' + '\r\n\r\n' #1KB=1024B 7125
		sock.send(request_url.encode()) 
		#print('Http sending...:', time.time())
		#print(i)
		sock.close()
		time.sleep(pkt_time)

def speed_control(trans_speed, pkt_size):
	pkt_number = trans_speed / pkt_size
	pkt_time = 1 / pkt_number
	return pkt_time



def thread_send(ip, port, pkt_time):
	thread1 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread2 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread3 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread4 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread5 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread6 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))	
	thread7 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread8 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread9 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))
	thread10 = threading.Thread(target=sendhttp, args=(ip, port, pkt_time))

	thread1.start()
	thread2.start()
	thread3.start()
	thread4.start()
	thread5.start()
	thread6.start()
	thread7.start()
	thread8.start()
	thread9.start()
	thread10.start()



if __name__ == '__main__':
	http_ip = "192.168.6.60"
	http_port = 8080
	pkt_time = speed_control(1250,7)
	thread_send(http_ip, http_port, pkt_time)
	thread_send(http_ip, http_port, pkt_time)
	thread_send(http_ip, http_port, pkt_time)
	thread_send(http_ip, http_port, pkt_time)
	thread_send(http_ip, http_port, pkt_time)
	thread_send(http_ip, http_port, pkt_time)
	thread_send(http_ip, http_port, pkt_time)
	thread_send(http_ip, http_port, pkt_time)
