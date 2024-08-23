import 'package:elite_quiz/controller/create_group_battle_bottomsheet_controller.dart';
import 'package:elite_quiz/screens/group_battel_screen_one.dart';
import 'package:elite_quiz/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/baseController.dart';
import '../localization/localization.dart';
import '../screens/join_room_bottom_sheet.dart';
import '../utils/extentions/font_extention.dart';
import 'login_screen_subparts/placeholder_gesturedoctor.dart';

class CreateGroupBattleBottomSheet extends StatelessWidget {
   CreateGroupBattleBottomSheet({super.key});

  // String? _selectedSubCategory;
  List<String> categories = [
    LKeys.sports.tr,
    LKeys.history.tr,
    LKeys.science.tr,
    LKeys.movies.tr
  ];
  List<String> subCategories = [
    LKeys.cycling.tr,
    LKeys.football.tr,
    LKeys.basketball.tr
  ];
  @override
  Widget build(BuildContext context) {
    CreateGroupBattleBottomSheetController controller = CreateGroupBattleBottomSheetController();
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Container(
          height: Device.height / 1.7,
          decoration: BoxDecoration(
            color: kBlueGreyBack,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    LKeys.createGroupBattle.tr,
                    style:
                        MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
                  ),
                ),
                SizedBox(height: Device.height / 60),
                Text(
                  LKeys.selectCategory.tr,
                  style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
                ),
                 SizedBox(height:  Device.height /100),
                DropdownButtonFormField<String>(

                  value: controller.selectedCategory,
                  hint: Text(
                    LKeys.sports.tr,
                    style:
                        MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
                  ),
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: MyTextStyle.poppinsRegular(
                            size: 20, color: kSubTextColor),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if(value == null){
                      value=LKeys.sports.tr;
                  }
                   controller.selectValue(value);
                  },
                ),
                SizedBox(height: Device.height / 60),
                Text(
                  LKeys.entryCoinsBattle.tr,
                  style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CoinButton(coinValue: 5, isSelected: true),
                    _CoinButton(coinValue: 10),
                    _CoinButton(
                      coinValue: 15,
                    ),
                    _CoinButton(coinValue: 20),
                  ],
                ),
                SizedBox(height: Device.height /60),
                PlaceHolder(
                  words: LKeys.enterCoins.tr, isInviteCode: false, isPrefix: false,prefixIcon: Container(), isSuffix: false, onChanged: (String data) {  },
                ),
                SizedBox(height: Device.height /60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          LKeys.yourCoins.tr,
                          style: MyTextStyle.poppinsRegular(
                              size: 20, color: kSubTextColor),
                        ),
                        Text(
                          LKeys.fiveHundredCoins.tr,
                          style: MyTextStyle.poppinsRegular(
                              size: 20, color: kSubTextColor),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Text(
                            LKeys.buyCoins.tr,
                            style: const TextStyle(
                                color: kPink,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: Device.height /60),
                OnlyTextContainer(
                  text: LKeys.createRoom.tr,
                  func: () {
                    try {
                      showModalBottomSheet(
                        // shape:RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                        // ),
                        context: context,
                        isScrollControlled: true,

                        // Enable scrolling if needed
                        builder: (context) => const JoinRoomCreateRoomBottomSheet(),
                      );
                    } catch (e) {
                      if (kDebugMode) {
                        print('Error: $e');
                      }
                    }
                  },
                  colorchange: false,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

class _CoinButton extends StatelessWidget {
  final int coinValue;
  final bool isSelected;

  const _CoinButton(
      {required this.coinValue, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? kPink : kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            '$coinValue',
            style: isSelected
                ? MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor)
                : MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.currency_bitcoin,
            color: CupertinoColors.systemYellow,
            size: 25,
          )
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//
//   @override
//   State<MyApp> createState() => _MyAppState();bool pressed=false;
//
// }
//
// class _MyAppState extends State<MyApp> {
//   String? _selectedCategory;
//   String? _selectedSubCategory;
//   List<String> categories = ["Sports", "History", "Science", "Movies"];
//   List<String> subCategories = ["Cycling", "Football", "Basketball"];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Select Category",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 DropdownButtonFormField<String>(
//                   value: _selectedCategory,
//                   hint: const Text("Sports"),
//                   items: categories.map((category) {
//                     return DropdownMenuItem<String>(
//                       value: category,
//                       child: Text(category),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedCategory = value;
//                     });
//                   },
//                 ),
//                 Container(
//                   height: 150,
//                   width: double.infinity,
//                   color: Colors.green[700],
//                 ),
//                 Container(
//                   height: 150,
//                   width: double.infinity,
//                   color: Colors.green[500],
//                 ),
//                 Container(
//                   height: 150,
//                   width: double.infinity,
//                   color: Colors.green[300],
//                 ),
//                 Container(
//                   height: 150,
//                   width: double.infinity,
//                   color: Colors.green[100],
//                 ), SizedBox(height: 50,),
//                 const SizedBox(height: 20),
//                 // if (_selectedCategory != null)
//                 //   Column(
//                 //     children: [
//                 //       const Text(
//                 //         "Select Subcategory",
//                 //         style: TextStyle(
//                 //             fontSize: 18, fontWeight: FontWeight.bold),
//                 //       ),
//                 //       const SizedBox(height: 10),
//                 //       DropdownButtonFormField<String>(
//                 //         value: _selectedSubCategory,
//                 //         hint: const Text("Cycling"),
//                 //         items: subCategories.map((subcategory) {
//                 //           return DropdownMenuItem<String>(
//                 //             value: subcategory,
//                 //             child: Text(subcategory),
//                 //           );
//                 //         }).toList(),
//                 //         onChanged: (value) {
//                 //           setState(() {
//                 //             _selectedSubCategory = value;
//                 //           });
//                 //         },
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ... other widgets for selecting number of questions and time
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
