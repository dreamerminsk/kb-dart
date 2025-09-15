import 'package:flutter/material.dart';

import 'sample_color_alpha.dart';
import 'sample_color_red.dart';
import 'sample_color_green.dart';
import 'sample_color_blue.dart';
import 'sample_color_value.dart';

class ColorPage extends StatelessWidget {
  final ValueNotifier<Color> colorNotifier;
  final Color color;

  ColorPage({
    super.key,
    required this.color,
  }) : colorNotifier = ValueNotifier<Color>(color);

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: ValueListenableBuilder<Color>(
              valueListenable: colorNotifier,
              builder: (context, value, child) {
                return SampleColorAlpha(
                  alpha: value.alpha,
                  onChanged: (newValue) {
                    colorNotifier.value =
                        colorNotifier.value.withAlpha(newValue);
                  },
                ); // SampleColorAlpha
              },
            ), // ValueListenableBuilder<Color>
          ), // Padding

          Padding(
            padding: EdgeInsets.all(8),
            child: ValueListenableBuilder<Color>(
              valueListenable: colorNotifier,
              builder: (context, value, child) {
                return SampleColorRed(
                  red: value.red,
                ); // SampleColorRed
              },
            ), // ValueListenableBuilder<Color>
          ), // Padding

          Padding(
            padding: EdgeInsets.all(8),
            child: ValueListenableBuilder<Color>(
              valueListenable: colorNotifier,
              builder: (context, value, child) {
                return SampleColorGreen(
                  green: value.green,
                ); // SampleColorGreen
              },
            ), // ValueListenableBuilder<Color>
          ), // Padding

          Padding(
            padding: EdgeInsets.all(8),
            child: ValueListenableBuilder<Color>(
              valueListenable: colorNotifier,
              builder: (context, value, child) {
                return SampleColorBlue(
                  blue: value.blue,
                ); // SampleColorBlue
              },
            ), // ValueListenableBuilder<Color>
          ), // Padding

          Padding(
            padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
            child: ValueListenableBuilder<Color>(
              valueListenable: colorNotifier,
              builder: (context, value, child) {
                return SampleColorValue(
                  value: value,
                ); // SampleColorValue
              },
            ), // ValueListenableBuilder<Color>
          ), // Padding
        ],
      ), // ListView
    );
  }
}
