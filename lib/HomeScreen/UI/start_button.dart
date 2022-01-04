import 'package:chess_clock/HomeScreen/Bloc/home_screen_bloc.dart';
import 'package:chess_clock/HomeScreen/UI/running_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        PlayButton(),
        SizedBox(
          width: 20,
        ),
        ResetButton(),
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var bloc = BlocProvider.of<HomeScreenBloc>(context);
        var snapshot = bloc.state;
        bloc.add(StartTimer(snapshot.player1Time, snapshot.player2Time));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 4)],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.white],
                stops: [0.5, 0.5])),
        child: const Icon(
          Icons.play_arrow,
          size: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}
