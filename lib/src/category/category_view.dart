import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_controller.dart';
import '../wiki/entities/category_member.dart';

class CategoryView extends StatelessWidget {

  @override
  Widget build(context) {
    final CategoryController c = Get.find();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color:
                colorScheme.primary,
              child: Column(
                crossAxisAlignment:
                  CrossAxisAlignment.center,
                mainAxisAlignment:
                  MainAxisAlignment.start,
                children: <Widget>[
                  //SizedBox(height: 20),
                  Obx(() => Text(
                    c.category.value?.title ?? '~~~',
                    style: textTheme.headlineSmall!
                      .copyWith(
                        color: colorScheme.onPrimary
                      ),
                  )), // Text
                ],
              ), // Column
            ), // Container
            Positioned(
              top: 200,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Obx(() => _buildList(context, c.members)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ), // BorderRadius
                  color: colorScheme.secondaryContainer,
                ), // BoxDecoration
              ), //Container
            ), // Positioned
          ],
        ), //Stack
      ),
    );
  }

  Widget _buildList(BuildContext context, List<CategoryMember> query) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return query.length > 0
      ? ListView.builder(
          itemCount: query.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () { },
              child: _catCard(context, query[index]));
          },
        )
      : ListView(
          padding: const EdgeInsets.all(8),
          children: List<Widget>.generate(
            32, (int index) => Text('$index',
              style: textTheme.bodyLarge!
                .copyWith(
                  color: colorScheme.onSecondaryContainer
                ),
            )
          ),
        ); // ListView
  }

  Widget _buildCard(BuildContext context, CategoryMember cm) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Text('$cm',
      style: textTheme.bodyLarge!
        .copyWith(
          color: colorScheme.onSecondaryContainer
        ),
    );
  }

  Widget _catCard(BuildContext context, CategoryMember cm) {
    return InkWell(
      onTap: () { 
        //Get.toNamed(Routes.CATEGORY, arguments: cat); 
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.category, size: 64.0),
          title: Text('${cm.title}'),
          //subtitle: Text('${cat.subcats} categories, ${cat.pages} pages')
        ),
      ),
    );
  }
}
