#include <chainparams.h>
#include <kernel/chainparams.h>
#include <pow.h>
#include <uint256.h>
#include <atomic>
#include <iostream>
#include <thread>
#include <vector>

int main()
{
    SelectParams(ChainType::MAIN);
    const CChainParams& params = Params();
    const CBlock genesis = params.GenesisBlock();
    const auto& consensus = params.GetConsensus();

    std::atomic<uint32_t> next_nonce{0};
    std::atomic<bool> found{false};
    uint32_t found_nonce = 0;
    uint256 found_hash;

    unsigned int nthreads = std::thread::hardware_concurrency();
    if (nthreads == 0) nthreads = 4;
    std::cout << "Using " << nthreads << " threads\n";

    std::vector<std::thread> threads;
    for (unsigned int t = 0; t < nthreads; ++t) {
        threads.emplace_back([&]() {
            while (!found.load()) {
                uint32_t nonce = next_nonce.fetch_add(1);
                if (nonce >= 0xffffffff) return;

                CBlock block = genesis;
                block.nNonce = nonce;
                uint256 hash = block.GetHash();

                if (CheckProofOfWork(hash, block.nBits, consensus)) {
                    found_nonce = nonce;
                    found_hash = hash;
                    found.store(true);
                    return;
                }
            }
        });
    }

    for (auto& th : threads) th.join();

    std::cout << "nonce=" << found_nonce << "\n";
    std::cout << "hash=" << found_hash.ToString() << "\n";
    std::cout << "merkle=" << genesis.hashMerkleRoot.ToString() << "\n";
    return 0;
}
