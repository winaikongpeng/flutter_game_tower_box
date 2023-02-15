// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/core/constants/box_constant.dart';
import 'package:flutter_game_tower_box/game_tower_box/game_tower_box.dart';

class GameTowerBoxScreen extends StatelessWidget {
  const GameTowerBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => GameTowerBoxBloc()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game Tower Box',
        home: _GameTowerBoxMainScreen(),
      ),
    );
  }
}

class _GameTowerBoxMainScreen extends StatefulWidget {
  const _GameTowerBoxMainScreen({super.key});

  @override
  State<_GameTowerBoxMainScreen> createState() =>
      _GameTowerBoxMainScreenState();
}

class _GameTowerBoxMainScreenState extends State<_GameTowerBoxMainScreen> {
  @override
  void initState() {
    context.read<GameTowerBoxBloc>().add(GenerateRandomBoxs());
    // print('initState');
    super.initState();
  }

  void _destroyLeftBox(List<BoxModel> boxs, BoxModel destroy) {
    context
        .read<GameTowerBoxBloc>()
        .add(DestroyBox(boxs: boxs, destroy: destroy));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GameTowerBoxBloc, GameTowerBoxState>(
          listener: (ctx, state) {

            
          },
          builder: (context, state) {
            if (state.towerStatus == TowerStatus.empty) {
              return const Center(child: Text(''));
            } else if (state.towerStatus == TowerStatus.failure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text(state.message)),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<GameTowerBoxBloc>()
                            .add(GenerateRandomBoxs());
                      },
                      child: const Text(Boxs.MESSAGE_TRY_AGAIN),
                    ),
                  )
                ],
              );
            } else if (state.towerStatus == TowerStatus.complete) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(child: Text('MISSION COMPLETE')),
                  const SizedBox(height: 20),
                  const Center(child: Text('TIME : 10:02 Munites')),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<GameTowerBoxBloc>()
                            .add(GenerateRandomBoxs());
                      },
                      child: const Text(Boxs.MESSAGE_TRY_AGAIN),
                    ),
                  )
                ],
              );
            }

            // else  if (state.towerStatus == TowerStatus.process) {

            //   }

            else if (state.towerStatus == TowerStatus.endprocess) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pop(context);
              });
            } else if (state.towerStatus == TowerStatus.generateSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: state.boxs.length,
                      itemBuilder: (context, index) {
                        String type = state.boxs[index].styleBox;
                  
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(type),
                          ),
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if(state.boxs.isNotEmpty){
                               _destroyLeftBox(state.boxs, state.boxs[0]);
                            }
                           
                          },
                          child: const Text('LEFT')),
                      const SizedBox(width: 30),
                      ElevatedButton(
                          onPressed: () {
                            // print(state.boxs.length);
                          },
                          child: const Text('Rigth')),
                    ],
                  )
                ],
              );
            }

            return const SizedBox();
          }),
    );
  }
}
