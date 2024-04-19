import 'package:flutter/material.dart';
import 'package:myapp/answer_button.dart';
import 'package:myapp/dataset/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.answerList, {super.key});
  final void Function(String) answerList;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  int current = 0;

  void changeQuestion(String item) {
    widget.answerList(item);
    setState(() {
      current++;
      current = current % questionAnswer.length;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questionAnswer[current];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ...currentQuestion.getShuffledAnswers().map(
                (item) => AnswerButton(
                  text: item,
                  function: () {
                    changeQuestion(item);
                  },
                ),
              ),
        ],
      ),
    );
  }
}
