#include "chainparamsbase.h"
#include "common/args.h"

std::unique_ptr<CBaseChainParams> CreateBaseChainParams(const ChainType chain)
{
    return std::make_unique<CBaseChainParams>("twoore");
}

void SetupChainParamsBaseOptions(ArgsManager& argsman)
{
}

void SelectBaseParams(const ChainType chain)
{
}

const CBaseChainParams& BaseParams()
{
    static const CBaseChainParams params{"twoore"};
    return params;
}
