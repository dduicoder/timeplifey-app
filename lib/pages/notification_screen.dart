import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notification";

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text("D"),
      ),
    );
  }
}
