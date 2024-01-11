import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'debug_controller.dart';
import 'widgets/color_scheme_widget.dart';
import 'widgets/health_widget.dart';
import 'widgets/json_debug_widget.dart';
import 'widgets/text_theme_widget.dart';

class DebugView extends StatelessWidget {

  @override
  Widget build(context) {
    final DebugController c = Get.find(tag: 'debugger');
    //final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DEBUG'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.copy),
            onPressed: () { 
                    
            },
          )
        ]),

      body: ListView(
        //padding: EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 4, 4),
            child: Obx(() => HealthWidget(
              started: c.started.value ?? DateTime.now(),
              requests: c.requests.value,
              rpm: c.rpm,
            )),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 16, 4),
            child: Obx(() => JsonDebugWidget(
              jsonFiles: List<String>.from(c.samples),
            )),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 4, 4),
            child: ColorSchemeWidget(
            ),
          ), // Padding
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 16, 4),
            child: TextThemeWidget(
            ),
          ), // Padding
        ],
      ), // ListView
    );
  }

}
