import 'package:flutter/material.dart';

class ChessboardBackground extends StatelessWidget {
  final double size;

  const ChessboardBackground({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: CustomPaint(
          size: this.size,
          painter: ChessboardPainter(),
        ),
      ),
    );
  }
}

class ChessboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLight = Paint()..color = Colors.white;
    final paintDark = Paint()..color = Colors.grey[300]!;

    for (int i = 0; i < 16; i++) {
      for (int j = 0; j < 16; j++) {
        final rect = Rect.fromLTWH(
          i * (size.width / 16),
          j * (size.height / 16),
          size.width / 16,
          size.height / 16,
        );
        canvas.drawRect(rect, (i + j) % 2 == 0 ? paintLight : paintDark);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
