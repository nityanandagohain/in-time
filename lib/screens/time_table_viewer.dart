import 'package:flutter/material.dart';
import 'package:in_time/model/time_table_model.dart';

class ViewTimeTable extends StatefulWidget {
  @override
  _ViewTimeTableState createState() => _ViewTimeTableState();

  List<TimeTable> timeTableList = new List();

  ViewTimeTable({this.timeTableList});
}

class _ViewTimeTableState extends State<ViewTimeTable> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View timetable"),
      ),
      body: Container()
      // ListView.builder(
      //   itemCount: widget.timeTableList.length,
      //   itemBuilder: (context, index) {
          
      //     return ExpansionTile(
      //       title: Text(widget.timeTableList[index].getDayName()),
      //       children: <Widget>[
      //         Text(widget.timeTableList[index].getStartTime().toString()),
      //         Text(widget.timeTableList[index].getEndTime().toString()),
      //         Text(widget.timeTableList[index].getActivity()),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}