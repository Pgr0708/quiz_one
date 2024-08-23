
import 'package:elite_quiz/controller/radio_button_row_controller.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../localization/localization.dart';
import '../../utils/const.dart';

class BuildLeaderboardHeader extends StatelessWidget implements PreferredSizeWidget{
  const BuildLeaderboardHeader({super.key, required this.isExamRow});

 final bool isExamRow;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    RadioButtonRowController controller = RadioButtonRowController();
    return GetBuilder(
        init:controller,
        builder: (controller)
    {
      return Padding(
        padding: isExamRow
            ? const EdgeInsets.symmetric(horizontal: 10.0)
            : const EdgeInsets.all(0),
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kContColor,
          ),
          child: RadioButtonRow(isExamRow: isExamRow,controller: controller,),
        ),
      );
    }
    );
  }
}



class RadioButtonRow extends StatelessWidget {
  const RadioButtonRow({super.key, required this.isExamRow, required this.controller});
  final bool isExamRow;
  final RadioButtonRowController controller;
  @override
  Widget build(BuildContext context) {
   return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:!isExamRow? [
            _buildRadioButtonOne(LKeys.allTime.tr, PeriodOne.alltime,controller,context),
            _buildRadioButtonOne(LKeys.monthly.tr, PeriodOne.monthly,controller,context),
            _buildRadioButtonOne(LKeys.todays.tr, PeriodOne.today,controller,context),
          ]:[
            _buildRadioButtonTwo(LKeys.todays.tr, PeriodTwo.today,controller ,context),
            _buildRadioButtonTwo(LKeys.completed.tr, PeriodTwo.completed,controller,context),
          ],
        );
  }

  Widget _buildRadioButtonOne(String text,PeriodOne periodOne,RadioButtonRowController controller,BuildContext context) {
    return Container(
      height: 50,
      width:  (MediaQuery.of(context).size.width / 3)-6.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: controller.selectedPeriodOne == periodOne ? kTitleColor : kContColor,
      ),

      // margin: EdgeInsets.only(top: 4),
      child: GestureDetector(
        onTap: () {
          controller.selectOne(periodOne);
        },
        // style:ButtonStyle(backgroundColor:_selectedPeriod ==period?MaterialStatePropertyAll(Pink):MaterialStatePropertyAll(Colors.grey.withOpacity(0.2)) , padding:MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 41.0, vertical: 14.0),)  ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: _selectedPeriod == period
        //       ? ktitlecolor
        //       : kcontcolor,
        // padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/21, vertical: 10.0),
        //   textStyle: const TextStyle(
        //     fontSize: 15.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   elevation: 0,
        // ),
        child: Center(
          child: Text(text,
              style: MyTextStyle.poppinsRegular(
                  color:
                   controller.selectedPeriodOne == periodOne? kTitleTextColor : kSubTextColor,
                  size: 20)),
        ),
      ),
    );
  }
  Widget _buildRadioButtonTwo(String text,PeriodTwo periodTwo,RadioButtonRowController controller,BuildContext context) {
      return Container(
        height: 50,
        width:  (MediaQuery.of(context).size.width / 2)-10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: controller.selectedPeriodTwo == periodTwo ? kTitleColor : kContColor,
        ),

        child: GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print('Exam pressed');
            }
controller.selectTwo(periodTwo);
            },
          // style:ButtonStyle(backgroundColor:_selectedPeriod ==period?MaterialStatePropertyAll(Pink):MaterialStatePropertyAll(Colors.grey.withOpacity(0.2)) , padding:MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 41.0, vertical: 14.0),)  ),
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: _selectedPeriod == period
          //       ? ktitlecolor
          //       : kcontcolor,
          // padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/21, vertical: 10.0),
          //   textStyle: const TextStyle(
          //     fontSize: 15.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   elevation: 0,
          // ),
          child: Center(
            child: Text(text,
                style: MyTextStyle.poppinsRegular(
                    color:
                   controller.selectedPeriodTwo == periodTwo ? kTitleTextColor : kSubTextColor,
                    size: 20)),
          ),
        ),
      );
    }

}
