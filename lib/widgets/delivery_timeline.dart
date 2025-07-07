import 'package:flutter/material.dart';

class DeliveryTimelineWidget extends StatelessWidget {
  final int currentStatus;
  final String orderDate;

  const DeliveryTimelineWidget({
    Key? key,
    this.currentStatus = 0,
    this.orderDate = '2025.02.19 14:28',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> statuses = [
      {'title': 'Захиалга үүссэн', 'status': 'completed'},
      {'title': 'Баталгаажсан', 'status': 'pending'},
      {'title': 'Хүргэлтэд гарсан', 'status': 'pending'},
      {'title': 'Хүргэгдсэн', 'status': 'pending'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Захиалга үүссэн',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            Text(
              orderDate,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Timeline
        Column(
          children: List.generate(
            statuses.length,
            (index) => _buildTimelineItem(
              title: statuses[index]['title']!,
              isActive: index <= currentStatus,
              isLast: index == statuses.length - 1,
              isPending: index > currentStatus,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required bool isActive,
    required bool isLast,
    required bool isPending,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              // Circle
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? const Color(0xFFFF6B35) : Colors.white,
                  border: Border.all(
                    color: isActive ? const Color(0xFFFF6B35) : const Color(0xFFD1D5DB),
                    width: 2,
                  ),
                ),
                child: isActive
                    ? const Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF6B35),
                          ),
                        ),
                      )
                    : null,
              ),
              // Dashed line
              if (!isLast)
                Container(
                  width: 1,
                  height: 40,
                  child: CustomPaint(
                    painter: DashedLinePainter(
                      color: const Color(0xFFD1D5DB),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  if (isPending)
                    Text(
                      'Түн удахгүй',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9CA3AF),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for dashed line
class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashHeight = 3;
    const dashSpace = 3;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}