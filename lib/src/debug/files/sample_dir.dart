import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dir_page.dart';

class SampleDir extends StatelessWidget {
  final int index;
  final String title;
  final Color background;
  final Color foreground;

  const SampleDir({
    required this.index,
    required this.title,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () { Get.to(DirPage(path: title), preventDuplicates: false); },
      child: Material(
        elevation: 1,
        borderRadius: index.isEven 
            ? BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ) // BorderRadius
            : BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ), // BorderRadius
        child: Container(
          width: Get.width,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title.split('/').last,
                style: textTheme.titleMedium!
                  .copyWith(
                    color: foreground,
                ),
              ), // Text
            ],
          ), // Column
          decoration: BoxDecoration(
            borderRadius: index.isEven 
            ? BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ) // BorderRadius
            : BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ), // BorderRadius
            color: background,
          ), // BoxDecoration
        ), // Container
      ), // Material
    );
  }
}