import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cats_controller.dart';
import 'debug_view.dart';
import 'anime_details_view.dart';
import 'home_view.dart';

class CatsView extends StatelessWidget {

  @override
  Widget build(context) {
    final CatsController c = Get.put(CatsController());

    return Scaffold(
      appBar: AppBar(title: Text("WikiStatsApp"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.home), onPressed: () { Get.to(HomeView()); },),
                IconButton(icon: Icon(Icons.account_balance), onPressed: () { Get.to(DebugView()); },),
                IconButton(icon: Icon(Icons.query_stats), onPressed: () { Get.to(DebugView()); },),
              ]),

      body: Obx( () =>
      c.categories.length > 0
      ? ListView.builder(
          itemCount: c.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap: () { Get.to(AnimeDetailsView());},
             child: Card(
              child: ListTile(
                leading: FlutterLogo(size: 64.0),
                title: Text('${c.categories[index].title}'),
                subtitle: Text('...'),
            ),));
          },
        )
      : const Center(child: Text('No items'))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.refresh), onPressed: c.refresh));
  }
}