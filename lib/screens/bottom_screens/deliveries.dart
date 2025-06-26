import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:zuv_delivery_driver/model/index.dart';
import 'package:zuv_delivery_driver/providers/auth_provider.dart';
import 'package:zuv_delivery_driver/widgets/delivery_list_card/delivery_list_card.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  Future<List<DeliveryData>> _getDeliveryData() async {
    try {
      var dio = Dio();
      final provider = context.watch<AuthProvider>();
      final String merchantId = provider.merchantId ?? "";
      final String token = provider.token ?? "";
      final url =
          'https://api.zuv-delivery.mn/v1/merchants/$merchantId/deliveries';

      var d = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final List<dynamic> jsonList = d.data["data"];

      List<DeliveryData> data =
          jsonList.map((e) {
            print(e);
            DeliveryData d = DeliveryData.fromJson(e);
            return d;
          }).toList();

      return data;
    } catch (e) {
      print("error:" + e.toString());
    }
    return [];
    // print(getDeliveryInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: FutureBuilder<List<DeliveryData>>(
        future: _getDeliveryData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DeliveryData> specialData = snapshot.data ?? [];

            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(8),
                    sliver: SliverList.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8);
                      },
                      itemBuilder: (ctx, index) {
                        DeliveryData d = specialData[index];
                        return DeliverListCard(d);
                      },
                      itemCount: specialData.length,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
