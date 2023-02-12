import 'dart:math';
import 'package:web3dart/web3dart.dart';

import '../models/otg_wallet.dart';

class WalletService {
  OTGWallet createNewWallet() {
    Random rng = Random.secure();
    EthPrivateKey key = EthPrivateKey.createRandom(rng);
    return OTGWallet(key);
  }

  OTGWallet createExistingWallet(String privateKey) {
    EthPrivateKey key = EthPrivateKey.fromHex(privateKey);
    return OTGWallet(key);
  }
}
