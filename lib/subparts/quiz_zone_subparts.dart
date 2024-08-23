import 'package:elite_quiz/controller/quiz_zone_max_min_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../utils/extentions/image_extention.dart';
import '../utils/const.dart';
import '../utils/extentions/font_extention.dart';

class QuizZoneSubPart extends StatelessWidget {
  const QuizZoneSubPart(
      {super.key,
      required this.typename,
      required this.subcate,
      required this.moreview,
      required this.imgurl});
  final String typename;
  final int subcate;
  final Function moreview;
  final String imgurl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(decoration: BoxDecoration(border:
          Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),              borderRadius: BorderRadius.circular(10),
          ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width/7,
                height:  MediaQuery.of(context).size.width/7,
                decoration: BoxDecoration(
                  color: kWhite,
                ),
                child: Image(
                  image: AssetImage(imgurl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  typename,
                  style: MyTextStyle.poppinsRegular(
                      size: 20, color: kSubTextColor),
                ),
                Text(
                  "${LKeys.subCategories.tr} ${subcate}",
                  style: MyTextStyle.poppinsRegular(
                      size: 20, color: kSubTextColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey)),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    CupertinoIcons.forward,
                    color: Colors.grey,
                    size: 25,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class QuizZonMaxMin extends StatelessWidget {
  QuizZonMaxMin({super.key});
  @override
  Widget build(BuildContext context) {
    QuizZonMaxMinController controller = QuizZonMaxMinController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Stack(children: [
            Container(
              height: controller.ispressed == false
                  ? MediaQuery.of(context).size.height / 5 - 5
                  : MediaQuery.of(context).size.height / 2.1 - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhite,
              ),
              // padding: const EdgeInsets.only(
              //   bottom: 10.0,
              // ),
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuizZoneSubPart(
                    typename: LKeys.generalKnowledge.tr,
                    subcate: 3,
                    imgurl: MyImages.personOne.tr,
                    moreview: () {},
                  ),
                  QuizZoneSubPart(
                    typename: LKeys.sports.tr,
                    subcate: 2,
                    imgurl: MyImages.personTwo.tr,
                    moreview: () {},
                  ),
                  controller.ispressed == true
                      ? QuizZoneSubPart(
                          typename: LKeys.news.tr,
                          subcate: 1,
                          imgurl: MyImages.personThree.tr,
                          moreview: () {},
                        )
                      : Container(),
                  controller.ispressed == true
                      ? QuizZoneSubPart(
                          typename: LKeys.music.tr,
                          subcate: 47,
                          imgurl: MyImages.personOne.tr,
                          moreview: () {},
                        )
                      : Container(),
                  controller.ispressed == true
                      ? QuizZoneSubPart(
                          typename: LKeys.history.tr,
                          subcate: 5,
                          imgurl: MyImages.personTwo.tr,
                          moreview: () {},
                        )
                      : Container(),
                ],
              ),
            ),
            Positioned(
              top:  controller.ispressed == false
                  ? (MediaQuery.of(context).size.height / 5)-24
                  : (MediaQuery.of(context).size.height / 2.1)-28,
              left: (MediaQuery.of(context).size.width / 2)-36,
              child: GestureDetector(
                onTap: () {
                  controller.press();
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kBlueGreyBack,),
                    padding: EdgeInsets.all(5),
                    child: Container(height: 40,width: 40,clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(30),),
                      child: Icon(
                        controller.ispressed == false
                            ? Icons.keyboard_arrow_down_sharp
                            : Icons.keyboard_arrow_up_sharp,
                        color: kPink,
                        size: 35,
                      ),
                    )),
              ),
            ),
          ]),
        );
      }
    );
  }
}

// right: 180.0,
// top: ispressed == false ? 175 : 440,
