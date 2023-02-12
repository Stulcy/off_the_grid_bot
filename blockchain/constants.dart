import 'models/network.dart';

const Map<int, Network> mainNetworks = {
  1: Network("Ethereum Mainnet", 'ETH'),
  56: Network("Binance Smart Chain Mainnet", 'BNB'),
  137: Network("Polygon Mainnet", 'MATIC'),
  42161: Network("Arbitrum One", 'ETH'),
  43114: Network("Avalanche C-Chain", 'AVAX'),
  10: Network("Optimism", 'ETH'),
  250: Network("Fantom Opera", 'FTM'),
  42220: Network("Celo Mainnet", 'CELO'),
  100: Network("Gnosis", 'xDAI'),
  1284: Network("Moonbeam", 'GLMR'),
  66: Network("OKXChain Mainnet", 'OKT'),
  1088: Network("Metis Andromeda Mainnet", 'METIS'),
  321: Network("KCC Mainnet", 'KCS'),
  1285: Network("Moonriver", 'MOVR'),
  59: Network("EOS Mainnet", 'EOS'),
};

const Map<int, Network> testNetworks = {
  5: Network('Ethereum Goerli', 'ETH'),
  421613: Network('Arbitrum Goerli', 'AGOR'),
  97: Network('Binance Smart Chain Testnet', 'TBNB'),
  941: Network('PulseChain Testnet', 'TPLS'),
};
