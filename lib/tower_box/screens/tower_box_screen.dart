import 'package:flutter/material.dart';
import 'tower_box_landscape.dart';
import 'tower_box_portrait.dart';

class TowerBoxScreen extends StatefulWidget {
  const TowerBoxScreen({super.key});

  @override
  State<TowerBoxScreen> createState() => _TowerBoxScreenState();
}

class _TowerBoxScreenState extends State<TowerBoxScreen> {
  // @override
  // Widget build(BuildContext context) => OrientationBuilder(
  //       builder: ((context, orientation) {
  //         final isPortrait = orientation == Orientation.portrait;
  //         return isPortrait
  //             ? const GameBoxPortraitScreen()
  //             : const GameBoxLandScapeScreen();
  //       }),
  //     );
  //! if you run on mobile or tablet please uncomment and remove this method
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait = screenWidth < 501 ? true : false;
    return isPortrait ? const TowerBoxPoertrait() : const TowerBoxLandScape();
  }
}
