import 'dart:core';

import 'package:async/async.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../debug/debug_controller.dart';
import '../wiki/entities/category_info.dart';
import '../wiki/entities/category_member.dart';
import '../wiki/entities/wiki_link.dart';
import '../wiki/responses/category_members_response.dart';

class CategoryController extends GetxController {
  final DebugController debug = Get.find(tag: 'debugger');
  
  final category = Rxn<CategoryInfo>();

  final members = <CategoryMember>[].obs;

  @override
  void onInit() {
    category.value = Get.arguments;
    final link = WikiLink(
      prefix: category.value!.lang,
      title: category.value!.title
    );
    fetchCategoryMembers(link).then((res) {
      _update(res);
      fetchCategoryInfo(link).then((res) =>
        _updateInfo(res));
      );
    });
    super.onInit();
  }

  void _updateInfo(Result<CategoryInfo> result) {
    switch (result) {
      case ErrorResult e:
        print(e.error);
      case ValueResult v:
        _setInfo(v.value);
      default:
        print('very strange');
    }
  }

  void _setInfo(CategoryInfo info) {
    category.update((value) {
      category.value!.subcats = info.subcats;
      category.value!.pages = info.pages;
    });
  }

  void _update(Result<CategoryMembersResponse> result) {
    switch (result) {
      case ErrorResult e:
        print(e.error);
      case ValueResult v:
        _setMembers(v.value.query);
      default:
        print('very strange');
    }
  }

  void _setMembers(List<CategoryMember> query) {
    category.update((value) {
      if (value!.cats < query.length) {
        value!.cats = query.length;
      }
    });
    members.clear();
    members.addAll(query);
  }

  Future<Result<CategoryInfo>> fetchCategoryInfo(WikiLink link) async {
    try {
      final url = 'https://${link.prefix}.wikipedia.org/w/api.php';
      final params = {
          'action': 'query',
          'prop': 'categoryinfo',
          'titles': '${link.title}',
          'formatversion': '2',
          'format': 'json',
      };
      final result = await fetchMap(url, params: params);
      switch (result) {
      case ErrorResult e:
        return Result.error(e.error);
      case ValueResult v: {
        final query = v.value['query'] as Map;
        final pages = query['pages'] as List;
        final cats = pages.map((item) => CategoryInfo.fromJson(item)).toList();
        return Result.value(cats[0].copyWith(lang: link.prefix));
        }
      default:
          return Result.error('very strange');
      }
    } catch(e, s) {
      Get.snackbar('CategoryController.fetchCategoryInfo', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<CategoryMembersResponse>> fetchCategoryMembers(WikiLink link) async {
    try {
      final url = 'https://${link.prefix}.wikipedia.org/w/api.php';
      final params = {
          'action': 'query',
          'list': 'categorymembers',
          'cmtitle': '${link.title}',
          'cmtype': 'subcat',
          'cmprop': 'ids|title|type|timestamp',
          'cmlimit': 'max',
          'formatversion': '2',
          'format': 'json',
      };
      final result = await fetchMap(url, params: params);
      switch (result) {
      case ErrorResult e:
        return Result.error(e.error);
      case ValueResult v: {
        final response = CategoryMembersResponse.fromJson(v.value);
        return Result.value(response);
        }
      default:
          return Result.error('very strange');
      }
    } catch(e, s) {
      Get.snackbar('CategoryController.fetchCategoryMembers', '$e,\r\n$s', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<Map>> fetchMap(
    String link,
    {Map<String, String>? params}) async {
    try {
      debug.newReq();
      var bytes = 0;
      final dio.Response<Map> response = await dio.Dio().get(
          link, queryParameters: params,
          onReceiveProgress: (received, total) {
            bytes = received;
          }
      );
      debug.newBytes(bytes);
      return Result.value(response.data ?? {});
    } catch (e, s) {
      Get.snackbar('CategoryController.fetchMap', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

  Future<Result<String>> fetchString(String link) async {
    try {
      debug.newReq();
      final dio.Response<String> response = await dio.Dio().get(link);
      return Result.value(response.data.toString());
    } catch (e, s) {
      Get.snackbar('fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
      return Result.error(e, s);
    }
  }

}
