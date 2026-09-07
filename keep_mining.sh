#!/bin/bash
cd ~/twoore-chain

# Keep Mac awake while screen can turn off
caffeinate -i -m &
CAFFEINE_PID=$!

# Start node if not running
if ! pgrep -f "src/twoored" >/dev/null; then
  nohup ./src/twoored -datadir="$HOME/twoore-mainnet" \
    -conf="$HOME/twoore-mainnet/twoore.conf" \
    > /tmp/twoore_node.log 2>&1 &
fi

# Start 16-core miner if not running
if ! pgrep -f "mine_fast.sh" >/dev/null && ! pgrep -f "twoore-cpu-miner" >/dev/null; then
  nohup ./mine_fast.sh > ~/twoore-mining.log 2>&1 &
fi

echo "✅ TWOORE is mining in the background."
echo "You can turn off your screen. Keep this terminal open."

wait "$CAFFEINE_PID"
