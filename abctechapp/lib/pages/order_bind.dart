import 'package:abctechapp/provider/order_provider.dart';
import 'package:abctechapp/services/geolocation_service.dart';
import 'package:abctechapp/services/order_service.dart';
import 'package:get/get.dart';

import '../controller/order_controller.dart';

class OrderBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() =>
        OrderController(GeolocationService(), OrderService(OrderProvider())));
  }
}
