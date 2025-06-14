import 'package:flutter/material.dart';

class SingOutView extends StatefulWidget {
  const SingOutView({super.key});

  @override
  State<SingOutView> createState() => _SingOutViewState();
}

class _SingOutViewState extends State<SingOutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sing Out"),
      ),
    );
  }
}
