import 'package:flutter/material.dart';
import 'package:intro/model/question.dart';

class QuizApp extends StatefulWidget {
  QuizApp({Key key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("India's independence day is 1947", true),
    Question.name("Narendra Modi is India's prime minister.", true),
    Question.name("Laddakh has become an union territory", true),
    Question.name("Ahmedabad is Gujarat's capital", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bharat Citizen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber.shade900,
      ),
      backgroundColor: Colors.deepOrange.shade50,

      //we use [builder] because of [context]
      //it is beause of we use context for the snackbar otherwise [Scaffold.of(context)] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/indian.jpg",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade300,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(fontSize: 17.0, color: Colors.purple),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      onPressed: () => _prevQuestion(),
                      color: Colors.orange.shade900,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.orange.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.orange.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.orange.shade900,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    //correct answer
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    } else {
      debugPrint("Inorrect");
      final snackbar = SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.redAccent,
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(
      () {
        _currentQuestionIndex =
            (_currentQuestionIndex + 1) % (questionBank.length);
      },
    );
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex =
          (_currentQuestionIndex - 1) % (questionBank.length);
    });
  }
}
