import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../utils/constants.dart';

class WheelWidget extends StatelessWidget {
  final StreamController<int> controller;

  const WheelWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      selected: controller.stream,
      animateFirst: false,
      indicators: const [
        FortuneIndicator(
          alignment: Alignment.topCenter,
          child: TriangleIndicator(
            color: Colors.white,
          ),
        ),
      ],
      items: [
        for (var item in wheelItems)
          FortuneItem(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(height: 8),
                Text(
                  item.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            style: FortuneItemStyle(
              color: item.color,
              borderColor: Colors.white,
              borderWidth: 2,
            ),
          ),
      ],
    );
  }
}