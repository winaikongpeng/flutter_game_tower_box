import 'package:flutter/material.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'dart:math' as math;

class BoxWidgets {
  static Widget customBox({required String styleBox, required double size}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 70, 69, 69), width: 2),
          borderRadius: BorderRadius.circular(10),
          color: styleBox == Boxs.FIRST_BOX ? Colors.pink : Colors.lightBlue,
        ),
      ),
    );
  }

  static Widget lastedBox({
    required double size,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: size * 0.07),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(
            math.pi / 4,
          ),
          child: Container(
            width: size * 0.3,
            height: size * 0.3,
            decoration: BoxDecoration(
              color: Colors.purple,
              border: Border.all(
                  color: const Color.fromARGB(255, 70, 69, 69), width: 2),
            ),
          ),
        ),
      ),
    );
  }

  static Widget buttonCircle({
    required void Function()? onTap,
    required String type,
  }) {
    return InkWell(
      splashColor: Colors.black,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 70, 69, 69), width: 2),
              color: type == Boxs.BUTTON_LEFT ? Colors.pink : Colors.lightBlue,
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}
