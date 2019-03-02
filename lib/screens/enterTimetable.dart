import 'package:flutter/material.dart';
import 'package:in_time/utils/activity_model.dart';
import 'package:in_time/screens/homePage.dart';
// import 'package:datetime_picker_formfield/time_picker_formfield.dart';
// import 'package:intl/intl.dart';

class TimeTableMenu extends StatefulWidget {
  @override
  TimeTableMenuState createState() {
    return new TimeTableMenuState();
  }

  Function callback;

  TimeTableMenu(this.callback);
}

class TimeTableMenuState extends State<TimeTableMenu> {
  TextEditingController startController = new TextEditingController(text: "");
  TextEditingController endController = new TextEditingController(text: "");
  TextEditingController activityController =
      new TextEditingController(text: "");
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

  List<String> subjectList = new List();
  List<Activities> activityList = new List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter timetable"),
      ),
      body: Row(
        children: <Widget>[
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
                  // TimePickerFormField(
                  //   format: DateFormat("h:mma"),
                  //   decoration: InputDecoration(labelText: "Start Time"),
                  //   onChanged: (time) {
                  //     print("Start Time: $time");
                  //     startTime = time;
                  //   },
                  // ),
                  // TimePickerFormField(
                  //   format: DateFormat("h:mma"),
                  //   decoration: InputDecoration(labelText: "End Time"),
                  //   onChanged: (time) {
                  //     print("End Time: $time");
                  //     endTime = time;
                  //   },
                  // ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Activity Name"),
                    controller: activityController,
                    onSubmitted: (x) {
                      print("Activity: " + x);
                      activity = x;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    child: Text("Add to current day"),
                    onPressed: () {
                      addToActivityList();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.widget.callback(activityList);
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget subjectDialog() {
    return SimpleDialog(
      title: Text("Enter subjects"),
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: "Subject"),
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

  void addToActivityList() {
    Activities activity = new Activities(
        activity: activityController.text,
        startTime: this.startTime,
        endTime: this.endTime,
        dayName: this.dayName);
    activityList.add(activity);
    print("addToActivityList : ${activityList.length}");
  }
}
