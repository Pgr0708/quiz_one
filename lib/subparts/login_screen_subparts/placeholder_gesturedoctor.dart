import 'package:elite_quiz/controller/placeholder_controller.dart';
import 'package:elite_quiz/screens/login_screen.dart';
import 'package:elite_quiz/utils/extentions/font_extention.dart';
import 'package:elite_quiz/utils/extentions/image_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../utils/const.dart';

class PlaceHolder extends StatelessWidget {
  PlaceHolder({
    super.key,
    required this.words,
    required this.isInviteCode,
    required this.isPrefix,
    required this.prefixIcon,
    required this.isSuffix, required this.onChanged,
  });
  // final switchpresent;
  final String words;
  final bool isInviteCode;
  final bool isPrefix;
  final Widget prefixIcon;
  final bool isSuffix;
final Function(String) onChanged;  // final iconpresent;
  bool pressedicon = true;
  Color textcolor2 = Colors.blueGrey;
  Color textcolor = kPink;
  Color borderradiuscolor = kWhite;
  @override
  Widget build(BuildContext context) {
    PlaceholderController controller = PlaceholderController();
    return GetBuilder(
        init: controller,
        builder: (controller) {
          return TextField(
            onChanged: (String text){onChanged(text);},
            style: MyTextStyle.poppinsRegular(size: 17, color: kSubTextColor),
            autofocus: false,
            obscureText:isSuffix&&controller.eyeOpen?true:false,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                  borderRadius: isInviteCode
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(10)),
              border: OutlineInputBorder(
                borderRadius: isInviteCode
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))
                    : BorderRadius.circular(10.0), // Set border radius here
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                  borderRadius: isInviteCode
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.circular(10)),
              suffixIconColor: textcolor2,
              fillColor: kTitleColor,
              filled: true,
              // prefixIcon: const Icon(Icons.),
              // suffixIcon: widget.iconpresent
              //     ? Container(
              //   child: IconButton(
              //     icon: Icon(pressedicon
              //         ? Icons.remove_red_eye_outlined
              //         : Icons.panorama_fish_eye_outlined),
              //     onPressed: () {
              //       setState(() {
              //         pressedicon = !pressedicon;
              //       });
              //     },
              //   ),
              // )
              //     : null,
              hintText: words,
              hintStyle:
                  MyTextStyle.poppinsRegular(size: 17, color: kSubSubTextColor),
              // border: InputBorder.none,
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(
              //       40.0), // Set border radius here
              //   borderSide: BorderSide(
              //       color: Colors.transparent,
              //       width:
              //       0.0), // Set border color and width to none
              //   ),
              isDense: true,
              prefixIcon: prefixIcon,
              suffixIcon: isSuffix
                  ? prefixSuffixIcon(
                      !controller.eyeOpen
                          ? MyImages.openEye
                          : MyImages.eyeWithLine, () {
                      controller.eyeCloseOpen();
                    })
                  : null,
            ),
          );
        });
  }
}

class Gesturedoctor extends StatelessWidget {
  const Gesturedoctor({
    super.key,
    required this.firsttext,
    required this.secondtext,
    required this.changevalue,
  });
  final String firsttext;
  final String secondtext;
  final Function changevalue;
  // Function onTap,
  //  bool signuppressed11=false;
  // late bool store;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changevalue();
        // widget.signuppressed? Navigator.pop(context):null;
      },
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              gradient: commonLinearGradient,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            firsttext,
            style:
                MyTextStyle.poppinsSemiBold(size: 20, color: kTitleTextColor),
            textAlign: TextAlign.center,
          )),
    );
  }
}
