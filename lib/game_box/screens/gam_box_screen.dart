import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/core/widgets/box_widget.dart';
import 'package:flutter_game_tower_box/game_box/bloc/game_box_state.dart';
import 'package:flutter_game_tower_box/game_box/models/box_model.dart';
import '../../core/constants/box_constant.dart';
import '../bloc/game_box_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocConsumer<GameBoxBloc, GameBoxState>(
              builder: (ctx, state) {
                if (state is GenerateRandomBoxStateSuccess) {
                  return _generateBox(context, boxs: state.boxs);
                }
                return const SizedBox();
              },
              listener: (ctx, state) {
                if (state is ErrorState) {
                  // ignore: avoid_print
                  print(state.message);
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BoxWidgets.buttonCirle(type: Boxs.BUTTON_LEFT, onTap: () {}),
            BoxWidgets.buttonCirle(type: Boxs.BUTTON_RIGTH, onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _generateBox(BuildContext context, {required List<BoxModel> boxs}) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        color: Colors.red,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          shrinkWrap: true,
          itemCount: boxs.length,
          itemBuilder: ((context, index) {
            String styleBox = boxs[index].styleBox;

            if (styleBox == Boxs.LASTED_BOX) {
              return BoxWidgets.lastedBox();
            }
            return BoxWidgets.customBox(styleBox: styleBox);
          }),
        ),
      ),
    );
  }
}
