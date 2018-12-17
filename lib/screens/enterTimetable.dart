import 'package:flutter/material.dart';
import 'package:in_time/model/activity_model.dart';
import 'package:in_time/model/time_table_model.dart';
import 'package:in_time/screens/add_subjects.dart';
import 'package:in_time/screens/time_table_viewer.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:intl/intl.dart';

class TimeTableMenu extends StatefulWidget {

  @override
  TimeTableMenuState createState() {
    return new TimeTableMenuState();
  }
}

class TimeTableMenuState extends State<TimeTableMenu> {

  TextEditingController startController = new TextEditingController(text: "");
  TextEditingController endController = new TextEditingController(text: "");
  TextEditingController activityController = new TextEditingController(text: "");
  TextEditingController subjectController = new TextEditingController(text: "");

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  String dayName;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String activity;

  List<TimeTable> timeTableList = new List();
  List<String> subjectList = new List();
  List<Activities> activityList = new List();

  void createTimetableForEachDay(){
    for(String x in _days){
      TimeTable timetable = new TimeTable();
      timetable.setDayName(x);
      timeTableList.add(timetable);
    }
  }

  @override
  void initState(){
    super.initState();
    createTimetableForEachDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter timetable"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ViewTimeTable(timeTableList: timeTableList,)
              ));
            },
          ),
          // MaterialButton(
          //   child: Text("Subjects"),
          //   onPressed: () async {
          //     await showDialog(
          //       context: context,
          //       child: subjectDialog()
          //     );
          //   },
          // )
        ],
        ),
      body: Row(children: <Widget>[
        Expanded(
                  child: Container(
          child: Column(
              children: <Widget>[
                DropdownButton(
                  items: _days.map((String x) {
                    return DropdownMenuItem(
                      value: x,
                      child: Text(x),
                    );
                  }).toList(),
                  value: dayName,
                  hint: Text("Day"),
                  onChanged: (x) {
                    setState(() {
                      dayName = x;
              
                                        }); 

                   print(dayName);
                  },
                ),
                TimePickerFormField(
                  format: DateFormat("h:mma"),
                  decoration: InputDecoration(
                    labelText: "Start Time"
                  ),
                  onChanged: (time) {
                    print("Start Time: $time");
                    startTime = time;
                  } ,
                ),

                TimePickerFormField(
                  format: DateFormat("h:mma"),
                  decoration: InputDecoration(
                    labelText: "End Time"
                  ),
                  onChanged: (time) {
                    print("End Time: $time");
                    endTime = time;
                  } ,
                ),

                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Activity"
                  ),

                  controller: activityController,
                  onSubmitted: (x) {
                    print("Activity: " + x);
                    activity = x;
                  },

                )
              ], 
      ),
    ),
        ),
        RaisedButton(
          onPressed: (){
            addToActivityList();
          },
        )
      ],),
      floatingActionButton:  FloatingActionButton(
        onPressed: addToList,
        child: Icon(Icons.add),
      ),
    );
  }

  // void addFromField(String val, int flag){
  //   if(flag == 0){
  //     startTime = int.parse(val);
  //   }
  //   else if(flag == 1){
  //     endTime = int.parse(val);
  //   }
  //   else if(flag == 2){
  //     activity = val;
  //   }
  // }

  void addToList(){
List<Activities> listX;

    print("activityList" + timeTableList[timeTableList.length - 1].getActivityList()[8].getDayName().toString());

    TimeTable x = new TimeTable(dayName: this.dayName, activityList: activityList);
    timeTableList.add(x);

    for(int i = 0 ; i < 7 ; i ++){
      listX = new List();
      if(activityList != null){
        for(Activities x in activityList){
          if(x != null) {
            if(x.getDayName() == timeTableList[i].getDayName()){
              listX.add(x);
            }
          }
        }
      }

      timeTableList[i].setActivityList(listX);
      print("addToList ${timeTableList[i].getActivityList().length}");
      
    }
  }

Widget subjectDialog(){
    return SimpleDialog(
      title: Text("Enter subjects"),
      children: <Widget>[
        SizedBox(height: 20.0,),
        TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Subject"
                  ),

                  controller: subjectController,
                  onSubmitted: (x) {
                    print("Subject: " + x);
                    // subject = x;
                  },

                ),

          RaisedButton(
            child: Text("data"),
            onPressed: () {},
          ),
      ],
    );
  }

  void addToActivityList(){

    
    Activities activity = new Activities(activity: activityController.text, startTime: this.startTime, endTime: this.endTime, dayName: this.dayName);
    activityList.add(activity);

    activityController.clear();
    print("addToActivityList : ${activityList.length}");
    this.startTime = null;
    this.endTime = null;
  }

}