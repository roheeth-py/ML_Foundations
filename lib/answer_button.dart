import "package:flutter/material.dart";

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.function, super.key});
  final String text;
  final void Function() function;

  @override
  Widget build(context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: function,
          style: OutlinedButton.styleFrom(
            fixedSize: const Size.fromWidth(150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
