import 'package:flutter/material.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'dart:math' as math;

class BoxWidgets {
  static Widget customBox({required String styleBox}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: styleBox == Boxs.FIRST_BOX ? Colors.pink : Colors.lightBlue,
        ),
      ),
    );
  }

  static Widget lastedBox() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Transform.rotate(
        angle: -math.pi / 5,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  static Widget buttonCirle({
    required void Function()? onTap,
    required String type,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: type == Boxs.BUTTON_LEFT ? Colors.pink : Colors.lightBlue,
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}
