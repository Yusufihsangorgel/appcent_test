import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OgrenciDialog extends StatelessWidget {
  final TextEditingController textEditingController;
  const OgrenciDialog({Key? key, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Get.dialog(Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: const Text("Öğrenci Not Giriş Ekranı"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                  labelText: 'Öğrenci Adı',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  )),
                    
                    controller: textEditingController,
                  ),
                ),
                TextFormField(
                  controller: textEditingController,
                ),
                TextFormField(
                  controller: textEditingController,
                ),
              ],
            ),
          ));
        },
        child: const Icon(Icons.add),
      );
  }
}