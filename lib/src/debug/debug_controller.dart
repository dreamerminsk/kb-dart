import 'dart:core';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class DebugController extends GetxService {
  final started = Rxn<DateTime>();

  final controllers = RxMap<String, int>();

 final requests = 0.obs;

  final received = 0.obs;

  double get rpm =>
      60 *
      requests.value /
      (DateTime.now().difference(started.value ?? DateTime.now()).inSeconds);

  final lastResponse = {}.obs;

  final samples = [].obs;

  void newInit(String name) {
    controllers.update(name, (value) => value + 1, ifAbsent: () => 1);
    controllers.refresh();
  }

  void newClose(String name) {
    controllers.update(name, (value) => value - 1, ifAbsent: () => 0);
    controllers.refresh();
  }

  void newReq() {
    requests.value =requests.value+ 1;
    if (started.value == null) {
      started.value=DateTime.now();
    }
  }

  void newRes(Map res) {
    lastResponse.clear();
    lastResponse.addAll(res);
  }

  void newBytes(int bytes) {
    received.value = received.value+bytes;
  }

  @override
  void onInit() {
    newInit(this.runtimeType.toString());
    loadSamples().then((items) => samples.assignAll(items));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    newClose(this.runtimeType.toString());
    super.onClose();
  }

  Future<List<String>> loadSamples() async {
    final asset = await loadAsset();
    final ls = LineSplitter();
    return ls.convert(asset).toList();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('data/github.json.samples');
  }
}
