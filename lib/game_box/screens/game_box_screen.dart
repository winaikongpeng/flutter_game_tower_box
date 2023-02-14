import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/game_box/bloc/game_box_event.dart';
import '../bloc/game_box_bloc.dart';
import 'gam_box_portrait_screen.dart';
import 'game_box_landscape_screen.dart';

class GameBoxScreen extends StatefulWidget {
  const GameBoxScreen({super.key});

  @override
  State<GameBoxScreen> createState() => _GameBoxScreenState();
}

class _GameBoxScreenState extends State<GameBoxScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GameBoxBloc>().add(GenerateRandomBoxEvent());
  }

  // @override
  // Widget build(BuildContext context) => OrientationBuilder(
  //       builder: ((context, orientation) {
  //         final isPortrait = orientation == Orientation.portrait;
  //         return isPortrait
  //             ? const GameBoxPortraitScreen()
  //             : const GameBoxLandScapeScreen();
  //       }),
  //     );
  //! if you run on mobile or tablet please uncomment and remove this method
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait = screenWidth < 501 ? true : false;
    return isPortrait
        ? const GameBoxPortraitScreen()
        : const GameBoxLandScapeScreen();
  }
}
