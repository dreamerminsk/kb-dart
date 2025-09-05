import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: Container(
        width: double.infinity,
        height: Get.width / 2 / 1.618,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.primaryContainer,
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
            SizedBox(width: 16), // Отступ между элементами
            Container(
              alignment: Alignment.center,
              child: Text(
                '#${alpha.toRadixString(16).padLeft(2, '0').toUpperCase()}',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: colorScheme.onPrimaryContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}