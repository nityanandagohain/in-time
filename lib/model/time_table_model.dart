import 'package:in_time/model/activity_model.dart';

class TimeTable {

  String dayName;
 
  List<Activities> activityList;

  TimeTable({this.dayName, this.activityList});

  String getDayName(){
    return dayName;
  }

  void setDayName(String dayName){
    this.dayName = dayName;
  }

  void setActivityList(List<Activities> activityList){
    this.activityList = activityList;
  }
  List<Activities> getActivityList(){
    return activityList;
  }

  
}

