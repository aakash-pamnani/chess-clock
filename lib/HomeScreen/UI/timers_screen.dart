import 'package:chess_clock/HomeScreen/Bloc/home_screen_bloc.dart';
import 'package:chess_clock/HomeScreen/UI/picker_dailog.dart';
import 'package:chess_clock/HomeScreen/UI/running_button.dart';
import 'package:chess_clock/HomeScreen/UI/start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Timers extends StatelessWidget {
  const Timers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(ShowDailog(0, 0)),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, snapshot) {
        if (snapshot is ShowDailog) {
          Future.delayed(Duration.zero).then((value) {
            showTimePickerDailog(context);
          });
          return CustomStack(time1: "0:0", time2: "0:0", snapshot: snapshot);
        } else if (snapshot is TimerCompletedState) {
          Future.delayed(Duration.zero).then((value) {
            showTimeCompletedDailog(context, snapshot);
          });

          return CustomStack(time1: "0:0", time2: "0:0", snapshot: snapshot);
        } else if (snapshot is TimerInitilizeState ||
            snapshot is TimerRunning) {
          String time1 =
              " ${snapshot.player1Time ~/ 60} : ${snapshot.player1Time % 60}";
          String time2 =
              "${snapshot.player2Time ~/ 60} : ${snapshot.player2Time % 60}";

          return CustomStack(time1: time1, time2: time2, snapshot: snapshot);
        } else {
          return Container();
        }
      }),
    );
  }

  Future<dynamic> showTimeCompletedDailog(
      BuildContext context, TimerCompletedState snapshot) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dailogContext) {
          return AlertDialog(
            title: Text((snapshot.player1Time == 0)
                ? "Player 1 Lose"
                : "Player 2 Lose"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<HomeScreenBloc>(context)
                        .add(ShowDailogEvent());
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: const Text("Restart")),
              ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop(animated: true);
                  },
                  child: const Text("Exit"))
            ],
          );
        });
  }

  Future<dynamic> showTimePickerDailog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const PickerDailog();
        }).then((value) {
      BlocProvider.of<HomeScreenBloc>(context)
          .add(InitializeTimer((value ?? 0) * 60, (value ?? 0) * 60));
    });
  }
}

class CustomStack extends StatelessWidget {
  const CustomStack(
      {Key? key,
      required this.time1,
      required this.time2,
      required this.snapshot})
      : super(key: key);

  final String time1;
  final String time2;
  final HomeScreenState snapshot;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                BlocProvider.of<HomeScreenBloc>(context).add(Player1Tap());
              },
              child: Ink(
                color: Colors.white,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Center(
                    child: Text(time1,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                BlocProvider.of<HomeScreenBloc>(context).add(Player2Tap());
              },
              child: Ink(
                color: Colors.black,
                child: Center(
                  child: Text(time2,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          )
        ],
      ),
      Positioned(
        child: snapshot is TimerRunning
            ? const RunningButton()
            : const StartButton(),
      ),
    ]);
  }
}
