
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tower_box_event.dart';
part 'tower_box_state.dart';

class TowerBoxBloc extends Bloc<TowerBoxEvent, TowerBoxState> {
  TowerBoxBloc() : super(TowerBoxInitial()) {
    on<TowerBoxEvent>((event, emit) {
    
    });
  }
}
