// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';

void main() {
  runApp(const TrueFalse());
}

class TrueFalse extends StatelessWidget {
  const TrueFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(188, 173, 127, 1),
        title: Text(
          'hello',
        ),
      ),
      body: Quiz(),
    )));
  }
}

class Quiz extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> IconAnswer = [];
  int trueanswer = 0;
  int total = 0;
  void feedback(bool fd) {
    setState(() {
      if (fd == questiongroup[number].answer) {
        IconAnswer.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.greenAccent,
          ),
        ));
        if (number < (questiongroup.length - 1)) {
          trueanswer++;
          number++;
          total++;
        } else {
          number = 0;
          IconAnswer = [];
          Alert(
            context: context,
            title: "انتهى الاختبار",
            desc:
                "لقد اجبت $trueanswer اجابات صحيحة من اجمالي عدد الاسئلة $total",
            buttons: [
              DialogButton(
                child: Text(
                  "اعادة الاختبار",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
      } else {
        IconAnswer.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.redAccent,
          ),
        ));

        if (number < (questiongroup.length - 1)) {
          number++;
          total++;
        } else {
          number = 0;
          IconAnswer = [];
          Alert(
            context: context,
            title: "انتهى الاختبار",
            desc:
                "لقد اجبت $trueanswer اجابات صحيحة من اجمالي عدد الاسئلة $total",
            buttons: [
              DialogButton(
                child: Text(
                  "اعادة الاختبار",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
      }
    });
  }

  List questiongroup = [
    Question(
      q: "عدد المحافظات اليمنية 28 محافظة ",
      a: false,
    ),
    Question(
      q: "عدد سور القران الكريم 144 سورة ",
      a: true,
    ),
    Question(
      q: "الوحدة اليمنية كانت في عام 1995 ",
      a: false,
    ),
    Question(
      q: " الثورة الشبابية كانت في 2011 ",
      a: true,
    ),
    Question(
      q: " هل الارض كروية ",
      a: true,
    ),
  ];
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: IconAnswer,
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(150.0),
            child: Text(
              questiongroup[number].question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: RaisedButton(
                color: Color.fromARGB(255, 155, 209, 183),
                child: Text(
                  "صح",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () {
                  feedback(true);
                })),
        Expanded(
            flex: 3,
            child: RaisedButton(
                color: Colors.redAccent,
                child: Text("خطا",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                onPressed: () {
                  feedback(false);
                })),
      ],
    ));
  }
}
