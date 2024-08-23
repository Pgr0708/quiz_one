import 'package:elite_quiz/utils/const.dart';
import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexagon/hexagon.dart';
import '../localization/localization.dart';
import '../utils/extentions/font_extention.dart';
import 'group_battel_screen_one.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(text: LKeys.funLearnResult.tr,isBackButton: true,isBottom: false,isActions: false,),
      body: Container(
        height: double.infinity,
        color: Colors.blueGrey.withOpacity(0.3),
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(color: kWhite,borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(LKeys.wowFantasticJob.tr,style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),
                        const Text("PARTH",style: TextStyle(color: kPink,fontWeight: FontWeight.w900,fontSize: 30)),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Text(LKeys.achievedMastery.tr,style:MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),textAlign: TextAlign.center,),
                    const SizedBox(height: 8,),
                    Text(LKeys.keepOutstandingWork.tr,style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),
                    const SizedBox(height: 8,),
                    Stack(
                      children: [
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Container(margin:const EdgeInsets.only(top:7),
                                  child: HexagonWidget.flat(
                                    width: 185,height: 185,cornerRadius: 30,
                                    color: Colors.purple,
                                    padding: 4.0,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 12.5),
                                  child: HexagonWidget.flat(
                                    width: 175,height: 175,cornerRadius: 30,
                                    color: Colors.white,
                                    padding: 4.0,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: HexagonWidget.flat(
                                width: 170,height: 170,cornerRadius: 30,
                                color: Colors.purple,
                                padding: 4.0,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: HexagonWidget.flat(
                            width: 140,height: 140,cornerRadius: 30,
                            color: Colors.deepOrange,
                            padding: 4.0,
                            child: const Image(
                              fit: BoxFit.fill,
                              image: AssetImage(MyImages.personOne),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ScoreRankContainer(text: LKeys.fourOutFour.tr,iconname:CupertinoIcons.checkmark_square_fill ,),
                              const SizedBox(height: 6,),
                              ScoreRankContainer(text: LKeys.zeroOutFour.tr,iconname:Icons.close ,),
                            ],
                          ),
                          Container(margin: const EdgeInsets.only(bottom: 0),
                            decoration: BoxDecoration(color:kWhite,shape: BoxShape.circle, border: Border.all(color: Colors.pink,width: 8),),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(LKeys.hundredPercent.tr ,style: const TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.w500),),
                                  const Text('00:26' ,style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              ScoreRankContainer(text: LKeys.zero.tr,iconname:Icons.star,),
                              const SizedBox(height: 6,),
                              ScoreRankContainer(text: LKeys.four.tr,iconname:Icons.ac_unit_sharp ,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4,),
            OnlyTextContainer(text: LKeys.reviewAnswers.tr, colorchange: false, func: (){}),
            const SizedBox(height: 4,),
            OnlyTextContainer(text: LKeys.shareScore.tr, colorchange: false, func: (){}),
            const SizedBox(height: 4,),
            OnlyTextContainer(text: LKeys.home.tr, colorchange: false, func: (){}),
          ],
        ),
      ),
    );
  }
}



class ScoreRankContainer extends StatelessWidget {
  const ScoreRankContainer({super.key, required this.text, required this.iconname});
 final String text;
 final IconData iconname;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      padding: const EdgeInsets.all(4),decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.2),borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconname,size: 23,color: Colors.grey[900],),
          const SizedBox(width: 4,),
          Text(text,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.grey[900]),)
        ],
      ),
    );
  }
}
