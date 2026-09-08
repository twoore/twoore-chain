// Copyright (c) 2015-2022 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOIN_CHAINPARAMSBASE_H
#define BITCOIN_CHAINPARAMSBASE_H

#include <cstdint>
#include <string>

/**
 * CBaseChainParams defines the base parameters (shared between bitcoin-cli and bitcoind)
 * of a given instance of the Bitcoin system.
 */
class CBaseChainParams
{
public:
    ///@{
    /** Ports */
    int m_rpc_port;
    int m_onion_service_target_port;
    ///@}

    ///@{
    /** Name and location of data directory */
    std::string strDataDir;
    ///@}

    CBaseChainParams(const std::string& data_dir = "", int rpc_port = 0, int onion_service_target_port = 0)
        : m_rpc_port(rpc_port),
          m_onion_service_target_port(onion_service_target_port),
          strDataDir(data_dir)
    {
    }

    uint16_t RPCPort() const { return static_cast<uint16_t>(m_rpc_port); }
    uint16_t OnionServiceTargetPort() const { return static_cast<uint16_t>(m_onion_service_target_port); }
};

#endif // BITCOIN_CHAINPARAMSBASE_H
