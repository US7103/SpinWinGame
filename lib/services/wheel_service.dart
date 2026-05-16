import 'dart:math';

class WheelService {
  static int generateRandomIndex(int length) {
    return Random().nextInt(length);
  }
}