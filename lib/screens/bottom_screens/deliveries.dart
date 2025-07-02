import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zuv_delivery_driver/model/index.dart';
import 'package:zuv_delivery_driver/providers/auth_provider.dart';
import 'package:zuv_delivery_driver/widgets/delivery_list_card/delivery_list_card.dart';
import 'package:zuv_delivery_driver/widgets/search_bar_input.dart';
import 'package:zuv_delivery_driver/widgets/delivery_status_filter.dart'; // Import the new component

class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  final List<DeliveryData> _allDeliveries = [];
  final List<DeliveryData> _filteredDeliveries = [];
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  String _selectedStatus = "Бүгд";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterDeliveries);
    _loadDeliveries();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDeliveries() {
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      _filteredDeliveries.clear();

      final matching = _allDeliveries.where((delivery) {
        final matchesPhone =
            delivery.customerPhone?.toLowerCase().contains(query) ?? false;
        final matchesMerchant =
            delivery.merchantName?.toLowerCase().contains(query) ?? false;
        final matchesSearch = query.isEmpty || matchesPhone || matchesMerchant;

        // Handle "Бүгд" (All) case
        if (_selectedStatus == "Бүгд") {
          return matchesSearch;
        }

        // Handle specific status filtering - Compare enum name with selected status
        final matchesStatus = delivery.deliveryStatus.name == _selectedStatus;
        return matchesSearch && matchesStatus;
      });

      _filteredDeliveries.addAll(matching);

      // Debug print
      print('Selected status: $_selectedStatus');
      print('All deliveries: ${_allDeliveries.length}');
      print('Filtered deliveries: ${_filteredDeliveries.length}');
      if (_allDeliveries.isNotEmpty) {
        print(
          'Sample delivery status: ${_allDeliveries.first.deliveryStatus.name}',
        );
        print(
          'Sample delivery status enum: ${_allDeliveries.first.deliveryStatus}',
        );
      }
    });
  }

  void _handleStatusChange(String newStatus) {
    setState(() {
      _selectedStatus = newStatus;
      _filterDeliveries();
    });
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

      _isLoading = false;
      _errorMessage = null;
    });

    // Apply current filters after loading data
    _filterDeliveries();
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
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [_buildSearchSection(), _buildContentSection()],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchInput(
                    controller: _searchController,
                    hintText: 'Утасны дугаараар хайх',
                    borderColor: Colors.orange,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/QrCode.svg',
                          width: 18.01,
                          height: 19,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DeliveryStatusFilter(
              selectedStatus: _selectedStatus,
              onStatusChanged: _handleStatusChange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    if (_isLoading) {
      return _buildLoadingWidget();
    }

    if (_errorMessage != null) {
      return _buildErrorWidget();
    }

    return _buildDeliveryList();
  }

  Widget _buildLoadingWidget() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Center(child: Text('Error: $_errorMessage')),
      ),
    );
  }

  Widget _buildDeliveryList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder:
            (context, index) => DeliverListCard(_filteredDeliveries[index]),
        itemCount: _filteredDeliveries.length,
      ),
    );
  }
}
