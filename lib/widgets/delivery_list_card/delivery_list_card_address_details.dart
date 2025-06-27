import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryAddressDetailsWidget extends StatelessWidget {
  final String? deliveryAddress;

  const DeliveryAddressDetailsWidget({super.key, this.deliveryAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const Icon(
          //   Icons.location_on_rounded,
          //   size: 24,
          //   color: Colors.black54,
          // ),
          SvgPicture.asset(
            'assets/MarkerPin.svg',
            width: 24,
            height: 24,
            semanticsLabel: 'My SVG Icon',
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  deliveryAddress ?? "Хаяг оруулаагүй",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
