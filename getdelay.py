import dpkt
import datetime


def get_arr(filePath):
	f = open(filePath)
	pcap = dpkt.pcap.Reader(f)

	arr = []
	arrNew = []

	for ts, buf in pcap:	
		eth = dpkt.ethernet.Ethernet(buf) #Ethernet object
		ip = eth.data #IP object
		tcp = ip.data #tcp object
		timeStamp = datetime.datetime.utcfromtimestamp(ts)
		sourcePort = tcp.sport
		arr.append([sourcePort, timeStamp])
	f.close()


	for i in range(len(arr)-1):
		if arr[i][0] != arr[i+1][0]:
			arrNew.append(arr[i])
	arrNew.append(arr[-1])
	return arrNew

def get_delay(pacIn, pacOut):
	arrDelay = []
	num = 0
	print("matching...")
	for i in range(len(pacIn)):
		lost = 1
		for j in range(len(pacOut)):
			if pacOut[j][0] == pacIn[i][0]:
				arrDelay.append([pacIn[i][0], pacOut[j][1]-pacIn[i][1]])
				lost = 0
				num = num +1
				break
		if lost == 1:
			arrDelay.append([pacIn[i][0], datetime.timedelta(0, 0, 0)])
			print("PACKET LOST!!!")
		if num >100:
			break
			
	return arrDelay	
	
def get_average(arrDelay):
	allDelay = datetime.timedelta(0, 0, 0)
	lost = 0 
	for i in range(len(arrDelay)):
		if arrDelay[i][1] == datetime.timedelta(0, 0, 0):
			lost = lost + 1	
		allDelay = allDelay + arrDelay[i][1]		
	print("average delay", allDelay/len(arrDelay))
	print("lost rate", lost/100)
			

	

def main():
	pacIn = get_arr('a.pcap')
	pacOut = get_arr('b.pcap')
	arrDelay = get_delay(pacIn, pacOut)
	get_average(arrDelay)

if __name__ == '__main__':
	main()
