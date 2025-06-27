import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryPhoneWidget extends StatelessWidget {
  final String phoneNumber;

  const DeliveryPhoneWidget({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(Icons.phone, size: 18, color: Color(0xffFC6A31)),
        SvgPicture.asset(
          'assets/PhoneCall.svg',
          width: 16,
          height: 16,
          semanticsLabel: 'My SVG Icon',
        ),
        SizedBox(width: 4),
        Text(
          phoneNumber,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xffFC6A31),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
