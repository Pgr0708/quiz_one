import 'package:elite_quiz/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../subparts/create_room_subparts.dart';
import '../subparts/home_screen_subparts/join_room_subpart.dart';
import '../utils/extentions/font_extention.dart';

class GroupBattle1 extends StatelessWidget {
  const GroupBattle1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Pink,
      appBar: Appbar1(text: LKeys.groupBattle.tr, isBackButton: true, isBottom: false, isActions: false,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: Device.height/1.5),
              OnlyTextContainer(
                text: LKeys.createRoom.tr,
                func: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // Enable scrolling if needed
                    builder: (context) =>  CreateGroupBattleBottomSheet(),
                  );
                },
                colorchange: false,
              ),
              OnlyTextContainer(
                text: LKeys.joinRoom.tr,
                func: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // Enable scrolling if needed
                    builder: (context) => const JoinRoomBottomSheet(),
                  );
                },
                colorchange: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnlyTextContainer extends StatelessWidget {
  const OnlyTextContainer(
      {super.key,
      required this.text,
      required this.func,
      required this.colorchange});
  final String text;
  final VoidCallback func;
  final bool colorchange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          func();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4,),
          child: Container(
            height: 45,
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: colorchange ? Colors.blueGrey : kPink,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                text,
                style:
                    MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
              ),
            ),
          ),
        ));
  }
}
