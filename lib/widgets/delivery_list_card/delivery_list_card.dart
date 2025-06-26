import 'package:flutter/material.dart';
import 'package:zuv_delivery_driver/model/index.dart';
import 'package:zuv_delivery_driver/widgets/delivery_list_card/delivery_list_card_address_details.dart';
import 'delivery_list_card_date.dart';
import 'delivery_list_card_phone.dart';
import 'delivery_list_card_status.dart';

class DeliverListCard extends StatelessWidget {
  final DeliveryData data;
  const DeliverListCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DeliveryDateUtils.formatCreatedAt(data.createdAt);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.merchantName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff181C24),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              DeliveryStatusWidget(deliveryStatus: data.deliveryStatus),
            ],
          ),
          DeliveryPhoneWidget(phoneNumber: data.customerPhone),
          DeliveryAddressDetailsWidget(deliveryAddress: data.deliveryAddress),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.report_gmailerrorred,
                size: 24,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  data.pickupAddress ?? "Байхгүй",
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xff181C24).withAlpha(50),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
