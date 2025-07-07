📝 App Overview

MyBank is a prototype mobile banking app built with Flutter. It allows users to log in, view account balances, transfer funds, pay bills, and view transaction history — all within a simple and intuitive interface. The app demonstrates key Flutter concepts such as form validation, routing, and stateful UI components.

🚀 How to Run the App

1. Make sure Flutter is installed on your system.
2. Clone or download the project files into a local folder.
3. Open the project in **VS Code** or **Android Studio**.
4. Run `flutter pub get` to fetch dependencies.
5. Launch the app with `flutter run` on an emulator or physical device.

⚠️ Key Challenges & What Was Learned

Routing & Navigation Conflict: Initially, I faced an issue where the app couldn’t navigate to the Transfer screen due to a naming conflict between two classes.
Solution: I created a supplementary Dart file (`trsf.dart`) and defined the `TransferScreen` class there, eliminating the conflict.
This experience helped me understand how Dart handles class imports and how modular structure helps in resolving naming collisions.




















# mybankapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
