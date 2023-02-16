import 'package:flutter/material.dart';
import 'package:flutter_game_tower_box/tower_box/blocs/bloc_exports.dart';
import 'tower_box/screens/tower_box_screen.dart';

void main() {
  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TowerBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game Tower Box',
        home: TowerBoxScreen(),
      ),
    );
  }
}
