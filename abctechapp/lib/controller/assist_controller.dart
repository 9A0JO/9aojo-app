import 'package:abctechapp/services/assist_service.dart';
import 'package:get/get.dart';

import '../model/assist.dart';

class AssistController extends GetxController with StateMixin<List<Assist>> {
  late AssistService _service;
  List<Assist> allAssists = [];
  List<Assist> selectedAssists = [];

  @override
  void onInit() {
    super.onInit();
    _service = Get.find<AssistService>();
    getAssistList();
  }

  void getAssistList() {
    change([], status: RxStatus.loading());
    _service.getAssists().then((value) {
      allAssists = value;
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  void finishSelectAssist() {
    Get.back();
  }

  void selectAssist(int index) {
    Assist assistance = allAssists[index];
    int indexFound =
        selectedAssists.indexWhere((element) => element.id == assistance.id);
    if (indexFound == -1) {
      selectedAssists.add(assistance);
    } else {
      selectedAssists.removeAt(indexFound);
    }

    change(allAssists, status: RxStatus.success());
  }

  bool isSelected(int index) {
    Assist assistance = allAssists[index];
    int indexFound =
        selectedAssists.indexWhere((element) => element.id == assistance.id);
    if (indexFound >= 0) {
      return true;
    } else {
      return false;
    }
  }
}
