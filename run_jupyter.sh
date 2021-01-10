#!/bin/bash
#
# Run Jupyter on public port 8888

IP=`curl -s http://whatismyip.akamai.com/`
PORT=8888

# Open port 8888, if not opened
iptables -nL | grep $PORT >/dev/null || \
    echo "Opening port $PORT" && \
      iptables -A INPUT -p tcp --dport $PORT -j ACCEPT

jupyter notebook --ip=$IP --port=$PORT

# Close port 8888 when we're done
echo "Closing port $PORT"
RULE=`iptables -nL --line-numbers | grep $PORT | cut -d' ' -f1`
iptables -D INPUT $RULE
