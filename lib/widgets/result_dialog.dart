import 'package:flutter/material.dart';

class ResultDialog {
  static void show(
    BuildContext context,
    String reward,
  ) {
    bool isLose = reward == "Try Again";

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: Text(
            isLose
                ? "Better Luck Next Time!"
                : "Congratulations!",
          ),

          content: Text(
            isLose
                ? "You lose: Try Again"
                : "You won: $reward",
            style: const TextStyle(fontSize: 20),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}