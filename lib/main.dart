import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyappState();
  }
}

class MyappState extends State<Myapp> {
  final questions = const [
    {
      'questionText': 'what\'s your favorite color !',
      'answers': ['Red', 'blue', 'green', 'orange'],
    },
    {
      'questionText': 'what\'s your favorite animal !',
      'answers': ['monkey', 'donkey', 'lion', 'elephant'],
    },
    {
      'questionText': 'what\'s your favorite instructor !',
      'answers': ['Mans', 'max', 'hima', 'Lol'],
    },
    {
      'questionText': 'what\'s your best friend !',
      'answers': ['rewsh', 'mobark', 'badawy', 'eleshy'],
    }
  ];

  var qindex = 0;
  void Qanswer() {
    setState(() {
      qindex = qindex + 1;
    });
    print(qindex);
    if (qindex < questions.length) {
      print('We have more questions !');
    } else {
      print('No more questions ');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: qindex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[qindex]['questionText']),
                  ...(questions[qindex]['answers'] as List<String>)
                      .map((answers) {
                    return Answer(Qanswer, answers);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
    );
  }
}
