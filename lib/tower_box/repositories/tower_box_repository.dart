

import 'dart:math';

import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/tower_box/models/tower_box_model.dart';

class TowerBoxRepository {


  
  List<TowerBoxModel> generateBoxs(){
     final boxs = List<TowerBoxModel>.generate(Boxs.LENGTH, _checkGeneratedBox);
     if (boxs.isNotEmpty) {
        return boxs;
        
      } else {
       return [];
      }
  }

TowerBoxModel _checkGeneratedBox(int index) => (index == Boxs.LENGTH - 1)
      ? TowerBoxModel(index: index, styleBox: Boxs.LASTED_BOX)
      : TowerBoxModel(
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