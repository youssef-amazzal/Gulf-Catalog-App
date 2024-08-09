import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
            child: ElevatedButton(
          onPressed: () => {context.pushNamed('Dashboard')},
          child: const Text("Go To Dashboard Page"),
        )),
      ),
    );
  }
}
