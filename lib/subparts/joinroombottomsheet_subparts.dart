import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../utils/const.dart';
import '../utils/extentions/font_extention.dart';

class Grid4Join extends StatelessWidget {
  const Grid4Join({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height/1.5,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 8),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color:kWhite,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                color: Colors.green,
                child: Image.asset(MyImages.personOne,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width/5,
                    height: MediaQuery.of(context).size.height/10,
                    alignment: Alignment.center),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                      LKeys.parthGohil.tr,
                      style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                    )),
              ),
              Center(
                  child: Text(
                      LKeys.creator.tr,
                      style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                  )),
              // SizedBox(
              //   height: 7,
              // )
            ],
          ),
        ),
        itemCount: 4,
      ),
    )
    ;
  }
}

class CategoryEntryfees extends StatelessWidget {
  const CategoryEntryfees({super.key, required this.firstText, required this.secText, required this.currentcoins});
  final String firstText;
  final String secText;
  final bool currentcoins;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Text(firstText,
              style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),
          Text(secText,
              style:currentcoins?MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor): MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),),
        ],
      ),
    );
  }
}

