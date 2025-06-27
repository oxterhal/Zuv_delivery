import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zuv_delivery_driver/model/index.dart';
import 'package:zuv_delivery_driver/providers/auth_provider.dart';
import 'package:zuv_delivery_driver/widgets/delivery_list_card/delivery_list_card.dart';
import 'package:zuv_delivery_driver/widgets/search_bar_input.dart';

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  List<DeliveryData> _allDeliveries = [];
  List<DeliveryData> _filteredDeliveries = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterDeliveries);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDeliveries() {
    String query = _searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        _filteredDeliveries = _allDeliveries;
      } else {
        _filteredDeliveries =
            _allDeliveries.where((delivery) {
              // Filter by customer phone
              bool matchesPhone =
                  delivery.customerPhone?.toLowerCase().contains(query) ??
                  false;

              // Filter by merchant name
              bool matchesMerchant =
                  delivery.merchantName?.toLowerCase().contains(query) ?? false;

              // Return true if either phone or merchant name matches
              return matchesPhone || matchesMerchant;
            }).toList();
      }
    });
  }

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

      _allDeliveries = data;
      _filteredDeliveries = data;

      return data;
    } catch (e) {
      print("error:" + e.toString());
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: FutureBuilder<List<DeliveryData>>(
        future: _getDeliveryData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  // Search Input as a sliver using your existing widget
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: SearchInput(
                        controller: _searchController,
                        hintText: 'Утас эсвэл дэлгүүрийн нэрээр хайх',
                      ),
                    ),
                  ),
                  // Delivery list
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    sliver: SliverList.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8);
                      },
                      itemBuilder: (ctx, index) {
                        DeliveryData d = _filteredDeliveries[index];
                        return DeliverListCard(d);
                      },
                      itemCount: _filteredDeliveries.length,
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
