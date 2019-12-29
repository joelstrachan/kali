#!/bin/bash

# rest all counters adn iptables rules
iptables -Z && iptables -F
# measure incoming traffic to 10.11.9.155
iptables -I INPUT 1 -s 10.11.8.12 -j ACCEPT
# measure outgoing traffic to 10.11.9.155
iptables -I OUTPUT 1 -d 10.11.8.12 -j ACCEPT

