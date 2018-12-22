import 'package:in_time/model/activity_model.dart';

class TimeTable {

  String dayName;
 
  TimeTable({this.dayName});

  String getDayName(){
    return dayName;
  }

  void setDayName(String dayName){
    this.dayName = dayName;
  }
  
}

