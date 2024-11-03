import 'package:flutter/material.dart';
import 'package:myapp/resources/string.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/moments_text.png',
          height: 30,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('This is the main page'),
      ),
    );
  }
}
