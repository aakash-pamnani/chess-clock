part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent {
  const HomeScreenEvent();
}

class ShowDailogEvent extends HomeScreenEvent {}

class InitializeTimer extends HomeScreenEvent {
  InitializeTimer(this.player1, this.player2);

  int player1;
  int player2;
}

class StartTimer extends HomeScreenEvent {
  int player1;
  int player2;
  StartTimer(
    this.player1,
    this.player2,
  );

  @override
  String toString() =>
      "StartTimer { player1Time: $player1, player2Time: $player2 }";
}

class Timer1Ticked extends HomeScreenEvent {
  int player1;

  Timer1Ticked(
    this.player1,
  );

  @override
  String toString() => "Timer1Ticked { player1Time: $player1}";
}

class Timer2Ticked extends HomeScreenEvent {
  int player2;
  Timer2Ticked(
    this.player2,
  );

  @override
  String toString() => "Timer2Ticked { player2Time: $player2}";
}

class PauseTimer extends HomeScreenEvent {}

class Player1Tap extends HomeScreenEvent {}

class Player2Tap extends HomeScreenEvent {}
