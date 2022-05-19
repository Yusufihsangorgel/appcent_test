import 'dart:async';

import 'package:appcent_test/views/main_view.dart';
import 'package:appcent_test/widgets/ogrenci_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OgrenciDialog extends StatelessWidget {
   final void Function() onPressed;
  final TextEditingController ogrTextEditingController;
  final TextEditingController yasTextEditingController;
  const OgrenciDialog(
      {Key? key,
      required this.ogrTextEditingController,
      required this.yasTextEditingController, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        Get.dialog(Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDetailString(),
              BuildTextFormField(
                  controller: ogrTextEditingController, text: "Öğrenci Adı"),
              BuildTextFormField(
                controller: yasTextEditingController,
                text: "Öğrenci Yaşı",
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          "Not random olarak 0-100 arasından oluşturulup atanacaktır!")),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black)),
                child: Text(
                  "Oluştur",
                  style: TextStyle(color: Colors.white),
                ),
               onPressed: onPressed,
              )
            ],
          ),
        ));
      },
      child: const Icon(Icons.add),
    );
  }

  Container buildDetailString() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: const Text("Öğrenci Not Giriş Ekranı"),
    );
  }
}
