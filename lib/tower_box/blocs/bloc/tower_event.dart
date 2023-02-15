part of 'tower_bloc.dart';

abstract class TowerEvent extends Equatable {
  const TowerEvent();

  @override
  List<Object?> get props => [];
}

class CreateRandomBoxs extends TowerEvent {}

class UpdateBoxs extends TowerEvent {}

class DeleteBoxs extends TowerEvent {
  final TowerBoxModel box;
  const DeleteBoxs({required this.box});
  @override
  List<Object> get props => [box];
}
