// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/core/widgets/box_widget.dart';

class TowerBoxLandScape extends StatefulWidget {
  const TowerBoxLandScape({super.key});

  @override
  State<TowerBoxLandScape> createState() => _TowerBoxLandScapeState();
}

class _TowerBoxLandScapeState extends State<TowerBoxLandScape> {
  final GlobalKey<TooltipState> tooltipkeyLeft = GlobalKey<TooltipState>();
  final GlobalKey<TooltipState> tooltipkeyRigth = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              alignment: Alignment.bottomCenter,
              child: BoxWidgets.buttonCircle(
                  key: tooltipkeyLeft,
                  type: Boxs.BUTTON_LEFT,
                  onTap: () {},
                  onLongPress: () {}),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        String type = 'test';

                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(type),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              alignment: Alignment.bottomCenter,
              child: BoxWidgets.buttonCircle(
                  key: tooltipkeyRigth,
                  type: Boxs.BUTTON_RIGTH,
                  onTap: () {},
                  onLongPress: () {}),
            ),
          )
        ],
      ),
    );
  }
}
