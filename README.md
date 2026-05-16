# 🎡 Flutter Spin Wheel Game

A complete beginner-friendly Flutter game project that teaches Flutter from beginner to intermediate level by building a real animated Spin The Wheel Game.

---

# 📌 Table of Contents

1. Introduction
2. Features
3. Flutter Basics
4. Flutter Installation
5. Project Setup
6. Project Structure
7. Widgets Explained
8. State Management
9. Layout System
10. Assets & Sound
11. Game Logic
12. Randomization
13. Popup System
14. Win/Loss Tracking
15. Spin History
16. ListView Builder
17. Animations
18. Async Programming
19. Error Handling
20. Running the App
21. Building APK
22. Git & GitHub
23. GitHub Deployment
24. GitHub Pages Deployment
25. Firebase Deployment
26. README Enhancements
27. Common Beginner Errors
28. Future Improvements
29. Flutter Learning Roadmap
30. Final Notes

---

# 🎮 Introduction

This project is a fully functional Flutter Spin Wheel Game.

It demonstrates:
- UI Design
- Animations
- State Management
- Game Logic
- Sound Effects
- Dynamic Popups
- Lists & Counters
- Flutter Architecture
- GitHub Deployment

The goal of this project is to teach Flutter practically instead of only theory.

---

# ✨ Features

## Current Features

✅ Animated Wheel  
✅ Random Rewards  
✅ Better Luck Popup  
✅ Win Counter  
✅ Loss Counter  
✅ Latest Reward Display  
✅ Spin History  
✅ Confetti Celebration  
✅ Sound Effects  
✅ Responsive UI  
✅ Dark Theme  
✅ Beginner-Friendly Code Structure  

---

# 💙 What is Flutter?

Flutter is a UI Toolkit made by Google.

Using Flutter you can build:
- Android Apps
- iOS Apps
- Web Apps
- Windows Apps
- Mac Apps
- Linux Apps

using ONE codebase.

Official Website:

https://flutter.dev

---

# 🛠️ Flutter Installation

---

# Step 1 — Install Flutter SDK

Download Flutter SDK:

https://docs.flutter.dev/get-started/install

Extract Flutter folder.

Example:

```txt
C:\flutter
```

---

# Step 2 — Add Flutter to PATH

Add:

```txt
C:\flutter\bin
```

to Windows Environment Variables.

---

# Step 3 — Install Android Studio

Download:

https://developer.android.com/studio

Install:
- Android SDK
- Emulator
- SDK Tools

---

# Step 4 — Verify Installation

Run:

```bash
flutter doctor
```

Fix all errors.

---

# 🚀 Create Flutter Project

Create project:

```bash
flutter create spin_wheel_game
```

Move inside project:

```bash
cd spin_wheel_game
```

Open in VS Code:

```bash
code .
```

---

# 📁 Project Structure

```txt
lib/
│
├── main.dart
│
├── screens/
│   └── home_screen.dart
│
├── widgets/
│   ├── wheel_widget.dart
│   ├── spin_button.dart
│   └── result_dialog.dart
│
├── models/
│   └── wheel_item.dart
│
├── services/
│   └── wheel_service.dart
│
└── utils/
    └── constants.dart
```

---

# 🧠 Flutter Basics

---

# Widgets

Everything in Flutter is a widget.

Examples:
- Text
- Button
- Column
- Row
- Container
- Image

Example:

```dart
Text("Hello Flutter")
```

---

# StatelessWidget

Used when UI does not change.

Example:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello");
  }
}
```

---

# StatefulWidget

Used when UI changes dynamically.

Example:

```dart
class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() =>
      _CounterWidgetState();
}

class _CounterWidgetState
    extends State<CounterWidget> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text("$count");
  }
}
```

---

# setState()

Refreshes screen UI.

Example:

```dart
setState(() {
  count++;
});
```

Without `setState()`, UI will not update.

---

# 🎨 Flutter Layout System

---

# Column

Vertical layout.

```dart
Column(
  children: [
    Text("One"),
    Text("Two"),
  ],
)
```

---

# Row

Horizontal layout.

```dart
Row(
  children: [
    Icon(Icons.star),
    Text("Star"),
  ],
)
```

---

# Container

Used for:
- padding
- margin
- decoration
- colors

Example:

```dart
Container(
  padding: EdgeInsets.all(20),
  color: Colors.blue,
)
```

---

# SizedBox

Adds spacing.

Example:

```dart
SizedBox(height: 20)
```

---

# 📦 Dependencies Used

Add in `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_fortune_wheel: ^1.3.1
  audioplayers: ^5.2.1
  google_fonts: ^6.1.0
  confetti: ^0.7.0
```

Install:

```bash
flutter pub get
```

---

# 🎵 Assets & Sound

---

# Create Assets Folder

```txt
assets/
   spin.mp3
```

Place `assets` folder beside `lib`.

---

# Add Assets in pubspec.yaml

```yaml
flutter:
  assets:
    - assets/spin.mp3
```

---

# Play Audio

```dart
await audioPlayer.play(
  AssetSource('spin.mp3'),
);
```

---

# 🎡 Wheel Game Logic

---

# Random Reward Selection

```dart
Random().nextInt(wheelItems.length)
```

Generates random wheel index.

---

# Wheel Items

```dart
WheelItem(
  label: "Jackpot",
  color: Colors.green,
)
```

Represents each wheel section.

---

# 🎯 Popup Logic

---

# Detect Losing Reward

```dart
bool isLose = reward == "Try Again";
```

Checks if player lost.

---

# Dynamic Popup Title

```dart
isLose
  ? "Better Luck Next Time!"
  : "Congratulations!"
```

---

# Win/Loss Counters

```dart
if (isLose) {
  totalLosses++;
} else {
  totalWins++;
}
```

Tracks game statistics.

---

# 📜 Spin History

Store previous rewards.

```dart
List<String> spinHistory = [];
```

Add latest result:

```dart
spinHistory.insert(0, reward);
```

---

# 📋 ListView Builder

Dynamic scrolling list.

Example:

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Text(items[index]);
  },
)
```

Used for:
- Spin History
- Chat Lists
- Product Lists

---

# 🎉 Confetti Animation

Play celebration animation:

```dart
confettiController.play();
```

---

# ⏳ Async Programming

---

# Future

Represents future operation.

```dart
Future<void> loadData() async {
}
```

---

# await

Waits for operation completion.

```dart
await Future.delayed(
  Duration(seconds: 2),
);
```

---

# 🧠 Conditions

Example:

```dart
if (score > 10) {
  print("Winner");
} else {
  print("Loser");
}
```

---

# Ternary Operator

Short if/else syntax.

```dart
isLose
  ? "Lose"
  : "Win"
```

---

# 📱 Responsive Design

Get screen size:

```dart
MediaQuery.of(context).size
```

Useful for:
- tablets
- phones
- web

---

# ⚠️ Common Beginner Errors

---

# Asset Not Found

Cause:
- wrong path
- missing file

Fix:

```bash
flutter pub get
```

Check:
```txt
assets/spin.mp3
```

---

# setState Not Working

Wrong:

```dart
count++;
```

Correct:

```dart
setState(() {
  count++;
});
```

---

# RenderFlex Overflow

Fix:
- use `Expanded`
- use `SingleChildScrollView`

---

# Gradle Build Failed

Fix:

```bash
flutter clean
flutter pub get
flutter run
```

---

# ▶️ Running the App

---

# Check Devices

```bash
flutter devices
```

---

# Run App

```bash
flutter run
```

---

# Run on Chrome

```bash
flutter run -d chrome
```

---

# 📦 Build APK

Create release APK:

```bash
flutter build apk --release
```

APK Location:

```txt
build/app/outputs/flutter-apk/
```

---

# 🧹 Useful Flutter Commands

---

# Clean Build

```bash
flutter clean
```

---

# Install Packages

```bash
flutter pub get
```

---

# Upgrade Flutter

```bash
flutter upgrade
```

---

# Check Flutter Setup

```bash
flutter doctor
```

---

# 🔧 Git Basics

---

# Initialize Git

```bash
git init
```

---

# Add Files

```bash
git add .
```

---

# Commit Changes

```bash
git commit -m "Initial commit"
```

---

# Connect GitHub

```bash
git remote add origin REPOSITORY_URL
```

---

# Push Code

```bash
git push -u origin main
```

---

# 🌍 GitHub Deployment

---

# Create GitHub Repository

Go to:

https://github.com

Create repository:
```txt
spin-wheel-game
```

---

# Push Flutter Project

```bash
git init
git add .
git commit -m "Flutter game"
git branch -M main
git remote add origin YOUR_URL
git push -u origin main
```

---

# 🌐 Deploy Flutter Web on GitHub Pages

---

# Enable Web Support

```bash
flutter config --enable-web
```

---

# Build Web Version

```bash
flutter build web
```

---

# Install Peanut

```bash
dart pub global activate peanut
```

---

# Deploy to GitHub Pages

```bash
peanut
git push origin --set-upstream gh-pages
```

---

# Enable GitHub Pages

GitHub:
- Settings
- Pages

Select:
- Branch → `gh-pages`
- Folder → `/root`

Save.

---

# Your Live Website

Example:

```txt
https://yourname.github.io/spin-wheel-game/
```

---

# 🔥 Firebase Hosting Deployment

---

# Install Firebase CLI

```bash
npm install -g firebase-tools
```

---

# Login Firebase

```bash
firebase login
```

---

# Initialize Firebase

```bash
firebase init
```

Choose:
```txt
Hosting
```

Public directory:

```txt
build/web
```

---

# Build Web App

```bash
flutter build web
```

---

# Deploy

```bash
firebase deploy
```

---

# 🖼️ README Improvements

Add:
- screenshots
- GIFs
- badges
- installation guide
- features section

---

# Add Screenshot

Create folder:

```txt
screenshots/
```

Add image:

```txt
screenshots/game.png
```

README usage:

```md
![Game Screenshot](screenshots/game.png)
```

---

# 📄 License

Create:

```txt
LICENSE
```

Recommended:
```txt
MIT License
```

---

# 🏗️ Architecture Explanation

---

# screens/

Contains app pages.

Example:
- HomeScreen

---

# widgets/

Reusable UI components.

Example:
- SpinButton
- WheelWidget

---

# models/

Data structure.

Example:
- WheelItem

---

# services/

Business logic.

Example:
- Random generator

---

# utils/

Constants & helpers.

---

# 🚀 Future Improvements

You can add:
- Firebase Login
- Leaderboard
- Coins System
- Reward Inventory
- Daily Rewards
- Online Multiplayer
- AdMob Ads
- Fireworks Animation
- Particle Effects
- Backend API

---

# 📚 Flutter Learning Roadmap

---

# Beginner

✅ Widgets  
✅ Layouts  
✅ Buttons  
✅ Navigation  
✅ Assets  

---

# Intermediate

✅ State Management  
✅ APIs  
✅ Firebase  
✅ Animations  
✅ Architecture  

---

# Advanced

✅ Clean Architecture  
✅ BLoC  
✅ Riverpod  
✅ WebSockets  
✅ CI/CD  

---

# 🎯 Next Projects

Build after this:

1. Calculator App
2. Weather App
3. Notes App
4. Quiz App
5. Chat App
6. Snake Game
7. Expense Tracker
8. E-Commerce App

---

# ❤️ Final Notes

This project teaches practical Flutter development through a real-world mini-game.

By completing this project you learned:
- UI Design
- State Management
- Animations
- Async Programming
- Assets
- Game Logic
- GitHub Deployment
- APK Building

This is the foundation of real Flutter app development.

Happy Coding 🚀