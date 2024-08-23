import 'package:elite_quiz/subparts/funNlearn_subparts/scientific_screen.dart';
import 'package:elite_quiz/utils/const.dart';
import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../subparts/quiz_zone_subparts.dart';

class FunNLearnScreen extends StatefulWidget {
  const FunNLearnScreen({super.key});

  @override
  State<FunNLearnScreen> createState() => _FunNLearnScreenState();
}

class _FunNLearnScreenState extends State<FunNLearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(
        text: LKeys.funAndLearn.tr,
        isBackButton: false,
        isBottom: false,
        isActions: false,
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.blueGrey.withOpacity(0.5),
          width: Device.width,
          height: Device.height,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScientificScreen()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: index == 0 ? 8 : 4, bottom: 4),
                child: Container(
                  margin: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(
                      bottom: 0.0,
                    ),
                    margin: const EdgeInsets.only(bottom: 0),
                    child: QuizZoneSubPart(
                      typename: LKeys.generalKnowledge.tr,
                      subcate: 3,
                      imgurl: MyImages.personOne,
                      moreview: () {},
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
  // Widget text(String text,double size,Color color){
  //   return Text(text,style: TextStyle(fontSize: size,color:color  ,fontWeight: FontWeight.w500,),);
  // }
}
