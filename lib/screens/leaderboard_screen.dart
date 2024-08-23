import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';
import '../subparts/home_screen_subparts/dp.dart';
import '../subparts/leaderboard_subparts/all_monthly_today.dart';
import '../utils/const.dart';
// class LeaderBoard extends StatefulWidget {
//   const LeaderBoard({super.key});
//
//   @override
//   State<LeaderBoard> createState() => _LeaderBoardState();
// }
//
// class _LeaderBoardState extends State<LeaderBoard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(preferredSize: Size(double.infinity,55),child: Appbar(text: "LeaderBoard",)),
//       body: Column(
//         children: [
//           _buildLeaderboardHeader(),
//           _buildLeaderboardList(),        ],
//       ),
//     );
//   }
// }

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(text: LKeys.leaderboard.tr,isBackButton: true,isActions: false,isBottom: false,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: kBaseColorTwo,
          padding: const EdgeInsets.only(top: 8.0,left: 10,right: 10,),
          child: Column(
            children: [
              const BuildLeaderboardHeader(isExamRow: false,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ImageWithAward(text: LKeys.parthGohil.tr, bronze: false, silver: true,)),
                  ImageWithAward(text: LKeys.parthGohil.tr, bronze: false, silver: false,),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ImageWithAward(text: LKeys.parthGohil.tr, bronze: true, silver: false,),
                  ),
                ],
              ),
              _buildLeaderboardList(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildLeaderboardTab(String text) {
  Widget _buildLeaderboardList() {
    return Container(
      decoration: BoxDecoration(color: kBlueGreyBack),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildLeaderboardItem(index + 4);
        },
      ),
    );
  }

  Widget _buildLeaderboardItem(int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            // left: 16.0,
            // right: 16.0,
            top: index == 4 ? 4 : 2.0,
            bottom: 2.0,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 25,
                child: Text(
                  '$index',
                  style: MyTextStyle.poppinsSemiBold(color: kSubTextColor,size: 17),
                ),
              ),
              const SizedBox(width: 20.0),
              CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200/300?random=${index + 1}',
                ),
              ),
              const SizedBox(width: 20.0),
              Text(
                LKeys.parthGohil.tr,
                style: MyTextStyle.poppinsRegular(color: kTitleTextColor,size: 15),
              ),
              const Spacer(),
              Text(
                '3.4',
                style: MyTextStyle.poppinsSemiBold(size: 20,color: kTitleTextColor),
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ),
        const Divider(
          thickness: 1, // thickness of the divider
          color: kContColor, // color of the divider
          indent: 0, // indentation from the left
          endIndent: 0, // indentation from the right
        )
      ],
    );
  }
}

class ImageWithAward extends StatelessWidget {
  const ImageWithAward({super.key, required this.text, required this.bronze, required this.silver});
  final String text;
  final bool bronze;
  final bool silver;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Positioned(
              top: 10,
              left: 16,
              child: Dp(
                height: MediaQuery.of(context).size.height/10,
                width: MediaQuery.of(context).size.height/10,
                color: Colors.transparent,
                borderwidth: 0,
                widget: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const Image(
                        image: AssetImage(MyImages.personOne),
                        fit: BoxFit.cover)),
                margin:5,
                backgroundcolor: Colors.transparent, isCamera: false,
              ),
            ),
            Image.asset(bronze?MyImages.bronzeAward:silver?MyImages.silverAward:
              MyImages.goldAward,
              width:  MediaQuery.of(context).size.height/7,
              height: MediaQuery.of(context).size.height/7,
            ),
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height/10,
          left: MediaQuery.of(context).size.height/70,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
                gradient: silver?const LinearGradient(colors: [
                  Color(0xffD7D8D4),
                  Color(0xFFC7C9C8),
                  Color(0xFFB7B9BB),
                  Color(0xFFA6AAAF),
                  Color(0xFF868B96)
                ]):bronze?const LinearGradient(colors: [
                  Color(0xff943E36),
                  Color(0xffF27246),
                  Color(0xff943E36),
                ]):const LinearGradient(colors: [
                  Color(0xffBF953F),
                  Color(0xFFFCF6BA),
                  Color(0xFFB38728),
                  Color(0xFFFBF5B7),
                  Color(0xFFAA771C)
                ]),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(2),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: MyTextStyle.poppinsBlack(size: 13, color: kContColor),
            ),
          ),
        ),
      ],
    );
  }
}
