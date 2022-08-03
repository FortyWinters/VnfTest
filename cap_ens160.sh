#!/bin/bash

tcpdump -i ens160 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'  -w a.pcap
