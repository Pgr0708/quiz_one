import 'package:elite_quiz/controller/one_vs_one_controller.dart';
import 'package:elite_quiz/screens/group_battel_screen_one.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../subparts/home_screen_subparts/scoreboard.dart';
import '../subparts/joinroombottomsheet_subparts.dart';
import '../utils/const.dart';

class V1vs1Screen extends StatelessWidget {
   V1vs1Screen({super.key});
  // String? _selectedSubCategory;
  List<String> categories = [LKeys.sports.tr, LKeys.history.tr, LKeys.science.tr, LKeys.movies.tr];
  List<String> subCategories = [LKeys.cycling.tr, LKeys.football.tr, LKeys.basketball.tr];
  @override
  Widget build(BuildContext context) {
    OneVsOneController controller = OneVsOneController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: kPink,
          appBar: Appbar1(text: LKeys.randomBattle.tr, isBackButton: true, isBottom: false, isActions: false),
          body: SingleChildScrollView(scrollDirection:Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/3),
                  Align(
                    alignment: Alignment.topLeft,
                    child:  Text(
                      LKeys.selectCategory.tr,
                      style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(padding:const EdgeInsets.symmetric(horizontal: 10) ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: kWhite,),
                    child:DropdownButtonFormField<String>(
                      value: controller.selectedCategory,
                      hint:  Text(LKeys.history.tr,style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),
                      items: categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category,style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if(value == null){
                          value = LKeys.history.tr;
                        }
                        controller.selectCate(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height:MediaQuery.of(context).size.height/9 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryEntryfees(firstText: LKeys.entryFees.tr,secText: LKeys.fiveCoins.tr, currentcoins: true,),
                        const VerticalDividerLine(white: false,),
                        CategoryEntryfees(firstText: LKeys.currentCoins.tr,secText: "498 Coins", currentcoins: true,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OnlyTextContainer(text: LKeys.letsPlayGame, colorchange: false, func: (){},),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(LKeys.or.tr,style:MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),
                  const SizedBox(
                    height: 10,
                  ),
                  OnlyTextContainer(text: LKeys.playWithFriends.tr,func:(){
                    Get.to( () => const GroupBattle1());
                  }, colorchange: false,),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
