import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String firstText = "Merhaba Ilk uygulamamdir!";

  @override
  Widget build(BuildContext context) {
    var students = [
      "Tugce Vatansever Gunduz",
      "Suleyman Gunduz",
      "Tugba Vatansever",
      "kubra Vatansever"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(firstText),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(students[index]);
                  })),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  int score = 50;
                  String result = "";
                  if (score >= 55) {
                    result = "Success";
                  } else if (score >= 40) {
                    result = "You have to take the exam again";
                  } else {
                    result = "Fail! You have to take the course again";
                  }
                  var alert = AlertDialog(
                    title: Text("Result of the exam"),
                    content: Text(result),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                },
                child: Text("See Result")
            ),
          ),
        ],
      ),
    );
  }
}
