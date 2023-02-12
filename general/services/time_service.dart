class TimeService {
  Future<void> delay(int miliseconds) async {
    await Future.delayed(Duration(milliseconds: miliseconds));
  }
}
