import 'package:elite_quiz/controller/baseController.dart';

enum PeriodOne { alltime, monthly, today }

enum PeriodTwo { today, completed }

class RadioButtonRowController extends BaseController {
  PeriodOne selectedPeriodOne = PeriodOne.alltime;
  PeriodTwo selectedPeriodTwo = PeriodTwo.completed;

  void selectOne(PeriodOne periodOne){
    selectedPeriodOne = periodOne;
    update();
  }
  void selectTwo(PeriodTwo periodTwo){
    selectedPeriodTwo = periodTwo;
    update();
  }
}