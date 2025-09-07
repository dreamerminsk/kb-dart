import 'package:flutter/material.dart';

class ChessboardBackground extends StatelessWidget {
  final double squareSize;

  const ChessboardBackground({super.key, required this.squareSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: CustomPaint(
        size: Size.square(squareSize),
        painter: ChessboardPainter(),
      ),
    );
  }
}

class ChessboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLight = Paint()..color = Colors.white;
    final paintDark = Paint()..color = Colors.grey[300]!;

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        final rect = Rect.fromLTWH(
          i * (size.width / 8),
          j * (size.height / 8),
          size.width / 8,
          size.height / 8,
        );
        canvas.drawRect(rect, (i + j) % 2 == 0 ? paintLight : paintDark);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
