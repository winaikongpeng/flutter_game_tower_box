

import 'package:equatable/equatable.dart';
import 'package:flutter_game_tower_box/game_tower_box/game_tower_box.dart';


abstract class GameTowerBoxEvent extends Equatable {
  const GameTowerBoxEvent();

  @override
  List<Object> get props => [];
}


class  GenerateRandomBoxs extends GameTowerBoxEvent{
  
}

class  DestroyBox extends GameTowerBoxEvent{
  final List<BoxModel> boxs;
  final BoxModel destroy;
 const DestroyBox({required this.boxs , required this.destroy});
  
}