import "package:flutter/material.dart";
import 'package:myapp/question_screen.dart';
import 'package:myapp/splash_screen.dart';
import 'package:myapp/result_screen.dart';
import 'package:myapp/dataset/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var activeScreen = "SplashScreen";
  List<String> choosenAnswerList = [];
  void changeScreen() {
    setState(() {
      activeScreen = "QuestionScreen";
    });
  }

  void choosenAnswer(String answer) {
    choosenAnswerList.add(answer);
    if (choosenAnswerList.length == questionAnswer.length) {
      setState(() {
        choosenAnswerList = [];
        activeScreen = "ResultScreen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "QuestionScreen";
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
        ),
        body: (activeScreen == "SplashScreen")
            ? SplashScreen(changeScreen)
            : (activeScreen == "QuestionScreen")
                ? QuestionScreen(choosenAnswer)
                : ResultScreen(
                    ansList: choosenAnswerList,
                    onTap: restartQuiz,
                  ),
      ),
    );
  }
}
