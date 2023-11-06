import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class CatsController extends GetxController {
  static final animeRef = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/master/data/2023.anime.json';
  final categories = <Category>[
    Category(lang: 'en', title: '2023 films'),
    Category(lang: 'en', title: '21st-century actresses'),
    Category(lang: 'en', title: '21st-century actors'),
    Category(lang: 'en', title: '2023 television series debuts'),
    Category(lang: 'en', title: '2023 American television series debuts'),
    Category(lang: 'en', title: '2023 television series endings'),
    Category(lang: 'en', title: '2023 anime'),
    Category(lang: 'en', title: '2023 anime television series debuts'),
    Category(lang: 'en', title: '2023 books'),
    Category(lang: 'en', title: '2023 novels'),
    Category(lang: 'en', title: 'Musical groups established in 2023'),
    Category(lang: 'en', title: 'Musical groups disestablished in 2023'),
    Category(lang: 'en', title: '2023 albums'),
    Category(lang: 'en', title: '2023 singles'),
    Category(lang: 'en', title: '2023 songs'),
    Category(lang: 'en', title: '2023 video games'),
    Category(lang: 'en', title: '2023–24 NBA season'),
    Category(lang: 'en', title: '2023–24 NHL season'),
    Category(lang: 'en', title: '2023 in snooker')
  ].obs;
  var year = 2023.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void after() {
    var newCats = categories.map(
      (item) => 
      Category(
        lang: item.lang, 
        title: item.title?.replaceFirst(year.value.toString(), (year.value + 1).toString()),
      )
    ).toList();
    categories.clear();
    categories.addAll(newCats);
    year++;
  }
  
  void before() {
    var newCats = categories.map(
      (item) => 
      Category(
        lang: item.lang, 
        title: item.title?.replaceFirst(year.value.toString(), (year.value - 1).toString()),
      )
    ).toList();
    categories.clear();
    categories.addAll(newCats);
    year--;
  }

  void fetchCategoryInfo() async {
    try {
      final text = await fetchString(animeRef);
      final jsonList = jsonDecode(text);
      
    } catch(e) {
      Get.snackbar('fetchCategoryInfo', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<String> fetchString(String link) async {
    try {
      requests += 1;
      var response = await Dio().get(link);
      return response.data.toString();
    } catch (e) {
      Get.snackbar('fetchString', '$e', snackPosition: SnackPosition.BOTTOM);
    }
    return '';
  }

}
