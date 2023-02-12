import 'dart:math';

import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('generate box', () {
    String tRandomStringTwoValues() {
      final random = Random();
      final listRandomStyles = <String>[Boxs.FIRST_BOX, Boxs.SECOND_BOX];
      int index = random.nextInt(listRandomStyles.length);
      return listRandomStyles[index];
    }

    test('should random String two value', () {
      //
      final result = tRandomStringTwoValues();

      //
      if (result == Boxs.FIRST_BOX) {
        expect(result, Boxs.FIRST_BOX);
      } else {
        expect(result, Boxs.SECOND_BOX);
      }
    });
  });
}
