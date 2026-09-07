#!/bin/bash
ADDR="1FKqgEb2kHdfzgxGBQSM4mAVDfwqyF2m6x"
while true; do
    HEIGHT=$(./src/twoore-cli -rpcclienttimeout=30 -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" getblockcount 2>/dev/null)
    echo "Current height: $HEIGHT"
    if [ "$HEIGHT" -ge 101 ]; then echo "Reached 101"; break; fi
    ./src/twoore-cli -rpcclienttimeout=0 -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" \
      generatetoaddress 1 "$ADDR" 2147483647
done
