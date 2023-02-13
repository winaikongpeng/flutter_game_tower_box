import 'package:flutter/material.dart';

import '../../core/constants/box_constant.dart';
import '../../core/widgets/box_widget.dart';

class GameBoxLandScapeScreen extends StatefulWidget {
  const GameBoxLandScapeScreen({super.key});

  @override
  State<GameBoxLandScapeScreen> createState() => _GameBoxLandScapeScreenState();
}

class _GameBoxLandScapeScreenState extends State<GameBoxLandScapeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(context, type: Boxs.BUTTON_LEFT, onTap: () {}),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
          ),
          _buildButton(context, type: Boxs.BUTTON_RIGTH, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String type, required void Function()? onTap}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      child: BoxWidgets.buttonCirle(type: type, onTap: onTap),
    );
  }
}
