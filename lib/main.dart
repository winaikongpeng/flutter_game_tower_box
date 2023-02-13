import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_box/bloc/game_box_bloc.dart';
import 'game_box/screens/gam_box_portrait_screen.dart';
import 'game_box/screens/game_box_screen.dart';

void main() => runApp(const RunApp());

class RunApp extends StatelessWidget {
  const RunApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => GameBoxBloc()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game Box',
        home: GameBoxScreen(),
      ),
    );
  }
}
