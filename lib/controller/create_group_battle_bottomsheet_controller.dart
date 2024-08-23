import 'package:elite_quiz/controller/baseController.dart';
import 'package:get/get.dart';

import '../localization/localization.dart';

class CreateGroupBattleBottomSheetController extends BaseController {
  String selectedCategory = LKeys.sports.tr;

  void selectValue(String value){
   value != null ? selectedCategory = value : null;
   update();
 }

}
