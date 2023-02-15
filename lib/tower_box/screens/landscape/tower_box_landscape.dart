// ignore_for_file: sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/core/widgets/arrow_widget.dart';
import 'package:flutter_game_tower_box/tower_box/blocs/bloc_exports.dart';
import 'package:flutter_game_tower_box/tower_box/models/tower_box_model.dart';

import 'list_box_landscape.dart';

class TowerBoxLandScape extends StatefulWidget {
  const TowerBoxLandScape({super.key});

  @override
  State<TowerBoxLandScape> createState() => _TowerBoxLandScapeState();
}

class _TowerBoxLandScapeState extends State<TowerBoxLandScape> {
  // final GlobalKey<TooltipState> tooltipkeyLeft = GlobalKey<TooltipState>();
  // final GlobalKey<TooltipState> tooltipkeyRigth = GlobalKey<TooltipState>();
  final ScrollController _scrollController = ScrollController();

  bool _isButton1Pressed = false;
  bool _isButton2Pressed = false;
  bool _areBothButtonsPressed = false;
  bool showProgress = false;
  Timer? countdownTimer;
  Duration duration = const Duration(seconds: 2);

  void startTimer({required TowerBoxModel box}) {
    countdownTimer = Timer.periodic(
        const Duration(seconds: 1), (_) => setCountDown(box: box));
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => duration = const Duration(seconds: 2));
  }

  void setCountDown({required TowerBoxModel box}) {
    int reduceSecondsBy = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        deleteBox(box: box);
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  deleteBox({required TowerBoxModel box}) {
    if (_areBothButtonsPressed && box.styleBox.contains(Boxs.LASTED_BOX)) {
      context.read<TowerBloc>().add(DeleteBoxs(box: box));
    } else if (_isButton1Pressed && box.styleBox.contains(Boxs.FIRST_BOX)) {
      context.read<TowerBloc>().add(DeleteBoxs(box: box));
    } else if (_isButton2Pressed && box.styleBox.contains(Boxs.SECOND_BOX)) {
      context.read<TowerBloc>().add(DeleteBoxs(box: box));
    }
  }

  void _checkIfBothButtonsPressed({required TowerBoxModel box}) {
    if (_isButton1Pressed && _isButton2Pressed) {
      resetTimer();
      setState(() {
        _areBothButtonsPressed = true;
        showProgress = true;
      });
      startTimer(box: box);
    } else {
      setState(() {
        _areBothButtonsPressed = false;
      });

      if (_isButton1Pressed) {
        startTimer(box: box);
      } else {
        startTimer(box: box);
      }
    }
  }

  void onButtonReleased() {
    setState(() {
      _isButton1Pressed = false;
      _isButton2Pressed = false;
      _areBothButtonsPressed = false;
      showProgress = false;
      resetTimer();
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(1, '0');
    final seconds = strDigits(duration.inSeconds.remainder(60));
    return BlocBuilder<TowerBloc, TowerState>(
      builder: (context, state) {
        List<TowerBoxModel> boxs = state.boxs;

        if (boxs.isEmpty) {
          return const Scaffold(
            backgroundColor: Colors.grey,
            body: Center(child: Text('BOX IS EMTY')),
          );
        }

        return Scaffold(
          backgroundColor: Colors.grey,
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildButton(
                    onTapDown: (start) {
                      setState(() {
                        _isButton1Pressed = true;
                        showProgress = true;
                      });
                      _checkIfBothButtonsPressed(box: state.boxs[0]);
                    },
                    type: Boxs.BUTTON_LEFT),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                    controller: _scrollController,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      TowerBoxListLandScape(
                        boxs: boxs,
                      ),
                      showProgress
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                '$seconds ',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                      const ArrowWidget()
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: _buildButton(
                    onTapDown: (start) {
                      setState(() {
                        _isButton2Pressed = true;
                        showProgress = true;
                      });
                      _checkIfBothButtonsPressed(box: state.boxs[0]);
                    },
                    type: Boxs.BUTTON_RIGTH),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton(
      {required void Function(TapDownDetails)? onTapDown,
      required String type}) {
    return Container(
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
          onTapDown: onTapDown,
          onTapUp: (details) {
            onButtonReleased();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 70, 69, 69), width: 2),
                  color:
                      type == Boxs.BUTTON_LEFT ? Colors.pink : Colors.lightBlue,
                  shape: BoxShape.circle),
            ),
          )),
    );
  }
}
