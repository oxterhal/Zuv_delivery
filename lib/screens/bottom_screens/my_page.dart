import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zuv_delivery_driver/widgets/Orlogo.dart';

class Home2page extends StatefulWidget {
  const Home2page({super.key});

  @override
  State<Home2page> createState() => _Home2pageState();
}

class _Home2pageState extends State<Home2page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Тооцоо",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Дэлгэрэнгүй харах",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFC6A31),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Orlogo(), Orlogo(), Orlogo()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
