



import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_tower_box/core/widgets/box_widget.dart';
import 'package:flutter_game_tower_box/game_box/bloc/game_box_event.dart';
import 'package:flutter_game_tower_box/game_box/bloc/game_box_state.dart';
import 'package:flutter_game_tower_box/game_box/models/box_model.dart';
import '../../core/constants/box_constant.dart';
import '../bloc/game_box_bloc.dart';

class GameBoxPortraitScreen extends StatefulWidget {
  const GameBoxPortraitScreen({super.key});

  @override
  State<GameBoxPortraitScreen> createState() => _GameBoxPortraitScreenState();
}

class _GameBoxPortraitScreenState extends State<GameBoxPortraitScreen> {
 final ScrollController _scrollController = ScrollController(); 
 final GlobalKey<TooltipState> tooltipkeyLeft = GlobalKey<TooltipState>();
  final GlobalKey<TooltipState> tooltipkeyRigth = GlobalKey<TooltipState>();
  // late Timer _timer;

  //  Timer? countdownTimer;
  // Duration duration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
  SchedulerBinding.instance.addPostFrameCallback((_) {
  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
});

  }

  // void setCountDown() {
  //   const reduceSecondsBy = 1;
  //   setState(() {
  //     final seconds = duration.inSeconds - reduceSecondsBy;
  //     if (seconds < 0) {
  //       countdownTimer!.cancel();
  //     } else {
  //       duration = Duration(seconds: seconds);
  //     }
  //   });
  // }

  // void startTimer() {
  //   countdownTimer =
  //       Timer.periodic(const Duration(seconds: 1), (_) =>setCountDown() );
  // }

  // void stopTimer() {
  //   setState(() => countdownTimer!.cancel());
  // }

  //  void resetTimer() {
  //   stopTimer();
  //   setState(() => duration = const Duration(seconds: 2));
  // }

  @override
  Widget build(BuildContext context) {
    //  String strDigits(int n) => n.toString().padLeft(1, '0');
    //  final seconds = strDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
// GestureDetector(
//   onTap: () {
//     tooltipkeyRigth.currentState?.ensureTooltipVisible();
//   },
//   // onLongPress: () {
//   //   print("show dialog");
//   // },
//   onLongPressStart: (start) async{
//     print('start');
  
//     startTimer();

//     DialogWidget.showProgressDialog(context , seconds);

//     await Future.delayed(const Duration(seconds: 2), (){
      
//       print('end');
//        Navigator.pop(context);
//        resetTimer();

//     });
//   },

//   child: Text("dialog"),
// ),



            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            BlocConsumer<GameBoxBloc, GameBoxState>(
              builder: (context, state) {
                if (state is GenerateRandomBoxStateSuccess) {
                  return _generateBox(context, boxs: state.boxs);
                }
                return const SizedBox();
              },
              listener: (ctx, state) {
                if (state is ErrorState) {
                  // ignore: avoid_print
                  print(state.message);
                }
               else if (state is ProgressState)  {

              
                 

 





                }
              else  if (state is EndProgressState) {
                  // ignore: avoid_print
                Navigator.of(ctx);
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildButton(context),
    );
  }



  Widget _buildButton(BuildContext context ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BoxWidgets.buttonCircle(
            key:tooltipkeyLeft ,
            
            type: Boxs.BUTTON_LEFT, onTap: () {
             tooltipkeyLeft.currentState?.ensureTooltipVisible();
          },onLongPress: (){
                // print('onLongPress left portrait');
               context.read<GameBoxBloc>().add(DestroyBoxEvent(index: 0 , type: ''));
          }
          
          ),
          BoxWidgets.buttonCircle(
             key:tooltipkeyRigth ,
            type: Boxs.BUTTON_RIGTH, onTap: () {
              tooltipkeyRigth.currentState?.ensureTooltipVisible();
          },
          onLongPress: (){
              // print('onLongPress rigth portrait');
          }),
        ],
      ),
    );
  }

  Widget _generateBox(BuildContext context, {required List<BoxModel> boxs}) {
    return Row(
crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const   Padding(
           padding:  EdgeInsets.only(bottom: 30 , right: 10),
       
           child: Icon(Icons.arrow_right, size: 60, color: Colors.white,),
           
          
         ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.transparent,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              physics: const NeverScrollableScrollPhysics(),
              reverse: true,
              shrinkWrap: true,
              itemCount: boxs.length,
              itemBuilder: ((context, index) {
                String styleBox = boxs[index].styleBox;
                if (styleBox == Boxs.LASTED_BOX) {
                  return BoxWidgets.lastedBox(
                      size: MediaQuery.of(context).size.width);
                }
                return BoxWidgets.customBox(
                    styleBox: styleBox,
                    size: MediaQuery.of(context).size.width * 0.2);
              }),
            ),
          ),
        ),
       const Padding(
           padding:  EdgeInsets.only(bottom: 30 , left: 10),
           child: Icon(Icons.arrow_left, size: 60,color: Colors.white,),
         ),
       
      ],
    );
  }
}
