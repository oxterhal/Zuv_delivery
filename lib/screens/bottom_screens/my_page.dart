import 'package:flutter/material.dart';

class Home2page extends StatefulWidget {
  const Home2page({super.key});

  @override
  State<Home2page> createState() => _Home2pageState();
}

class _Home2pageState extends State<Home2page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(children: [Text("data")]),
            ],
          ),
        ),
      ),
    );
  }
}
