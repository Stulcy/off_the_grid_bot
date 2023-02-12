import 'dart:io';

import 'blockchain/constants.dart';
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

  // Services
  final WalletService _walletService = WalletService();
  final TimeService _timeService = TimeService();
  late final GraphicsService _graphicsService = GraphicsService(_timeService);

  void init() async {
    await onboarding();
    await chainSelection();
    // mainLoop();
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

    _graphicsService.clearScreen();

    print('Successfully connected!');
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

    _graphicsService.clearScreen();
  }

  void mainLoop() {
    while (true) {
      print('');
    }
  }
}
