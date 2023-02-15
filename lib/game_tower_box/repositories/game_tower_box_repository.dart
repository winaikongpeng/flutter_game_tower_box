

import 'dart:math';

import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/game_tower_box/models/box_model.dart';


class GameTowerBoxRepository {

  List<BoxModel> generateBoxs(){
     final boxs = List<BoxModel>.generate(Boxs.LENGTH, _checkGeneratedBox);
     if (boxs.isNotEmpty) {
        return boxs;
        
      } else {
       return [];
      }
  }

BoxModel _checkGeneratedBox(int index) => (index == Boxs.LENGTH - 1)
      ? BoxModel(index: index, styleBox: Boxs.LASTED_BOX)
      : BoxModel(
          index: index,
          styleBox: _randomStringTwoValues(),
        );

    String _randomStringTwoValues() {
    final random = Random();
    final listRandomStyles = <String>[Boxs.FIRST_BOX, Boxs.SECOND_BOX];
    int index = random.nextInt(listRandomStyles.length);
    return listRandomStyles[index];
  }

}