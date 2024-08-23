import 'package:elite_quiz/controller/baseController.dart';

class PlayAreaFontSizeBottomSheetController extends BaseController {
  double fontSize = 16.0;
 void font(double value){
   fontSize = value;
   update();
 }
}