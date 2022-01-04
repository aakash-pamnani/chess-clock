part of 'home_screen_bloc.dart';

abstract class HomeScreenState {
  final int player1Time;
  final int player2Time;
  

  HomeScreenState(this.player1Time, this.player2Time);

  // @override
  // List<Object> get props => [duration];
}

class ShowDailog extends HomeScreenState {
  ShowDailog(int player1Time, int player2Time)
      : super(player1Time, player2Time);

  @override
  String toString() =>
      'ShowDailog { player1Time: $player1Time, player2Time: $player2Time }';
}

class TimerInitilizeState extends HomeScreenState {
  TimerInitilizeState(int player1Time, int player2Time)
      : super(player1Time, player2Time);

      @override
  String toString() =>
      'TimerInitilizeState { player1Time: $player1Time, player2Time: $player2Time }';
}

class TimerStartedState extends HomeScreenState {
  TimerStartedState(int player1Time, int player2Time)
      : super(player1Time, player2Time);

      @override
  String toString() =>
      'TimerStartedState { player1Time: $player1Time, player2Time: $player2Time }';
}

class TimerPauseState extends HomeScreenState {
  TimerPauseState(int player1Time, int player2Time)
      : super(player1Time, player2Time);

      @override
  String toString() =>
      'TimerPauseState { player1Time: $player1Time, player2Time: $player2Time }';
}

class TimerRunning extends HomeScreenState{
  TimerRunning(int player1Time, int player2Time) : super(player1Time, player2Time);

  @override
  String toString() =>
      'TimerRunning { player1Time: $player1Time, player2Time: $player2Time }';
}

class TimerCompletedState extends HomeScreenState {
  TimerCompletedState(int player1Time, int player2Time)
      : super(player1Time, player2Time);

      @override
  String toString() =>
      'TimerCompletedState { player1Time: $player1Time, player2Time: $player2Time }';
}
