import 'package:flutter/material.dart';
import 'package:flutter_projects/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String firstText = "Ogrenci Takip Sistemi";
  List<Student> students = [Student("Tugce", "VATANSEVER GUNDUZ", 15,""),Student("Tugba", "VATANSEVER", 45,""),Student("Kubra", "VATANSEVER", 60,"")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(firstText),
      ),
      body: buildBody(context),
    );
  }

  String calculateExamResult(int degree) {
    String message = "";
    if (degree >= 55) {
      message = "Success";
    } else if (degree >= 40) {
      message = "You have to take the exam again";
    } else {
      message = "Fail! You have to take the course again";
    }
    return message;
  }

  void showMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text("Sinav Sonucu"),
      content: Text(message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2023/01/25/12/33/snowy-owl-7743488_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName+" "+students[index].lastName),
                    subtitle: Text("Sinavdan aldigi not : "+students[index].grade.toString()),
                    trailing: builtStatusIcon(students[index].grade),
                    onTap: (){
                      print(students[index].firstName+" "+students[index].lastName);
                      },
                  );
                })),
        Center(
          child: ElevatedButton(
            child: Text("Sonuc Goster"),
            onPressed: () {
              var message = calculateExamResult(35);
              showMessage(context, message);
            },
          ),
        ),
      ],
    );
  }

  builtStatusIcon(int grade) {
    if (grade >= 55) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
