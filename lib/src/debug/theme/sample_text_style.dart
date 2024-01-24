import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SampleTextStyle extends StatelessWidget {
  final String title;
  final TextStyle style;
  final String? text;
  //final Color background;
  //final Color foreground;

  const SampleTextStyle({
    required this.title,
    required this.style,
    this.text,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 2,
      borderRadius:
        BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: Get.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text ?? title,
              style: style
                .copyWith(
                  color: colorScheme.onPrimary,
              ),
            ), // Text,
          ],
        ), // Column
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ), // BorderRadius
          color: colorScheme.primary,
        ), // BoxDecoration
      ), // Container
    ); // Material
  }
}
