import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Orlogo extends StatelessWidget {
  const Orlogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffffffff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/Orlogo.svg',
            width: 48,
            height: 48,
            semanticsLabel: 'My SVG Icon',
          ),
          SizedBox(height: 16),
          Text(
            "Орлого",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "84 хүргэлт",
            style: TextStyle(
              color: Color.fromARGB(255, 85, 86, 86),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "1,586,750 ₮",
            style: TextStyle(
              color: Color(0xff0A77ED),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
