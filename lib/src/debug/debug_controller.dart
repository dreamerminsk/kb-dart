import 'dart:core';

import 'package:get/get.dart';

class DebugController extends GetxService {
  
  final started = Rxn<DateTime>();

  var requests = 0.obs;

  //int get requests => _requests.value;

  void newReq() {
    requests += 1;
  }

  @override
  void onInit() {
    started.value = DateTime.now();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
