import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zuv_delivery_driver/model/index.dart';
import 'package:zuv_delivery_driver/providers/auth_provider.dart';
import 'package:zuv_delivery_driver/widgets/delivery_list_card/delivery_list_card.dart';
import 'package:zuv_delivery_driver/widgets/Orlogo.dart';

class Home2page extends StatefulWidget {
  const Home2page({super.key});

  @override
  State<Home2page> createState() => _Home2pageState();
}

class _Home2pageState extends State<Home2page> {
  final List<DeliveryData> _allDeliveries = [];
  final List<DeliveryData> _filteredDeliveries = [];

  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadDeliveries();
  }

  Future<void> _loadDeliveries() async {
    try {
      final deliveries = await _fetchDeliveriesFromApi();
      _updateDeliveryLists(deliveries);
    } catch (error) {
      _handleLoadingError(error.toString());
    }
  }

  Future<List<DeliveryData>> _fetchDeliveriesFromApi() async {
    final authProvider = context.read<AuthProvider>();
    final merchantId = authProvider.merchantId ?? "";
    final token = authProvider.token ?? "";

    final dio = Dio();
    final response = await dio.get(
      'https://api.zuv-delivery.mn/v1/merchants/$merchantId/deliveries',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    final jsonList = response.data["data"] as List<dynamic>;
    return jsonList.map((json) => DeliveryData.fromJson(json)).toList();
  }

  void _updateDeliveryLists(List<DeliveryData> deliveries) {
    setState(() {
      _allDeliveries.clear();
      _filteredDeliveries.clear();

      _allDeliveries.addAll(deliveries);
      _filteredDeliveries.addAll(deliveries);

      _isLoading = false;
      _errorMessage = null;
    });
  }

  void _handleLoadingError(String error) {
    setState(() {
      _isLoading = false;
      _errorMessage = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey[200],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  "https://www.shutterstock.com/image-vector/url-shortener-use-scissors-address-260nw-2210269047.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Бархасболд",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "@Merchant",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFC6A31),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xffFC6A31),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 14,
                        bottom: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffFE934E),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffFE934E).withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        'assets/SearchIcon.svg',
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
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
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Orlogo(), Orlogo(), Orlogo()],
                ),
                const SizedBox(height: 28),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Хүргэлтүүд",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Бүгдийн харах",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFC6A31),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildDeliveryList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryList() {
    if (_isLoading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return SizedBox(
        height: 200,
        child: Center(child: Text('Error: $_errorMessage')),
      );
    }

    return Column(
      children:
          _filteredDeliveries
              .map(
                (delivery) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: DeliverListCard(delivery),
                ),
              )
              .toList(),
    );
  }
}
