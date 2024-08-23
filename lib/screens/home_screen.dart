import 'package:elite_quiz/screens/one_vs_one_screen.dart';
import 'package:elite_quiz/screens/group_battel_screen_one.dart';
import 'package:elite_quiz/screens/leaderboard_screen.dart';
import 'package:elite_quiz/screens/setting_screen.dart';
import 'package:elite_quiz/screens/start_quiz_screen.dart';
import 'package:elite_quiz/subparts/home_screen_subparts/dp.dart';
import 'package:elite_quiz/subparts/quiz_zone_subparts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/extentions/image_extention.dart';
import '../localization/localization.dart';
import '../subparts/home_screen_subparts/appbar_icon_button.dart';
import '../subparts/home_screen_subparts/scoreboard.dart';
import '../subparts/home_screen_subparts/titlequiz_with_grid.dart';
import '../utils/const.dart';
import '../utils/extentions/font_extention.dart';
import 'exam_screen.dart';
import "fun_and_learn_screen.dart";


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueGreyBack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        elevation: 0,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              const Dp(
                height: 70,
                width: 70,
                color: Colors.blueGrey,
                borderwidth: 1,
                margin: 0,
                backgroundcolor: Colors.transparent, widget: SizedBox(), isCamera: true,
              ),
              Dp(
                height: 60,
                width: 60,
                color: Colors.blueGrey,
                borderwidth: 0,
                widget: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child:Image(
                        image: AssetImage(MyImages.personOne.tr),
                        fit: BoxFit.cover)),
                margin: 5,
                backgroundcolor: kPink, isCamera: true,                          ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LKeys.helloGuest,
                    style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                  ),
                  Text(
                    LKeys.letsPlayGame.tr,
                    style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Appbaractions(leaderboardclick:(){Get.to( () => const LeaderboardScreen());} ,settingclick: (){Get.to(() => SettingScreen());},),
        )],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: commonLinearGradient, boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.5), // adjust the opacity to control the shadow intensity
                        offset: const Offset(0, 10), // adjust the offset to control the shadow position
                        blurRadius: 20,
                        spreadRadius: 2,// adjust the blur radius to control the shadow spread
                      ),
                    ],
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScoreBoard(label: LKeys.rank.tr, score:200, scorepresent: true, subtext: '',),
                          ],
                        ),
                        const VerticalDividerLine(white: true,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScoreBoard(label: LKeys.coins.tr, score:498 , scorepresent: true, subtext: '',),
                          ],
                        ),
                        const VerticalDividerLine(white: true,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScoreBoard(label: LKeys.score.tr, score: 28, scorepresent: true, subtext: '',),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleQuiz(text: LKeys.quizZone.tr),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: const EdgeInsets.only(top: 8),
                              child:  Text(
                                LKeys.viewAll.tr,
                                style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                              ))),
                    ],
                  ),
                  QuizZonMaxMin(),
                  TitleQuizWithGrid(
                      title: LKeys.battleOfTheDay.tr,
                      crossaxiscount: 2,
                      gridtitle:[LKeys.groupBattle.tr,LKeys.oneVsOneBattle.tr],
                      subgridtext: [LKeys.groupQuizBattle.tr,LKeys.battleWithOneToOne.tr],
                      imgurl:const [MyImages.personOne,MyImages.personTwo],
                  ontap: [
                    (){ Get.to( () => const GroupBattle1());},(){ Get.to(() =>  V1vs1Screen());}], titlepresent: true,),
                  TitleQuizWithGrid(
                      title: LKeys.selfExamZone.tr,
                      crossaxiscount: 2,
                      gridtitle:[ LKeys.exam.tr,LKeys.selfChallenge.tr],
                      subgridtext: [LKeys.giveExam,LKeys.challengeYourself.tr],
                      imgurl:const [MyImages.personTwo,MyImages.personOne], titlepresent: true,
                  ontap: [(){Get.to (() => const ExamScreen());},(){Get.to (() =>  HomeScreen());}],),
                  TitleQuizWithGrid(
                      title: LKeys.playDifferentZone.tr,
                      crossaxiscount: 2,
                      gridtitle:[LKeys.dailyQuiz.tr,LKeys.funAndLearn.tr,LKeys.guessWord.tr,LKeys.audioQuestions.tr,LKeys.mathMania.tr,LKeys.trueFalse.tr] ,
                      subgridtext:[LKeys.dailyBasicQuiz.tr,LKeys.likeComprehension.tr,LKeys.funVocubulary.tr,LKeys.quizWithAudio.tr,LKeys.itMathQuiz.tr,LKeys.trueFalseQuestions.tr] ,
                      imgurl:const [MyImages.personOne,MyImages.personTwo,MyImages.personOne,MyImages.personTwo,MyImages.personOne,MyImages.personTwo,], titlepresent: true,ontap: [
                    (){
                      Get.to(() => QuizScreen(s: 3,));
                    },(){Get.to(() => const FunNLearnScreen());},
                  ],)
                ],
              ),
            )),
      ),
    );
  }
}



