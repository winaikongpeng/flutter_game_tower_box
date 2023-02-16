import 'package:flutter/material.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/core/widgets/box_widget.dart';
import 'package:flutter_game_tower_box/tower_box/models/tower_box_model.dart';

class TowerBoxListPortrait extends StatelessWidget {
  const TowerBoxListPortrait({
    required this.boxs,
    super.key,
  });
  final List<TowerBoxModel> boxs;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        // height: MediaQuery.of(context).size.height * 0.75,
        color: Colors.transparent,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            reverse: true,
            shrinkWrap: true,
            itemCount: boxs.length,
            itemBuilder: (context, index) {
              String styleBox = boxs[index].styleBox;
              if (styleBox == Boxs.LASTED_BOX) {
                return Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
                  child: BoxWidgets.lastedBox(
                      size: MediaQuery.of(context).size.width),
                );
              }
              return BoxWidgets.customBox(
                  styleBox: styleBox,
                  size: MediaQuery.of(context).size.width * 0.2);
            
            }),
      ),
    );
  }
}
