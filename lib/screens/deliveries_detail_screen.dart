import 'package:flutter/material.dart';

import 'package:ui/constants/colors.dart';
import 'package:ui/constants/icons.dart';
import 'package:ui/widgets/my_icon_box.dart';
import 'package:zuv_merchant/models/deliveries.dart';
import 'package:zuv_merchant/widgets/delivery_list_card/delivery_list_card_status.dart';
import 'package:flutter_svg/svg.dart';

class DeliveriesDetailScreen extends StatelessWidget {
  final DeliveryData deliveryData;
  const DeliveriesDetailScreen({super.key, required this.deliveryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: MyIconBox(icon: narrowArrow, color: primary, size: 24),
              ),
            ),
            title: const Text(
              "Хүргэлт дэлгэрэнгүй",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Delivery status
            _buildStatusCard(),
            
            const SizedBox(height: 16),
            
            // 2. Order Information
            _buildOrderInfoCard(),
            
            const SizedBox(height: 16),
            
            // 3. Customer Information
            _buildCustomerInfoCard(),
            
            const SizedBox(height: 16),
            
            // 4. Driver Information
            if (deliveryData.deliveryDriverName != null)
              _buildDriverInfoCard(),
            
            const SizedBox(height: 16),
            
            // 5. Payment Information
            _buildPaymentInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Хүргэлтийн статус",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DeliveryStatusWidget(deliveryStatus: deliveryData.deliveryStatus),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                "Дугаар:",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                deliveryData.trackingNumber,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                "Огноо:",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                deliveryData.createdAt,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Захиалгын мэдээлэл",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow("Дэлгүүр:", deliveryData.merchantName),
          const SizedBox(height: 8),
          if (deliveryData.pickupAddress != null)
            _buildInfoRow("Авах хаяг:", deliveryData.pickupAddress!),
          const SizedBox(height: 8),
          if (deliveryData.deliveryAddress != null)
            _buildInfoRow("Хүргэх хаяг:", deliveryData.deliveryAddress!),
          const SizedBox(height: 8),
          _buildInfoRow("Нийт дүн:", "${deliveryData.totalAmount.toString()}₮"),
          const SizedBox(height: 8),
          _buildInfoRow("Хүргэлтийн тоо:", deliveryData.deliveryCount.toString()),
        ],
      ),
    );
  }

  Widget _buildCustomerInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Хүлээн авагчийн мэдээлэл",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (deliveryData.customerName != null)
            _buildInfoRow("Нэр:", deliveryData.customerName!),
          if (deliveryData.customerName != null)
            const SizedBox(height: 8),
          _buildInfoRow("Утас:", deliveryData.customerPhone),
        ],
      ),
    );
  }

  Widget _buildDriverInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Хүргэгчийн мэдээлэл",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow("Хүргэгч:", deliveryData.deliveryDriverName!),
        ],
      ),
    );
  }

  Widget _buildPaymentInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Төлбөрийн мэдээлэл",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow("Төлбөрийн статус:", deliveryData.paymentStatus),
          const SizedBox(height: 8),
          _buildInfoRow("Нийт дүн:", "${deliveryData.totalAmount.toString()}₮"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}