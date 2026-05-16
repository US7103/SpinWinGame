import 'package:flutter/material.dart';

class SpinButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSpinning;

  const SpinButton({
    super.key,
    required this.onTap,
    required this.isSpinning,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isSpinning ? null : onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 18,
        ),
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        isSpinning ? "Spinning..." : "SPIN",
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}