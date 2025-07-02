import 'package:flutter/material.dart';

enum DeliveryStatus {
  pending(text: "Хүлээгдэж буй", color: Color(0xffFFCC17)),
  verified(text: "Баталгаажсан", color: Color(0xff0A77ED)),
  departed(text: "Үүссэн", color: Color(0xff5BC643)),
  completed(text: "Дууссан", color: Color(0xff28A745)),
  cancelled(text: "Цуцлагдсан", color: Color(0xffDC3545));

  final String text;
  final Color color;
  const DeliveryStatus({required this.color, required this.text});
}

class DeliveryData {
  final String id;
  final String merchantName;
  final String? deliveryAddress;
  final String? pickupAddress;
  final String? customerName;
  final String customerPhone;
  final int totalAmount;
  final int deliveryCount;
  final String? deliveryDriverName;
  final String trackingNumber;
  final DeliveryStatus deliveryStatus;
  final String paymentStatus;
  final String createdAt;

  DeliveryData({
    required this.id,
    required this.merchantName,
    this.deliveryAddress,
    this.pickupAddress,
    this.customerName,
    required this.customerPhone,
    required this.totalAmount,
    required this.deliveryCount,
    this.deliveryDriverName,
    required this.trackingNumber,
    required this.deliveryStatus,
    required this.paymentStatus,
    required this.createdAt,
  });

  factory DeliveryData.fromJson(Map<String, dynamic> json) {
    return DeliveryData(
      id: json['id'],
      merchantName: json['merchantName'] as String,
      deliveryAddress: json['deliveryAddress'],
      customerPhone: json['customerPhone'],
      totalAmount: json["totalAmount"],
      deliveryCount: json["deliveryCount"],
      trackingNumber: json['trackingNumber'],
      deliveryStatus: parseDeliveryStatus(json["deliveryStatus"]),
      paymentStatus: json['paymentStatus'],
      deliveryDriverName: json['deliveryDriverName'],
      createdAt: json['createdAt'],

      // customer_name: json['customer_name'],
      // customer_phone_extra: json['customer_phone_extra'],
      // customer_phone: json['customer_phone'],
      // total_amount: json['total_amount'],
      // delivery_count: json['delivery_count'],
      // delivery_driver_name: json['delivery_driver_name'],
      // tracking_number: json['trackingNumber'],
      // delivery_status: parseDeliveryStatus(json["delivery_status"]),
      // payment_status: json['payment_status'],
      // created_at: json['created_at'],
      // updated_at: json['updated_at'],
      // is_canceled: json['is_canceled'],
      // canceled_reason: json['canceled_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'merchant_name': merchantName,
      'delivery_address': deliveryAddress,
      'pickup_address_full': pickupAddress,
      'customer_phone': customerPhone,
      'total_amount': totalAmount,
      'delivery_count': deliveryCount,
      'delivery_driver_name': deliveryDriverName,
      'tracking_number': trackingNumber,
      'delivery_status': deliveryStatus,
      'payment_status': paymentStatus,
      'created_at': createdAt,
    };
  }

  static DeliveryStatus parseDeliveryStatus(String val) {
    switch (val) {
      case "verified":
        return DeliveryStatus.verified;
      case "departed":
        return DeliveryStatus.departed;
      case "pending":
        return DeliveryStatus.pending;
      case "completed":
        return DeliveryStatus.completed;
      case "cancelled":
        return DeliveryStatus.cancelled;
      default:
        return DeliveryStatus.pending;
    }
  }
}
