import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zuv_delivery_driver/providers/auth_provider.dart';
import 'package:zuv_delivery_driver/screens/bottom_screens/delivery_detail.dart';
import 'package:zuv_delivery_driver/screens/main_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: const Color(0xffF5F6FA),
        ),
        home: DeliveriesDetailScreen(),
      ),
    );
  }
}
