import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class OTGWallet {
  OTGWallet(EthPrivateKey key) {
    publicKey = key.address.hex;
    publicKeyEth = key.address;
    String private = bytesToHex(key.privateKey);
    if (private.length == 64) {
      privateKey = private;
    } else {
      privateKey = private.substring(2);
    }
    credentials = key;
  }

  late final String publicKey;
  late final EthereumAddress publicKeyEth;
  late final String privateKey;
  late final EthPrivateKey credentials;
}
