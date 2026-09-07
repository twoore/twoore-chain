#!/bin/bash
cd ~/twoore-chain
while true; do
    HEIGHT=$(./src/twoore-cli -rpcclienttimeout=30 -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" getblockcount 2>/dev/null)
    echo "Current height: $HEIGHT"
    if [ "$HEIGHT" -ge 101 ]; then echo "Reached 101"; break; fi
    ~/twoore-fast-miner
    sleep 1
done
