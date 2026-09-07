#!/bin/bash
ADDR="1FKqgEb2kHdfzgxGBQSM4mAVDfwqyF2m6x"
cd ~/twoore-chain

while true; do
    HEIGHT=$(./src/twoore-cli -rpcclienttimeout=30 -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" getblockcount 2>/dev/null)

    echo "Current height: $HEIGHT"

    if [ "$HEIGHT" -ge 101 ]; then
        echo "✅ Reached block 101"
        break
    fi

    ~/twoore-cpu-miner
    sleep 1
done
