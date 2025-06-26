// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   Future<Response?> signIn() async {
//     var dio = Dio();
//     try {
//       var response = await dio.post(
//         'https://api.zuv-delivery.mn/v1/auth/login',
//         data: {"phone": "86000660", "password": "1234"},
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//           },
//         ),
//       );
//       print(response.data);
//       return response;
//     } catch (e) {
//       print(e.toString());
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'email',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'password',
//               ),
//             ),
//             SizedBox(height: 40),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 minimumSize: Size(double.infinity, 50),
//               ),
//               onPressed: () {
//                 signIn();
//               },
//               icon: Icon(Icons.login),
//               label: Text('Sign In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
