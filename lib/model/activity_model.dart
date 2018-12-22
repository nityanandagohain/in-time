import 'package:flutter/material.dart';

  class Activities{

  TimeOfDay startTime;
  TimeOfDay endTime;
  String activity;
  String dayName;

  Activities({this.startTime, this.endTime, this.activity, this.dayName});

  String getDayName(){
    return dayName;
  }

  String getActivity(){
    return activity;
  }

  TimeOfDay getStartTime(){
    return startTime;
  }

  TimeOfDay getEndTime(){
    return endTime;
  }
  
  }
  



