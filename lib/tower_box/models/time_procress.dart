class TimerProcress {
   DateTime? _startTime;
  Duration _elapsedTime = Duration.zero;

  void start() {
    _startTime = DateTime.now();
  }

  Duration get elapsedTime => _elapsedTime + (DateTime.now().difference(_startTime!));

  void reset() {
    _elapsedTime = Duration.zero;
    _startTime = null;
  }
}