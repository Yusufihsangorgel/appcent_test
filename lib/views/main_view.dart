import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/widgets/ogrenci_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final OgrenciController ogrenciController = Get.put(OgrenciController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Sayfası'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${index}'),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: OgrenciDialog(textEditingController: textEditingController)
    );
  }
}
