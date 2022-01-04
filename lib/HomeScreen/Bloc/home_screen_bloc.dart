import 'dart:async';

import 'package:chess_clock/HomeScreen/Utils/ticker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final Ticker player1 = const Ticker();
  final Ticker player2 = const Ticker();

  StreamSubscription<int>? player1Tick;
  StreamSubscription<int>? player2Tick;

  bool isPlayer1Turn = true;

  bool isTimerPaused = true;

  HomeScreenBloc(HomeScreenState initial) : super(initial) {
    on<ShowDailogEvent>((event, emit) {
      player1Tick?.cancel();
      player2Tick?.cancel();
      emit(ShowDailog(0, 0));
    });

    on<InitializeTimer>((event, emit) {
      isPlayer1Turn = true;
      emit(TimerInitilizeState(event.player1, event.player2));
    });

    on<StartTimer>((event, emit) {
      player1Tick?.cancel();
      player2Tick?.cancel();
      player1Tick = player1.tick(ticks: event.player1).listen((duration) {
        add(Timer1Ticked(
          duration,
        ));
      });
      player2Tick = player2.tick(ticks: event.player2).listen((duration) {
        add(Timer2Ticked(
          duration,
        ));
      });

      if (isPlayer1Turn) {
        player2Tick?.pause();
      } else {
        player1Tick?.pause();
      }
      isTimerPaused = false;
    });

    on<Timer1Ticked>((event, emit) {
      if (event.player1 > 0) {
        emit(TimerRunning(event.player1, state.player2Time));
      } else {
        player1Tick?.pause();
        player2Tick?.pause();
        emit(TimerCompletedState(0, state.player2Time));
      }
    });

    on<Timer2Ticked>((event, emit) {
      if (event.player2 > 0) {
        emit(TimerRunning(state.player1Time, event.player2));
      } else {
        player1Tick?.pause();
        player2Tick?.pause();
        emit(TimerCompletedState(state.player1Time, 0));
      }
    });

    on<Player1Tap>((event, emit) {
      if (isPlayer1Turn && !isTimerPaused) {
        player1Tick?.pause();
        player2Tick?.resume();
        isPlayer1Turn = false;
        emit(TimerRunning(state.player1Time, state.player2Time));
      }
    });
    on<Player2Tap>((event, emit) {
      if (!isPlayer1Turn && !isTimerPaused) {
        player1Tick?.resume();
        player2Tick?.pause();
        isPlayer1Turn = true;
        emit(TimerRunning(state.player1Time, state.player2Time));
      }
    });

    on<PauseTimer>((event, emit) {
      isTimerPaused = true;
      player1Tick?.pause();
      player2Tick?.pause();
      emit(TimerInitilizeState(state.player1Time, state.player2Time));
    });
  }

  @override
  void onTransition(Transition<HomeScreenEvent, HomeScreenState> transition) {
    if (kDebugMode) {
      print(transition);
    }
    super.onTransition(transition);
  }

  @override
  Future<void> close() {
    player1Tick?.cancel();
    player2Tick?.cancel();
    return super.close();
  }
}
