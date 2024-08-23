import 'package:elite_quiz/subparts/funNlearn_subparts/about_tesla.dart';
import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localization/localization.dart';
import '../../utils/const.dart';

class ScientificScreen extends StatefulWidget {
  const ScientificScreen({super.key});

  @override
  State<ScientificScreen> createState() => _ScientificScreenState();
}

class _ScientificScreenState extends State<ScientificScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(text: LKeys.scientific.tr,isBackButton: true,isBottom: false,isActions: false,),
      body: Container(
        padding: const EdgeInsets.all(10),
          color: Colors.blueGrey.withOpacity(0.5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => GestureDetector(
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutTesla()));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: index == 0 ? 8 : 4, bottom: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(
                      bottom: 0.0,
                    ),
                    margin: const EdgeInsets.only(bottom: 0),
                    child: ScientificSubPart(
                        typename: LKeys.aboutTesla.tr,
                        numquestion: 3,
                        imgurl: MyImages.personOne, moreview: (){},),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class ScientificSubPart extends StatefulWidget {
  const ScientificSubPart(
      {super.key,
      required this.typename,
      required this.numquestion,
      required this.moreview,
      required this.imgurl});
  final String typename;
  final int numquestion;
  final Function moreview;
  final String imgurl;
  @override
  State<ScientificSubPart> createState() => _ScientificSubPartState();
}

class _ScientificSubPartState extends State<ScientificSubPart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
                color: Colors.white70,
              ),
              child: Image(
                image: AssetImage(widget.imgurl),
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
                  widget.typename,
                  style: const TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "${LKeys.questionColon.tr}${widget.numquestion}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.3))),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    CupertinoIcons.forward,
                    color: Colors.black45,
                    size: 25,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
