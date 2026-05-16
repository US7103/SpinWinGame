import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/wheel_service.dart';
import '../utils/constants.dart';
import '../widgets/result_dialog.dart';
import '../widgets/spin_button.dart';
import '../widgets/wheel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StreamController<int> controller =
      StreamController<int>();

  final AudioPlayer audioPlayer = AudioPlayer();

  late ConfettiController confettiController;

  bool isSpinning = false;
  String latestResult = "No Spins Yet";

int totalWins = 0;
int totalLosses = 0;

List<String> spinHistory = [];

  @override
  void initState() {
    super.initState();

    confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    controller.close();
    audioPlayer.dispose();
    confettiController.dispose();
    super.dispose();
  }

  Future<void> spinWheel() async {
    setState(() {
      isSpinning = true;
    });

    int index = WheelService.generateRandomIndex(
      wheelItems.length,
    );

    controller.add(index);

    await audioPlayer.play(
      AssetSource('spin.mp3'),
    );

    await Future.delayed(
      const Duration(seconds: 4),
    );

    String reward = wheelItems[index].label;

bool isLose = reward == "Try Again";

if (!isLose) {
  confettiController.play();
}

setState(() {
  latestResult = reward;

  spinHistory.insert(0, reward);

  if (isLose) {
    totalLosses++;
  } else {
    totalWins++;
  }

  isSpinning = false;
});

ResultDialog.show(
  context,
  reward,
);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),

                Text(
                  "SPIN THE WHEEL",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),
                Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [

        Text(
          "Latest Result: $latestResult",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
          children: [

            Column(
              children: [
                const Text(
                  "Wins",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "$totalWins",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                const Text(
                  "Losses",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "$totalLosses",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ),
),

                SizedBox(
                  height: 350,
                  child: WheelWidget(
                    controller: controller,
                  ),
                ),

                const SizedBox(height: 50),

                SpinButton(
                  onTap: spinWheel,
                  isSpinning: isSpinning,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}