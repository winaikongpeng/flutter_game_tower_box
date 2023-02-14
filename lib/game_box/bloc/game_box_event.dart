abstract class GameBoxEvent {}


class GenerateRandomBoxEvent extends GameBoxEvent {
}


class DestroyBoxEvent extends GameBoxEvent {
  final int index;
  final String type;


  DestroyBoxEvent({required this.index ,required this.type });
}


 class TimerStarted extends GameBoxEvent {
   final int duration;
    TimerStarted(this.duration);
 }
 
 class TimerPaused extends GameBoxEvent {
    TimerPaused();
 }