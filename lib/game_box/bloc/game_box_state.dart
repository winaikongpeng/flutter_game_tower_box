abstract class GameBoxState {}

class Initialzed extends GameBoxState {}

class ProgressState extends GameBoxState {}

class EndProgressState extends GameBoxState {}

class ErrorState extends GameBoxState {
  final String message;
  ErrorState({required this.message});
}
