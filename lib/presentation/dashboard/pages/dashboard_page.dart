import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Center(
            child: ElevatedButton(
          onPressed: () => {context.pushNamed('Home')},
          child: const Text("Go To Home Page"),
        )),
      ),
    );
  }
}
