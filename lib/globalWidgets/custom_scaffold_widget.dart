import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget
      body; // This will be the body of the Scaffold (the main content of each screen)
  final bool automaticallyImplyLeading;

  const CustomScaffold({
    super.key,
    required this.body,
    this.automaticallyImplyLeading =
        false, // Optional parameter to control the leading behavior
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: const Text(
          'Plot Patrol - Beta',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Raleway',
          ),
        ),
        backgroundColor: Colors.white,
        elevation:
            0, // Optional: Set elevation to 0 if you want the app bar flat
        foregroundColor: Colors.black, // Optional: Set the text color to black
      ),
      body: body, // This is the content passed to the body of the Scaffold
    );
  }
}
