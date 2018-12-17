import 'package:flutter/material.dart';

class AddSubject extends StatefulWidget {

  @override
  AddSubjectState createState() {
    return new AddSubjectState();
  }
}

class AddSubjectState extends State<AddSubject> {
  TextEditingController subjectController = new TextEditingController(text: "");

  List<String> subjectList = new List();

  String subject = "Blank subject";

  BuildContext contextX;

  @override
  Widget build(BuildContext context) {
    print(subjectList.length);
    contextX = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add subjects"),
      ),
      body: listOfSubjects(),
      floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                child: subjectDialog()
              );
            },
            child: Icon(Icons.show_chart),),
    );
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
                    subject = x;
                  },

                ),
        SizedBox(height: 20.0,),
        IconButton(
          icon: Icon(Icons.save),
          onPressed: (){
            String x = subjectController.text;
            subjectList.add(x);
            Navigator.of(context).pop();
            setState(() {
                          
                        });
          },

        )
      ],
    );
  }
  
  Widget listOfSubjects(){
    return ListView.builder(
      itemCount: subjectList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${subjectList.length}"),
        );
      },
    );
  }
}