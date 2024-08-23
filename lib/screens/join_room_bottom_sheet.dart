import 'package:elite_quiz/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/baseController.dart';
import '../utils/extentions/font_extention.dart';
import 'group_battel_screen_one.dart';
import '../utils/const.dart';
import '../subparts/joinroombottomsheet_subparts.dart';

class JoinRoomCreateRoomBottomSheet extends StatelessWidget {
  const JoinRoomCreateRoomBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: Device.height/1.5,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        color: kBlueGreyBack,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back,
                    size: 30, color: Colors.black),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // title: Text('Confirm'),
                        content: Text(
                          LKeys.areYouWantDeleteRoom.tr,
                          style: MyTextStyle.poppinsRegular(
                              size: 20, color: kSubTextColor),
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              LKeys.yes.tr,
                              style: MyTextStyle.poppinsRegular(
                                  size: 20, color: kSubTextColor),
                            ),
                            onPressed: () {
                              // Delete the item
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text(
                              LKeys.no.tr,
                              style: MyTextStyle.poppinsRegular(
                                  size: 20, color: kSubTextColor),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Expanded(
                child: Text(
                  LKeys.joinRoom.tr,
                  style: MyTextStyle.poppinsRegular(
                      size: 20, color: kSubTextColor),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.share, size: 30, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(
            thickness: 1, // thickness of the divider
            color: Colors.grey, // color of the divider
            indent: 0, // indentation from the left
            endIndent: 0, // indentation from the right
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Text(
                    "53273",
                    style: MyTextStyle.poppinsRegular(
                        size: 20, color: kSubTextColor),
                  )),
                ),
                Center(
                  child: Text(
                    LKeys.shareThisCodeJoinRoom.tr,
                    style: MyTextStyle.poppinsRegular(
                        size: 20, color: kSubTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryEntryfees(
                      firstText: LKeys.categories.tr,
                      secText: LKeys.sports.tr,
                      currentcoins: false,
                    ),
                    CategoryEntryfees(
                      firstText: LKeys.entryFees.tr,
                      secText: LKeys.fiveCoins.tr,
                      currentcoins: false,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4,),
          OnlyTextContainer(
            text: LKeys.start.tr,
            colorchange: false,
            func: () {showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              // Enable scrolling if needed
              builder: (context) => const Grid4Join(),
            );},
          ),
        ],
      ),
    );
  }
}
