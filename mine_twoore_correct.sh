#!/bin/bash
ADDR="1FKqgEb2kHdfzgxGBQSM4mAVDfwqyF2m6x"
cd "$HOME/twoore-chain"

while true; do
    HEIGHT=$(./src/twoore-cli -rpcclienttimeout=30 -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" getblockcount)

    echo "Current block count: $HEIGHT"

    if [ "$HEIGHT" -ge 1 ]; then
        echo "✅ Block mined!"
        break
    fi

    echo "Mining 1 block with 2147483647 tries..."
    ./src/twoore-cli -rpcclienttimeout=0 -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" \
      generatetoaddress 1 "$ADDR" 2147483647
done
