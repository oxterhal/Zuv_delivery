import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zuv_delivery_driver/providers/auth_provider.dart';
import 'package:zuv_delivery_driver/screens/bottom_screens/deliveries.dart';
import 'package:zuv_delivery_driver/screens/bottom_screens/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (ctx, provider, child) {
        if (provider.token == null) {
          return LoginPage();
        }
        return DeliveriesScreen();
      },
    );
  }
}
