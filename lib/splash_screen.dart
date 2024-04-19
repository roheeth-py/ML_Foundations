import "package:flutter/material.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen(this.changeScreen, {super.key});
  final void Function() changeScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "lib/asset/5210980.jpg",
            width: 250,
          ),
          const SizedBox(height: 10),
          const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {
              changeScreen();
            },
            label: const Text(
              "Start Quiz",
            ),
            icon: const Icon(Icons.arrow_circle_right_outlined),
          ),
        ],
      ),
    );
  }
}
