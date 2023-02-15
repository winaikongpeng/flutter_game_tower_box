import 'package:flutter/material.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/core/widgets/box_widget.dart';

class TowerBoxPoertrait extends StatefulWidget {
  const TowerBoxPoertrait({super.key});

  @override
  State<TowerBoxPoertrait> createState() => _TowerBoxPoertraitState();
}

class _TowerBoxPoertraitState extends State<TowerBoxPoertrait> {
  final GlobalKey<TooltipState> tooltipkeyLeft = GlobalKey<TooltipState>();
  final GlobalKey<TooltipState> tooltipkeyRigth = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
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
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BoxWidgets.buttonCircle(
                key: tooltipkeyLeft,
                type: Boxs.BUTTON_LEFT,
                onTap: () {
                  tooltipkeyLeft.currentState?.ensureTooltipVisible();
                },
                onLongPress: () {
                  print('onLongPress rigth portrait');
                }),
            BoxWidgets.buttonCircle(
                key: tooltipkeyRigth,
                type: Boxs.BUTTON_RIGTH,
                onTap: () {
                  tooltipkeyRigth.currentState?.ensureTooltipVisible();
                },
                onLongPress: () {
                  print('onLongPress rigth portrait');
                }),
          ],
        ),
      ),
    );
  }
}
