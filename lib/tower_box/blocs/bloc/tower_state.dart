part of 'tower_bloc.dart';

class TowerState extends Equatable {
  final List<TowerBoxModel> boxs;
  final int total;
  const TowerState({this.boxs = const <TowerBoxModel>[], this.total = 0});

  @override
  List<Object> get props => [boxs];
}
