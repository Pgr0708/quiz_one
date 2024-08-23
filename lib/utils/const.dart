import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../screens/home_screen.dart';
import '../subparts/leaderboard_subparts/all_monthly_today.dart';

final kBaseColorOne = Color(0xFF481E14);
final Color kBaseColorTwo = Colors.black;
const kContColor = Color(0xFFF2613F);
const kTitleTextColor = Color(0xffDADDB1);
const kSubTextColor = Color(0xFFB3A492);
const kSubSubTextColor = Color(0xFFD6C7AE);
final kTitleColor=Color(0xffCD5C08).withOpacity(0.5);
const kPink = Colors.pink;
const pinkAccent = Colors.pinkAccent;
const kBlueGreyBack = Color(0xFF2D2D2D);
final kWhite = Colors.grey.withOpacity(0.2);
const commonLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.0,
      0.5,
      0.8,
    ],
    colors: [
      Color(0xFF9B3922),
      Color(0xffCD5C08),
      Color(0xFFF2613F),
      // Color(0xFFDD761C),
    ]);

class Appbar1 extends StatelessWidget implements PreferredSizeWidget {
  const Appbar1({super.key, required this.text, required this.isBackButton, required this.isBottom, required this.isActions});
  final String text;
  final bool isBackButton;
  final bool isBottom;
  final bool isActions;
  // final Widget? bottom;
  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight + (isBottom ? 50.0 : 0.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:isBackButton? IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: kTitleTextColor,
            size: 30,
          )):null,
      elevation: 0.0,
      // toolbarHeight:isBottom?150:80 ,
      backgroundColor: kBaseColorOne,
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [isActions?Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: GestureDetector(
          onTap: () {Get.to(() => HomeScreen());},
          child: Text(LKeys.skip.tr,
              style: MyTextStyle.poppinsSemiBold(
                  size: 15, color: kSubSubTextColor)),
        ),
      ):Container(),],
      title: Center(
        child: Text(
          text,
          style: MyTextStyle.poppinsMedium(color: kTitleTextColor, size: 18),
          // style: TextStyle(
          //     color: widget.titlecolor, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      bottom: isBottom?const BuildLeaderboardHeader(isExamRow: true,):null,
    );
  }
}

//
// class Languages extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
//     'en_US': englishStrings,
//   };
// }

final backbutton = IconButton(
  icon: const Icon(Icons.arrow_back, color: Colors.white),
  onPressed: () {
    Get.back();
  },
  iconSize: 24.0,
  color: kTitleTextColor,
);
