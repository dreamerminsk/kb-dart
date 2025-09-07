import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chessboard.dart';

class SampleColorAlpha extends StatelessWidget {
  final int alpha;

  const SampleColorAlpha({
    super.key,
    required this.alpha,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          ChessboardBackground(squareSize: Get.width / 2 / 1.618),
          Container(
            width: double.infinity,
            height: Get.width / 2 / 1.618,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorScheme.primary.withAlpha(alpha ~/ 2), // Применение прозрачности
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colorScheme.primary,
                    ),
                    child: Text(
                      'A',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: colorScheme.onPrimary),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '#${alpha.toRadixString(16).padLeft(2, '0').toUpperCase()}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

