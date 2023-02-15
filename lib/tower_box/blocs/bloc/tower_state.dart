part of 'tower_bloc.dart';

class TowerState extends Equatable {
  final List<TowerBoxModel> boxs;
  const TowerState({this.boxs = const <TowerBoxModel>[]});

  @override
  List<Object> get props => [boxs];
}
