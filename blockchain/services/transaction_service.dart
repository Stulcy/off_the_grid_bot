import 'package:web3dart/web3dart.dart';

class TransactionService {
  TransactionService(this._client);

  late final Web3Client _client;

  Future<String> sendNative(EthPrivateKey sender, EthereumAddress receiver,
      EtherAmount amount) async {
    try {
      await _client.sendTransaction(
        sender,
        Transaction(
          to: receiver,
          value: amount,
        ),
        chainId: 97,
      );
    } catch (e) {
      return e.toString();
    }
    return 'Success';
  }
}
