import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_controller.dart';
import '../wiki/entities/category_info.dart';
import '../wiki/entities/category_member.dart';
import '../routes/app_pages.dart';

class CategoryView extends StatelessWidget {
  final CategoryController c = Get.find();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _buildBackground(context, colorScheme),
            _buildForeground(context, textTheme, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primary,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 8),
          Obx(() => Text(
                c.category.value?.title ?? '~~~',
                style: TextStyle(
                  fontSize: 24,
                  color: colorScheme.onPrimary,
                ),
              )),
          SizedBox(height: 12),
          Obx(() => _buildProps(context, c.category.value)),
        ],
      ),
    );
  }

  Widget _buildForeground(
      BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return Positioned(
      top: 150,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: colorScheme.secondaryContainer,
        ),
        child: Obx(() => _buildList(context, c.members)),
      ),
    );
  }

  Widget _buildProps(BuildContext context, CategoryInfo? ci) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildPropItem(context, textTheme, colorScheme, ci?.subcats.toString() ?? '∞', 'subcats'),
        _buildPropItem(context, textTheme, colorScheme, ci?.pages.toString() ?? '∞', 'pages'),
        _buildPropItem(context, textTheme, colorScheme, '∞', 'cats'),
        _buildPropItem(context, textTheme, colorScheme, '∞', 'langs'),
      ],
    );
  }

  Widget _buildPropItem(BuildContext context, TextTheme textTheme, ColorScheme colorScheme, String value, String label) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
        ),
        Text(
          label,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onPrimary),
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context, List<CategoryMember> query) {
    final colorScheme = Theme.of(context).colorScheme;

    return query.isNotEmpty
        ? ListView.builder(
            itemCount: query.length,
            itemBuilder: (BuildContext context, int index) {
              return _catCard(context, query[index]);
            },
          )
        : Center(
            child: Icon(Icons.category, color: colorScheme.primary, size: 128.0),
          );
  }

  Widget _catCard(BuildContext context, CategoryMember cm) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.CATEGORY,
          arguments: CategoryInfo(
            title: cm.title,
            lang: c.category.value?.lang ?? 'en',
          ),
          preventDuplicates: false,
        );
      },
      child: Card(
        child: ListTile(
          leading: Icon(
            Icons.category,
            color: Theme.of(context).colorScheme.primary,
            size: 64.0,
          ),
          title: Text(cm.title),
          subtitle: Text('${cm.timestamp}'),
        ),
      ),
    );
  }
}