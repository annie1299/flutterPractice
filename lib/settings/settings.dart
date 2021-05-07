import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xff185a37),
      ),
      body: Center(
        child: Text("Settings Screen"),
      ),
    );
  }
}
