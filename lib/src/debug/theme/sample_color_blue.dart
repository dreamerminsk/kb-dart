import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color_utils.dart';

class SampleColorBlue extends StatelessWidget {
  final int blue;

  const SampleColorBlue({
    super.key,
    required this.blue,
  });

  @override
  Widget build(BuildContext context) {
    //final colorScheme = Theme.of(context).colorScheme;

    final containerHeight = Get.width / 2 / 1.618;
    final containerColor = Color.fromARGB(255, 0, 0, blue);

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: containerColor,
        ),
        padding: EdgeInsets.all(16.0), // Увеличенные отступы
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
                ),
                child: Text(
                  'B',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: ColorUtils.contrastThemeColor(Colors.blue)),
                ),
              ),
            ),
            SizedBox(width: 16), // Отступ между элементами
            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Text(
                '#${blue.toRadixString(16).padLeft(2, '0').toUpperCase()}',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: ColorUtils.contrastThemeColor(containerColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
