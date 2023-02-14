import 'dart:math';

import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/game_box/models/box_model.dart';

abstract class GameBoxState {}

class Initialzed extends GameBoxState {}

class ProgressState extends GameBoxState {}

class EndProgressState extends GameBoxState {}

class ErrorState extends GameBoxState {
  final String message;
  ErrorState({required this.message});
}


class GenerateRandomBoxStateSuccess extends GameBoxState {
  List<BoxModel> boxs;
  GenerateRandomBoxStateSuccess({required this.boxs});
}


  BoxModel checkGeneratedBox(int index) => (index == Boxs.LENGTH - 1)
      ? BoxModel(index: index, styleBox: Boxs.LASTED_BOX)
      : BoxModel(
          index: index,
          styleBox: randomStringTwoValues(),
        );


  String randomStringTwoValues() {
    final random = Random();
    final listRandomStyles = <String>[Boxs.FIRST_BOX, Boxs.SECOND_BOX];
    int index = random.nextInt(listRandomStyles.length);
    return listRandomStyles[index];
  }