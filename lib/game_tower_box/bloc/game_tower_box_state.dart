// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_game_tower_box/game_tower_box/models/box_model.dart';

enum TowerStatus {
  empty,
  generateSuccess,
  failure,
  process,
  endprocess,
  complete,
  update
}

class GameTowerBoxState extends Equatable {
  const GameTowerBoxState(
      {this.boxs = const [],
      this.boxIds = const {},
      this.towerStatus = TowerStatus.empty,
      this.message = ''});
  final List<BoxModel> boxs;
  final Set<int> boxIds;
  final TowerStatus towerStatus;
  final String message;

  @override
  List<Object> get props => [];

  GameTowerBoxState copyWith({
    List<BoxModel>? boxs,
    Set<int>? boxIds,
    TowerStatus? towerStatus,
    String? message,
  }) {
    return GameTowerBoxState(
      boxs: boxs ?? this.boxs,
      boxIds: boxIds ?? this.boxIds,
      towerStatus: towerStatus ?? this.towerStatus,
      message: message ?? this.message,
    );
  }
}
