import 'dart:developer';

import 'package:abctechapp/services/geolocation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/assist.dart';

enum OrderState { creating, started, finished }

class OrderController extends GetxController {
  // ignore: unused_field
  final GeolocationServiceInterface _geolocationService;
  final formKey = GlobalKey<FormState>();
  final operatorIdController = TextEditingController();
  final selectedAssists = <Assist>[].obs;
  final screenState = OrderState.creating.obs;

  OrderController(this._geolocationService);

  @override
  void onInit() {
    super.onInit();
    _geolocationService.start();
  }

  getLocation() {
    _geolocationService
        .getPosition()
        .then((value) => log(value.toJson().toString()));
  }

  finishStartOrder() {
    getLocation();
  }

  editAssists() {
    Get.toNamed("/assists", arguments: selectedAssists);
  }
}
