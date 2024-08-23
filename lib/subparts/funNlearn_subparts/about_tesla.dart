import 'package:elite_quiz/screens/group_battel_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../localization/localization.dart';

class AboutTesla extends StatefulWidget {
  const AboutTesla({super.key});

  @override
  State<AboutTesla> createState() => _AboutTeslaState();
}

class _AboutTeslaState extends State<AboutTesla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.blueGrey.withOpacity(0.5),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
               Expanded(
               child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                child:SingleChildScrollView(child: Text(LKeys.descriptionTesla.tr,style: const TextStyle(color: Colors.black,fontSize: 60,fontWeight: FontWeight.w300),)),
                ),
              ),
            ),
            OnlyTextContainer(text: LKeys.letStart.tr, colorchange: false, func: () {  },),
          ],
        ),
      ),
    );
  }
}
