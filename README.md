TWOORE integration/staging tree
===============================

https://twoore.org

For an immediately usable, binary version of the TWOORE software, see  
https://github.com/twoore/twoore-chain/releases/tag/v0.1.10.

What is TWOORE?
---------------

TWOORE is an independent blockchain that connects to its own peer-to-peer network to download and fully
validate blocks and transactions. It also includes a wallet and graphical user
interface, which can be optionally built.

TWOORE has its own native coin, mining algorithm (SHA-256d), and an integrated
decentralized exchange (DEX). It is built on the Bitcoin Core codebase but has
its own genesis block, network parameters, and economic model.

Further information about TWOORE is available in the [doc folder](/doc).

License
-------

TWOORE is released under the terms of the MIT license. See [COPYING](COPYING) for more  
information or see https://opensource.org/licenses/MIT.

Development Process
-------------------  

The `main` branch is regularly built (see `doc/build-*.md` for instructions) and tested, but it is not guaranteed to be
completely stable. [Tags](https://github.com/twoore/twoore-chain/tags) are created
regularly from release branches to indicate new official, stable release versions of TWOORE.

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md)
and useful hints for developers can be found in [doc/developer-notes.md](doc/developer-notes.md).

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test on short notice. Please be patient and help out by testing
other people's pull requests, and remember this is a security-critical project where any mistake might cost people
lots of money.

Mining
------

TWOORE uses the SHA-256d proof-of-work algorithm. CPU mining is supported via
the included optimized miner (`cpuminer-opt`). To start mining:

```bash
cd ~/cpuminer-opt-26.1
./cpuminer -a sha256d -o http://127.0.0.1:8223 -O twoore:twoorepass --coinbase-addr=1FKqgEb2kHdfzgxGBQSM4mAVDfwqyF2m6x

## Building from source

### Prerequisites (C++ toolchain and libraries)

- C++20 compiler (GCC 10+, Clang 12+, or MSVC 2019+)
- Autotools (`autoconf`, `automake`, `libtool`)
- Boost (>=1.73)
- libevent (>=2.1.8)
- OpenSSL
- SQLite (>=3.7.17)
- ZeroMQ (>=4) and libsodium (for full node features)

### Install dependencies

#### Linux (Ubuntu/Debian)

```bash
sudo apt-get update
sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev libdb-dev libdb++-dev libsqlite3-dev libzmq3-dev libsodium-dev
```

#### macOS

```bash
brew install automake libtool boost libevent openssl sqlite zmq libsodium
```

#### Windows (MSYS2 MINGW64)

```bash
pacman -S --needed base-devel mingw-w64-x86_64-toolchain mingw-w64-x86_64-boost mingw-w64-x86_64-libevent mingw-w64-x86_64-openssl mingw-w64-x86_64-sqlite3 mingw-w64-x86_64-zeromq mingw-w64-x86_64-libsodium mingw-w64-x86_64-autotools mingw-w64-x86_64-libtool mingw-w64-x86_64-pkg-config git
```

### Build commands

```bash
./autogen.sh
./configure --disable-gui --disable-tests --disable-bench
make -j2
```

Binaries will be in `src/`:
- `twoored` (or `twoored.exe` on Windows)
- `twoore-cli`
- `twoore-miner`

## Download

Official binaries for all platforms (Linux, macOS Intel, macOS Apple Silicon, Windows):

**[⬇ Download Latest Release](https://github.com/twoore/twoore-chain/releases/latest)**

Or pick your platform directly:

| Platform | Download |
|----------|----------|
| Linux x86_64 | [twoore-ubuntu-latest.zip](https://github.com/twoore/twoore-chain/releases/latest/download/twoore-ubuntu-latest.zip) |
| macOS Intel | [twoore-macos-latest.zip](https://github.com/twoore/twoore-chain/releases/latest/download/twoore-macos-latest.zip) |
| macOS Apple Silicon | [twoore-macos-14.zip](https://github.com/twoore/twoore-chain/releases/latest/download/twoore-macos-14.zip) |
| Windows x86_64 | [twoore-windows.zip](https://github.com/twoore/twoore-chain/releases/latest/download/twoore-windows.zip) |

Each archive contains:
- `twoored` – full node
- `twoore-cli` – wallet CLI
- `twoore-miner` – CPU miner
