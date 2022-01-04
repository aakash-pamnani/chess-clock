import 'package:chess_clock/HomeScreen/Bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RunningButton extends StatelessWidget {
  const RunningButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        PauseButton(),
        SizedBox(
          width: 20,
        ),
        ResetButton(),
      ],
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeScreenBloc>(context).add(PauseTimer());
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
          Icons.pause,
          size: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeScreenBloc>(context).add(ShowDailogEvent());
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
          Icons.restore,
          size: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}
