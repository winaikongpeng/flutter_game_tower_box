import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/game_box/bloc/game_box_state.dart';

import '../bloc/game_box_bloc.dart';

class GameBoxScreen extends StatefulWidget {
  const GameBoxScreen({super.key});

  @override
  State<GameBoxScreen> createState() => _GameBoxScreenState();
}

class _GameBoxScreenState extends State<GameBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Center(
          child: Text('GameBoxScreen'),
        ),
        BlocConsumer<GameBoxBloc, GameBoxState>(
          builder: (context, state) {
            if (state is Initialzed) {
              return const Center(child: Text('Initialzed'));
            }
            return _generateBox();
          },
          listener: (context, state) {},
        )
      ],
    ));
  }

  ListView _generateBox() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Boxs.LENGTH,
      itemBuilder: ((context, index) {
        return Text('data$index');
      }),
    );
  }
}
