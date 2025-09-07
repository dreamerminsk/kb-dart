import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color_utils.dart';
import 'chessboard.dart';

class SampleColorValue extends StatelessWidget {
  final Color value;

  const SampleColorValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

final containerHeight = Get.width / 2 / 1.618;
    final containerColor =
        Color.fromARGB(value.alpha, value.red, value.green, value.blue);

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          ChessboardBackground(squareSize: Get.width / 2 / 1.618),
          Container(
            width: double.infinity,
            height: containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: containerColor,
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
                      'C',
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
                    '#${value.toRadixString(16).padLeft(2, '0').toUpperCase()}',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: ColorUtils.contrastThemeColor(containerColor)),
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

