import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zuv_delivery_driver/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phone = "";
  String password = "";
  String error = "";
  bool isLoading = false;

  void setPhone(String val) {
    setState(() {
      phone = val;
    });
  }

  void setPassword(String val) {
    setState(() {
      password = val;
    });
  }

  void setError(String val) {
    setState(() {
      error = val;
    });
  }

  void setIsLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  Future<Response?> onSubmit() async {
    setError("");
    setIsLoading(true);
    var dio = Dio();
    try {
      var response = await dio.post(
        'https://api.zuv-delivery.mn/v1/auth/login',
        data: {"phone": phone, "password": password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      String token = response.data["token"];
      String merchantId = response.data["data"]["merchantId"];

      if (context.mounted) {
        AuthProvider authProvider = Provider.of<AuthProvider>(
          context,
          listen: false,
        );
        authProvider.setToken(token);
        authProvider.setMerchantId(merchantId);
      }
    } on DioException catch (e) {
      String errMsg = e.response?.data["error"]["message"];
      setError(errMsg);
    } finally {
      setIsLoading(false);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email',
                ),
                onChanged: setPhone,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password',
                ),
                onChanged: setPassword,
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: onSubmit,
                icon: Icon(Icons.login),
                label: Text(isLoading ? 'Loading...' : 'Sign In'),
              ),
              Text(error, style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
