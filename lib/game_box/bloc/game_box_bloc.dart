
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/game_box/models/box_model.dart';
import '../../core/constants/failure.dart';
import 'game_box_event.dart';
import 'game_box_state.dart';

class GameBoxBloc extends Bloc<GameBoxEvent, GameBoxState> {
  GameBoxBloc() : super(Initialzed()) {
    on<GenerateRandomBoxEvent>(_onGenerateRadomBoxs);
    on<DestroyBoxEvent>(_onDestroyBox);
  }

  void _onGenerateRadomBoxs(
      GenerateRandomBoxEvent event, Emitter<GameBoxState> emit) {
    try {
      final boxs = List<BoxModel>.generate(Boxs.LENGTH, checkGeneratedBox);
      if (boxs.isNotEmpty) {
        emit(GenerateRandomBoxStateSuccess(boxs: boxs));
      } else {
        emit(ErrorState(message: ErrorMessage.UNKHOW_ERROR));
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
  
  Future<void> _onDestroyBox(
      DestroyBoxEvent event, Emitter<GameBoxState> emit) async {
       if (event.type == Boxs.FIRST_BOX) {
emit(ProgressState());
        await Future.delayed(const Duration(seconds: 2), (){
          
        });
         
       }
        
    
  }


}






