import 'dart:io';
import 'dart:math';

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import 'blockchain/constants.dart';
import 'blockchain/services/transaction_service.dart';
import 'blockchain/services/wallet_service.dart';
import 'general/services/graphics_service.dart';
import 'general/services/time_service.dart';
import 'blockchain/models/otg_wallet.dart';

// Starter
void main() {
  OffTheGridBot _ = OffTheGridBot();
}

class OffTheGridBot {
  OffTheGridBot() {
    init();
  }

  // User variables
  late OTGWallet _wallet;
  late int _chainID;

  // Shared objects
  Web3Client _client = Web3Client(chainstackRPCUrl, Client());

  // Services
  final WalletService _walletService = WalletService();
  late final TransactionService _transactionService =
      TransactionService(_client);
  final TimeService _timeService = TimeService();
  late final GraphicsService _graphicsService = GraphicsService(_timeService);

  void init() async {
    await onboarding();
    await chainSelection();
    await mainLoop();
  }

  Future<void> onboarding() async {
    await _graphicsService.greet();

    await _timeService.delay(1000);

    late String privateKey;
    while (true) {
      print('\n\nInsert your private key to continue:');
      privateKey = stdin.readLineSync()!;
      if (privateKey.length == 64) {
        break;
      } else {
        if (privateKey.length > 64) {
          print('\nToo long! Try again or use another one.');
        } else {
          print('\nToo short! Try again or use another one.');
        }
      }
    }

    _wallet = _walletService.createExistingWallet(privateKey);

    print('\nSuccessfully connected!');
    print('Your public address: ${_wallet.publicKey}\n');

    await _timeService.delay(1000);

    await _graphicsService.welcome();

    await _timeService.delay(2000);
  }

  Future<void> chainSelection() async {
    print('\n\nWhich network would you like to use?\n');
    await _timeService.delay(1000);
    print('\nMain networks:\n');
    await _timeService.delay(100);
    for (final network in mainNetworks.entries) {
      print('(${network.key}) - ${network.value.name}');
      await _timeService.delay(100);
    }
    print('\nTest networks:\n');
    await _timeService.delay(100);
    for (final network in testNetworks.entries) {
      print('(${network.key}) - ${network.value.name}');
      await _timeService.delay(100);
    }
    while (true) {
      print('\n\nEnter chain ID:');
      final String chainID = stdin.readLineSync()!;
      if (int.tryParse(chainID) != null &&
          (mainNetworks[int.parse(chainID)] != null ||
              testNetworks[int.parse(chainID)] != null)) {
        _chainID = int.parse(chainID);
        print('\nChain selected successfully!');
        break;
      } else {
        print('\nChain not supported or does not exist. Try again.');
      }
    }
    await _timeService.delay(2000);
  }

  Future<void> makeTransaction() async {}

  Future<void> mainLoop() async {
    bool running = true;
    print('');
    while (running) {
      print('\n(b) - check balance');
      print('(s) - send native cryptocurrency');
      print('(c) - change network');
      print('(x) - exit');
      final String response = stdin.readLineSync()!;
      switch (response) {
        case 'b':
          print('\nGetting balance ...');
          final EtherAmount balance =
              await _client.getBalance(_wallet.publicKeyEth);
          final String currency = mainNetworks[_chainID] == null
              ? testNetworks[_chainID]!.currency
              : mainNetworks[_chainID]!.currency;
          print(
              '\nBalance: ${(balance.getInWei.toDouble() / pow(10, 18)).toStringAsFixed(3)} $currency');
          break;
        case 's':
          print('\nTODO - transaction');
          break;
        case 'c':
          await chainSelection();
          break;
        case 'x':
          print('\nOkay then, bye!');
          running = false;
          break;
      }
    }
  }
}
