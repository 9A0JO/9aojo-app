import 'package:get/get.dart';

import '../model/order.dart';
import 'constants.dart';

abstract class OrderProviderInterface {
  Future<Response> postOrder(Order order);
}

class OrderProvider extends GetConnect implements OrderProviderInterface {
  @override
  Future<Response> postOrder(Order order) =>
      post('${Constants.url}/order', order.toMap());
}
