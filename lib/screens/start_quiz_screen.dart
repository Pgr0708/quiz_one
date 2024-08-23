import 'package:elite_quiz/screens/result_screen.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import '../controller/baseController.dart';
import '../controller/start_quiz_controller.dart';
import '../localization/localization.dart';
import '../utils/const.dart';

class QuizScreen extends StatelessWidget {
   QuizScreen({
    super.key,
    required this.s,
  });
  final int s;
  final int duration = 20;
  final CountDownController _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    StartQuizController controller = StartQuizController(s: s);
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kBlueGreyBack,
              title: Padding(
                padding: const EdgeInsets.only(right: 58.0),
                child: Center(
                  child: CircularCountDownTimer(
                    autoStart: true,
                    duration: duration,
                    initialDuration: 0,
                    controller: _controller,
                    width: 40,
                    height: 40,
                    ringColor: Colors.pink, // initial ring color
                    ringGradient: null,
                    fillColor: Colors.grey, // final ring color
                    fillGradient: null,
                    backgroundColor: Colors.transparent,
                    backgroundGradient: null,
                    strokeWidth: 5.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                      fontSize: 25.0,
                      color: kPink,
                      fontWeight: FontWeight.bold,
                    ),
                    textFormat: CountdownTextFormat.S,
                    isReverse: true, // countdown from 10 to 0
                  ),
                ),
              ),
            ),
            body: StartQuizScreen(n: s, a: controller.a, func:(){controller.changeBody();}),
        );
      }
    );
  }
}

class StartQuizScreen extends StatelessWidget {
  final int n;
  final int a;
  final Function func;

  const StartQuizScreen({super.key, required this.n, required this.a, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlueGreyBack,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "$a",
                  style:MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                ),
                Text(
                  LKeys.slash.tr,
                  style:MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                ),
                Text(
                  "$n",
                  style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                ),
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
              child: Text(
                "Question 1",
                style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
           const OptionOfQuestions(text:'Option 1?'),
            const OptionOfQuestions(text:'Option 2?'),
            const OptionOfQuestions(text:'Option 3?'),
            const OptionOfQuestions(text:'Option 4?'),
            OnlyTextContainer(
              text: LKeys.next.tr,
              colorchange: false,
              func: func,
            )
          ],
        ),
      ),
    );
  }
}

class OnlyTextContainer extends StatelessWidget {
  final String text;
  final bool colorchange;
  final Function func;

  const OnlyTextContainer({super.key, required this.text, required this.colorchange, required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: double.infinity,height: 60,
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        decoration: BoxDecoration(
          // color: colorchange ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
          gradient: commonLinearGradient,
        ),
        child: Center(
          child: Text(
            text,
            style:MyTextStyle.poppinsSemiBold(color: kTitleTextColor,size: 15)
          ),
        ),
      ),
    );
  }
}

class OptionOfQuestions extends StatelessWidget {
  const OptionOfQuestions({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhite),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 28.0, vertical: 10),
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

