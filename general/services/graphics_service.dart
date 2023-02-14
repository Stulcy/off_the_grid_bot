import 'time_service.dart';

class GraphicsService {
  GraphicsService(this._timeService);

  final TimeService _timeService;

  Future<void> greet() async {
    print("   ____               _   _                   ");
    await _timeService.delay(300);
    print("  / ___|_ __ ___  ___| |_(_)_ __   __ _ ___   ");
    await _timeService.delay(300);
    print(" | |  _| '__/ _ \\/ _ \\ __| | '_ \\ / _` / __|  ");
    await _timeService.delay(300);
    print(" | |_| | | |  __/  __/ |_| | | | | (_| \\__ \\_ ");
    await _timeService.delay(300);
    print("  \\____|_|  \\___|\\___|\\__|_|_| |_|\\__, |___( )          _ ");
    await _timeService.delay(300);
    print(" / ___| _   _ _ __ ___  _ __ ___  |___/ _ _|/  ___ _ __| |");
    await _timeService.delay(300);
    print(" \\___ \\| | | | '_ ` _ \\| '_ ` _ \\ / _ \\| '_ \\ / _ \\ '__| |");
    await _timeService.delay(300);
    print("  ___) | |_| | | | | | | | | | | | (_) | | | |  __/ |  |_|");
    await _timeService.delay(300);
    print(" |____/ \\__,_|_| |_| |_|_| |_| |_|\\___/|_| |_|\\___|_|  (_)");
  }

  Future<void> welcome() async {
    print("             _");
    await _timeService.delay(300);
    print(' __ __ _____| |__ ___ _ __  ___');
    await _timeService.delay(300);
    print(" \\ V  V / -_) / _/ _ \\ '  \\/ -_)");
    await _timeService.delay(300);
    print("  \\_/\\_/\\___|_\\__\\___/_|_|_\\___|");
    await _timeService.delay(300);
    print("   ___  _____ _____   _____ _   _ _____    ____ ____  ___ ____");
    await _timeService.delay(300);
    print("  / _ \\|  ___|  ___| |_   _| | | | ____|  / ___|  _ \\|_ _|  _ \\");
    await _timeService.delay(300);
    print(" | | | | |_  | |_      | | | |_| |  _|   | |  _| |_) || || | | |");
    await _timeService.delay(300);
    print(" | |_| |  _| |  _|     | | |  _  | |___  | |_| |  _ < | || |_| |");
    await _timeService.delay(300);
    print(
        "  \\___/|_|   |_|       |_| |_| |_|_____|  \\____|_| \\_\\___|____/");
  }
}
