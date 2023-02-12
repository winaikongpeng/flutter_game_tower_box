import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/game_box/models/box_model.dart';
import '../../core/constants/failure.dart';
import 'game_box_event.dart';
import 'game_box_state.dart';

class GameBoxBloc extends Bloc<GameBoxEvent, GameBoxState> {
  GameBoxBloc() : super(Initialzed()) {
    on<GenerateRandomBoxEvent>(_onGenerateRadomBoxs);
  }

  void _onGenerateRadomBoxs(
      GenerateRandomBoxEvent event, Emitter<GameBoxState> emit) {
//        Application จะต้อง Random กล่องจำนวน 10 กล่องออกมา โดยประกอบไปด้วย กล่องสีชมพู และสีฟ้า (ใช้สีอื่นได้ถ้าต้องการ)
// กล่องที่ 10 จะเป็นกล่องลักษณะพิเศษ ลายข้าวหลามตัด

    try {
      final boxs = List<BoxModel>.generate(Boxs.LENGTH, _checkGeneratedBox);
      if (boxs.isNotEmpty) {
        emit(GenerateRandomBoxStateSuccess(boxs: boxs));
      } else {
        emit(ErrorState(message: ErrorMessage.UNKHOW_ERROR));
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  BoxModel _checkGeneratedBox(int index) => (index == Boxs.LENGTH - 1)
      ? BoxModel(index: index, styleBox: Boxs.LASTED_BOX)
      : BoxModel(
          index: index,
          styleBox: _randomStringTwoValues(),
        );

  String _randomStringTwoValues() {
    final random = Random();
    final listRandomStyles = <String>[Boxs.FIRST_BOX, Boxs.SECOND_BOX];
    int index = random.nextInt(listRandomStyles.length);
    return listRandomStyles[index];
  }
}

class GenerateRandomBoxEvent extends GameBoxEvent {}

class GenerateRandomBoxStateSuccess extends GameBoxState {
  List<BoxModel> boxs;
  GenerateRandomBoxStateSuccess({required this.boxs});
}
