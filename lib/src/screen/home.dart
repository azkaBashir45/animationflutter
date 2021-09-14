import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 45),
      ),
    ))));
  }
}
