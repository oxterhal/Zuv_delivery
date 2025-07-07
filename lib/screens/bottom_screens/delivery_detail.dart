import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuv_delivery_driver/widgets/delivery_timeline.dart';

class DeliveriesDetailScreen extends StatelessWidget {
  const DeliveriesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      appBar: AppBar(
        title: Text('Хүргэлт дэлгэрэнгүй'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Харилцагч:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Hitech",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Салбар:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Салбар 1",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Холбогдох дугаар:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "3336 8996, 1234 5678",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(height: 1, color: Color(0xff1A1A1A66)),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Хаяг:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "УБ, БГД-2, Оюутаны хотхон 8р байр, 1р орц, 6давхар 603тоот",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(height: 1, color: Color(0xff1A1A1A66)),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Хаяг нэмэлт мэдээлэл:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Орцны код нь 1234 шүү, Анхаар нохойтой гэх мэт ...",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    // Delivery Timeline
                    DeliveryTimelineWidget(
                      currentStatus: 0,
                      orderDate: '2025.02.19 14:28',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Container(
                      width: 342,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 228,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F6FA),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                  ),
                                  border: Border.all(
                                    color: Color(0xffD7DBEA),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/GoogleMapIcon.svg',
                                      width: 24,
                                      height: 24,
                                      semanticsLabel: 'My SVG Icon',
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Зам заалгах",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff0A77ED),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 114,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F6FA),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14),
                                  ),
                                  border: Border.all(
                                    color: Color(0xffD7DBEA),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/CheckIcon.svg"),
                                    SizedBox(height: 6),
                                    Text(
                                      "Авсан",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff5BC643),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 114,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F6FA),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                  ),
                                  border: Border.all(
                                    color: Color(0xffD7DBEA),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/EditIcon.svg",
                                      color: Color(0xff0A77ED),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Тайлбар",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff0A77ED),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 114,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F6FA),
                                  border: Border.all(
                                    color: Color(0xffD7DBEA),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/PhoneCall.svg",
                                      width: 24,
                                      height: 24,
                                      semanticsLabel: 'My SVG Icon',
                                      color: Color(0xff0A77ED),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Залгах",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff0A77ED),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 114,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xffF5F6FA),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                  ),
                                  border: Border.all(
                                    color: Color(0xffD7DBEA),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/CloseIcon.svg",
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Хойшлуулсан",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFB4242),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Жолоочийн хийх боломжит үйлдэл",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
