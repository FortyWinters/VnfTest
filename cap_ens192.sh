#!/bin/bash

tcpdump -i ens192 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x41414141' or 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420'  -w b.pcap
