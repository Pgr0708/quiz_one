import 'package:elite_quiz/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../utils/extentions/font_extention.dart';

class WatchEarn extends StatelessWidget {
  const WatchEarn(
      {super.key,required this.imgurl});

  final String imgurl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhite,
              ),
              child: Image(
                image: AssetImage(imgurl),
                fit: BoxFit.fill,
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
                    LKeys.watchAndEarn.tr,
                    style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                ),
                Text(
                    LKeys.getCoins.tr,
                    style: MyTextStyle.poppinsRegular(size: 20,color: kSubTextColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}