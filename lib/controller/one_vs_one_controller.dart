import 'package:elite_quiz/controller/baseController.dart';
import 'package:get/get.dart';
import '../localization/localization.dart';

class OneVsOneController extends BaseController {
  String selectedCategory = LKeys.movies.tr;
  void selectCate(String value) {
    selectedCategory = value;
    update();
  }
}
