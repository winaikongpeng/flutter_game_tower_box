import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/tower_box/models/tower_box_model.dart';
import 'package:flutter_game_tower_box/tower_box/repositories/tower_box_repository.dart';

part 'tower_event.dart';
part 'tower_state.dart';

class TowerBloc extends Bloc<TowerEvent, TowerState> {
  final TowerBoxRepository repository = TowerBoxRepository();
  TowerBloc() : super(const TowerState()) {
    on<CreateRandomBoxs>(_onCretaeRandom);
    on<DeleteBoxs>(_onDeleteBox);
  }

  void _onCretaeRandom(CreateRandomBoxs event, Emitter<TowerState> emit) {
    final boxs = repository.generateBoxs();
    if (boxs.isNotEmpty) {
      emit(TowerState(boxs: boxs));
    }
  }

  void _onDeleteBox(DeleteBoxs event, Emitter<TowerState> emit) {
    final state = this.state;
    emit(TowerState(boxs: List.from(state.boxs)..remove(event.box)));
  }
}
