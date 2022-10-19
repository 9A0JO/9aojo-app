import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../controller/assist_controller.dart';
import '../model/assist.dart';

class HomePage extends GetView<AssistController> {
  const HomePage({super.key});

  Widget renderAssist(List<Assist> assist) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: assist.length,
        itemBuilder: ((context, index) =>
            ListTile(title: Text(assist[index].name))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de serviços'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                    child: Text('Os serviços disponíveis são: ',
                        textAlign: TextAlign.center))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextButton(
                  onPressed: controller.getAssistList,
                  child: const Text('Recarregar'),
                ))
              ],
            ),
            controller.obx((state) => renderAssist(state ?? []),
                onEmpty: const Text(''),
                onError: (error) => Text(error.toString()))
          ],
        ),
      ),
    );
  }
}
