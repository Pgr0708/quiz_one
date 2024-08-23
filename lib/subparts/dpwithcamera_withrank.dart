// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../utils/const.dart';
// import 'home_screen_subparts/dp.dart';
//
// class DPWithCameraAndRing extends StatefulWidget {
//   const DPWithCameraAndRing({super.key, required this.textInCircle, required this.score,  this.text, this.topperName, this.topperScrore, required this.first});
//   final bool textInCircle;
//   final bool score;
//   final String? text;
//   final String? topperName;
//   final String? topperScrore;
//   final bool first;
//
//   @override
//   State<DPWithCameraAndRing> createState() => _DPWithCameraAndRingState();
// }
//
// class _DPWithCameraAndRingState extends State<DPWithCameraAndRing> {
//   final picker = ImagePicker();
//   File? _selectedImage;
//   Future<void> _pickImageFromGallery() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage == null) return;
//
//     setState(() {
//       _selectedImage = File(pickedImage.path);
//     });
//   }
//
//   Future<void> _pickImageFromCamera() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.camera);
//     if (pickedImage == null) return;
//
//     setState(() {
//       _selectedImage = File(pickedImage.path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Center(
//           child: Stack(
//             children: [
//               Stack(children: [
//                 Dp(
//                   height:widget.textInCircle&&!widget.first? 110:widget.first?140:150,
//                   width:widget.textInCircle&&!widget.first? 110: widget.first?140:150,
//                   color:widget.textInCircle? Colors.grey:Colors.white,
//                   borderwidth: 1,
//                   margin: widget.first?15:10,
//                   backgroundcolor: Colors.transparent,
//                 ),
//                 Dp(
//                   height:widget.textInCircle&&!widget.first? 100:130,
//                   width:widget.textInCircle&&!widget.first? 100: 130,
//                   color: Colors.grey,
//                   borderwidth: 0,
//                   widget: ClipRRect(
//                       borderRadius: BorderRadius.circular(50),
//                       child: const Image(
//                           image: AssetImage('images/dp1.png'),
//                           fit: BoxFit.cover)),
//                   margin:widget.textInCircle&&!widget.first? 15:20,
//                   backgroundcolor: Colors.green,
//                 ),
//               ]),
//               Positioned(
//                 top:widget.textInCircle&&!widget.first? 99: 136,
//                 left:widget.textInCircle&&!widget.first? 52: 70,
//                 child: Container(
//                   height: 34,
//                   padding: EdgeInsets.all(0),
//                   decoration:  BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: White,border: Border.all(color: Colors.white,width: 3),),
//                   child:ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child:widget.textInCircle? Container(color: Pink,padding: EdgeInsets.symmetric(vertical: 3,horizontal: 9),child: Text(widget.text!,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)):  FloatingActionButton(backgroundColor: Colors.white,
//                       onPressed: () => _pickImageFromCamera(),
//                       tooltip: 'Pick Image from camera',
//                       child: const Icon(Icons.add_a_photo_sharp,color: Pink,size: 16,),
//                     ),
//                   ),),),],
//           ),
//         ),
//         widget.score? SizedBox(height: 5,):SizedBox(),
//         widget.score?Text(widget.topperName!,style: BlackText17):SizedBox(),
//         widget.score? SizedBox(height: 5,):SizedBox(),
//         widget.score?Center(child: Text(widget.topperScrore!,style: BlackText28),):SizedBox(),
//       ],
//     );
//   }
// }

import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/const.dart';
import 'home_screen_subparts/dp.dart';

class DPWithCameraAndRing extends StatelessWidget {
   DPWithCameraAndRing(
      {super.key,
      required this.textInCircle,
      required this.score,
      required this.text,
      required this.topperName,
      required this.topperScrore,
      required this.first, required this.isCamera});
  final bool textInCircle;
  final bool score;
  final String text;
  final String topperName;
  final String topperScrore;
  final bool first;
  final bool isCamera;
  final picker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Center(
            child: Stack(
              children: [ Container(
    margin: EdgeInsets.only(bottom: 20,right: isCamera? 23:0,),
    child:
    Stack(children: [
                  Dp(
                    height: textInCircle ? 80 : 140,
                    width: textInCircle ? 80 : 140,
                    color: kTitleColor,
                    borderwidth: 2,
                    margin: 15,
                    backgroundcolor: Colors.transparent, widget: const SizedBox(), isCamera: isCamera,
                  ),
                  Dp(
                    height: textInCircle ? 70 : 125,
                    width: textInCircle ? 70 : 125,
                    color: Colors.grey,
                    borderwidth: 0,
                    widget: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Image(
                            image: AssetImage(MyImages.personOne),
                            fit: BoxFit.cover)),
                    margin: textInCircle ? 25 : 23,
                    backgroundcolor: Colors.green, isCamera: isCamera,
                  ),
                ]),),
                Positioned(
                  top: textInCircle ? 90 : 135,
                  left: textInCircle ? 47 : 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      child: textInCircle
                          ? Container(
                              color: kPink,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 9),
                              child: Text(
                                text,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ))
                          : GestureDetector(
                              onTap: () => _pickImageFromCamera(),
                              child: Container(
                                  height: 34,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      gradient: commonLinearGradient,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.add_a_photo_sharp,
                                    color: kTitleTextColor,
                                    size: 16,
                                  )),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        // widget.score? SizedBox(height: 2,):SizedBox(),
        // widget.score?Text(widget.topperName!,style: BlackText17):SizedBox(),
        // widget.score? SizedBox(height: 2,):SizedBox(),
        // widget.score?Center(child: Text(widget.topperScrore!,style: BlackText28),):SizedBox(),
      ],
    );
  }
}
