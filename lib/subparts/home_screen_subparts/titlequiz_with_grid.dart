import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../utils/const.dart';
import '../../utils/extentions/font_extention.dart';

class TitleQuiz extends StatelessWidget {
  const TitleQuiz({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          text,
          style: MyTextStyle.poppinsRegular(size: 20, color: kSubTextColor),
        ));
  }
}

class TitleQuizWithGrid extends StatelessWidget {
  const TitleQuizWithGrid(
      {super.key,
      required this.title,
      required this.crossaxiscount,
      required this.gridtitle,
      required this.subgridtext,
      required this.imgurl,
      required this.ontap,
      required this.titlepresent});
  final String title;
  final int crossaxiscount;
  final List<String> gridtitle;
  final List<String> subgridtext;
  final List<String> imgurl;
  final List<Function> ontap;
  final bool titlepresent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titlepresent ? TitleQuiz(text: title) : const SizedBox(),
        SizedBox(
          height: 95 * (gridtitle.length.toDouble()),
          width: MediaQuery.of(context).size.width,
          child: MasonryGridView.builder(
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossaxiscount,
              ),
              itemCount: gridtitle.length,
              crossAxisSpacing: 10,
              // padding: EdgeInsets.h(0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       // title: Text('Confirm'),
                    //       content: Text('To access this feature you need to Login!!',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w300,),),
                    //       actions: [
                    //         TextButton(
                    //           child: Text('Cancel' , style: TextStyle(fontWeight: FontWeight.w500,color: Pink,fontSize: 20),),
                    //           onPressed: () {
                    //             // Delete the item
                    //             Navigator.of(context).pop();
                    //           },
                    //         ),
                    //         TextButton(
                    //           child: Text('Log in',style: TextStyle(fontWeight: FontWeight.w500,color: Pink,fontSize: 20),),
                    //           onPressed: () {
                    //             Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomsheet1()));
                    //           },
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                    ontap[index]();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kWhite,
                      ),
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                gridtitle[index],
                                style: MyTextStyle.poppinsRegular(
                                    size: 20, color: kSubTextColor),
                              )),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                subgridtext[index],
                                style: MyTextStyle.poppinsRegular(
                                    size: 15, color: kSubTextColor),
                              )),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey.withOpacity(1))),
                              // padding: const EdgeInsets.all(0),
                              child: Image(
                                image: AssetImage(imgurl[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
