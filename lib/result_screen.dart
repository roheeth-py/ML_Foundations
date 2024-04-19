import "package:flutter/material.dart";
import "package:myapp/dataset/questions.dart";

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.onTap, required this.ansList});

  final List<String> ansList;
  final void Function() onTap;

  List<Map<String, Object>>getSummary(){
    final List<Map<String, Object>> summary = [];
    for(int i=0; i<ansList.length; i++){
      summary.add(
        {
          "question_index": i,
          "question": questionAnswer[i].question,
          "correct": questionAnswer[i].answers[0],
          "user":ansList[i], 
        }
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Result Screen"),
          TextButton(
            onPressed: onTap,
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
