import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_game_tower_box/game_tower_box/game_tower_box.dart';
import 'package:flutter_game_tower_box/game_tower_box/repositories/game_tower_box_repository.dart';

class GameTowerBoxBloc extends Bloc<GameTowerBoxEvent, GameTowerBoxState> {
  GameTowerBoxBloc() : super(const GameTowerBoxState()) {
    on<GenerateRandomBoxs>(_generateRandomBox);
    on<DestroyBox>(_onDestroyBox);
  }

  void _generateRandomBox(
      GenerateRandomBoxs event, Emitter<GameTowerBoxState> emit) {
    try {
      final genarateRandomBox = repository.generateBoxs();
      if (genarateRandomBox.isNotEmpty) {
        // print('genarateRandomBox done');
        emit(state.copyWith(
            towerStatus: TowerStatus.generateSuccess, boxs: genarateRandomBox));
      } else {
        emit(state.copyWith(
            towerStatus: TowerStatus.failure, message: 'failure'));
        // print('genarateRandomBox fail');
      }
    } catch (e) {
      emit(state.copyWith(towerStatus: TowerStatus.failure));
      // print('genarateRandomBox error');
    }
  }

  void _onDestroyBox(DestroyBox event, Emitter<GameTowerBoxState> emit) {
 
    // print('box event all :${event.boxs.length} ');

    // List<BoxModel> newBoxs = event.boxs;

    if (event.boxs.isNotEmpty) {

      if(event.boxs.length ==1 ){
          event.boxs.removeWhere((item) => item == event.destroy) ;
      emit(state.copyWith(
            towerStatus: TowerStatus.complete, boxs: []));
      //        print('box new all :${event.boxs.length} ');
      //  print('complete');
      }
      event.boxs.removeWhere((item) => item == event.destroy) ;
      emit(state.copyWith(
            towerStatus: TowerStatus.generateSuccess, boxs: event.boxs));
            //  print('box new all :${event.boxs.length} ');

      
    }

    

    // if(){}


    

           
  }

  final GameTowerBoxRepository repository = GameTowerBoxRepository();
}
