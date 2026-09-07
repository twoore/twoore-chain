TWOORE integration/staging tree
===============================

https://twoore.org

For an immediately usable, binary version of the TWOORE software, see  
https://twoore.org/en/download/.

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
