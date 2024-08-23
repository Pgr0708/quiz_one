import 'package:elite_quiz/controller/baseController.dart';
import '../subparts/language_screen_subparts.dart';

class SelectLangListController extends BaseController {
  Period selectedPeriod = Period.hindi;
  void selectLang (Period period){
    selectedPeriod = period;
    update();
  }
}

class LanguageController extends BaseController {
  SessionManager manager=SessionManager();
  void changeId(){
    manager.setIsLanguageSet(true);
    print( "${manager.getIsLanguageSet()}");
   update();
  }
}

