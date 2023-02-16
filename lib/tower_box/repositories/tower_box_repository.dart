import 'dart:math';

import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/tower_box/models/tower_box_model.dart';

class TowerBoxRepository {
  List<TowerBoxModel> generateBoxs() {
    final boxs = List<TowerBoxModel>.generate(Boxs.LENGTH, _checkGeneratedBox);
    if (boxs.isNotEmpty) {
      return boxs;
    } else {
      return [];
    }
  }

  TowerBoxModel _checkGeneratedBox(int index) => (index == Boxs.LENGTH - 1)
      ? TowerBoxModel(
          index: index, styleBox: Boxs.LASTED_BOX, procressType: Boxs.END)
      : index == 0
          ? TowerBoxModel(
              index: index,
              styleBox: _randomStringTwoValues(),
              procressType: Boxs.START)
          : TowerBoxModel(
              index: index,
              styleBox: _randomStringTwoValues(),
              procressType: Boxs.PROCESS);

  String _randomStringTwoValues() {
    final random = Random();
    final listRandomStyles = <String>[Boxs.FIRST_BOX, Boxs.SECOND_BOX];
    int index = random.nextInt(listRandomStyles.length);
    return listRandomStyles[index];
  }

  static String convertIntToTime(int value) {
    int h, m, s;

    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (h * 3600) - (m * 60);

    final hourLeft = h.toString().padLeft(2, '0');
    final minuteLeft = m.toString().padLeft(2, '0');
    final secondLeft = s.toString().padLeft(2, '0');
    String result = "$hourLeft:$minuteLeft:$secondLeft";

    return result;
  }
}
