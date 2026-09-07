#!/bin/bash
ADDR="1FKqgEb2kHdfzgxGBQSM4mAVDfwqyF2m6x"

while true; do
    echo "Mining with 2147483647 tries..."
    OUT=$(./src/twoore-cli -rpcclienttimeout=0 \
      -datadir="$HOME/twoore-mainnet" \
      -conf="$HOME/twoore-mainnet/twoore.conf" \
      generatetoaddress 1 "$ADDR" 2147483647)

    echo "$OUT"

    if [[ "$OUT" != "[]" && -n "$OUT" ]]; then
        echo "✅ Block found!"
        break
    fi

    echo "No block found in this range, starting next range..."
done
