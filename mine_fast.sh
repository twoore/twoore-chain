#!/bin/bash

while true; do
    HEIGHT=$(./src/twoore-cli -rpcclienttimeout=30 -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" getblockcount 2>/dev/null)

    echo "Current height: $HEIGHT"

    if [ "$HEIGHT" -ge 101 ]; then
        echo "✅ Reached block 101"
        break
    fi

    echo "Mining with all CPU cores..."
    $HOME/twoore-cpu-miner
    sleep 1
done
