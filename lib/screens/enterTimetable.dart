import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:in_time/screens/homePage.dart';
import 'package:in_time/utils/activity_model.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
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
    setState(() {
      dayName = _days[DateTime.now().weekday - 1];
    });
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Enter timetable"),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  DropdownButton(
                    style: Theme
                        .of(context)
                        .textTheme
                        .subhead,
                    elevation: 8,
                    items: _days.map((String x) {
                      return DropdownMenuItem(
                        value: x,
                        child: Text(x),
                      );
                    }).toList(),
                    value: dayName,
                    hint: Text("Choose a day"),
                    onChanged: (x) {
                      setState(() {
                        dayName = x;
                      });
                      print(dayName);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // ignore: deprecated_member_use
                  TimePickerFormField(
                    style: Theme
                        .of(context)
                        .textTheme
                        .body2,
                    format: DateFormat("h:mma"),
                    decoration: InputDecoration(labelText: "Start Time",
                      icon: Icon(Icons.access_time),
                      contentPadding: const EdgeInsets.all(20.0),
                    ),
                    onChanged: (time) {
                      print("Start Time: $time");
                      startTime = time;
                    },
                  ),
                  // ignore: deprecated_member_use
                  TimePickerFormField(
                    style: Theme
                        .of(context)
                        .textTheme
                        .body2,
                    format: DateFormat("h:mma"),
                    decoration: InputDecoration(labelText: "End Time",
                      icon: Icon(Icons.access_time),
                      contentPadding: const EdgeInsets.all(20.0),
                    ),
                    onChanged: (time) {
                      print("End Time: $time");
                      endTime = time;
                    },
                  ),
                  TextField(
                    style: Theme
                        .of(context)
                        .textTheme
                        .body2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Activity Name",
                      icon: Icon(Icons.local_activity),
                      contentPadding: const EdgeInsets.all(20.0),
                    ),
                    controller: activityController,
                    onSubmitted: (x) {
                      print("Activity: " + x);
                      activity = x;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  OutlineButton(
                    onPressed: () {
                      addToActivityList();
                    },
                    borderSide: BorderSide(width: 3.0, color: Colors.blue),
                    child: Text("Add to current day"),
                    highlightedBorderColor: Colors.blue.shade500,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Image.asset('assets/img/student.jpg',
                    width: 400,
                    height: 250,
                    alignment: Alignment.center,
                    filterQuality: FilterQuality.high,
                  ),
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

  // TODO: TRY TO ADD SVG
//  final String assetName = 'assets/up_arrow.svg';
//  final Widget svgIcon = new SvgPicture.asset(
//      assetName,
//      color: Colors.red,
//      semanticsLabel: 'A red up arrow'
//  );

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
