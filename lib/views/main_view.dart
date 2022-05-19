import 'dart:async';

import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/widgets/ogrenci_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final TextEditingController ogrTextEditingController = TextEditingController();
  final TextEditingController yasTextEditingController = TextEditingController();
    final OgrenciController ogrenciController = Get.put(OgrenciController());
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Not Sayfası'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: ogrenciController.yazilimMuhList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: ogrenciController.yazilimMuhList.length>1 ? Text(ogrenciController.yazilimMuhList[index].isim) : Text("anan")
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: OgrenciDialog(ogrTextEditingController: ogrTextEditingController, yasTextEditingController: yasTextEditingController, onPressed: (){
        print(ogrTextEditingController);
        print(yasTextEditingController);
        ogrenciController.notUret();
        // ogrenciController.yazilimOgrEkle(ogrTextEditingController.toString(), int.parse(yasTextEditingController.toString()), ogrenciController.uretilenNot.value.toString());
         Get.snackbar(
                      "Başarılı", "Öğrenci Oluşturuldu ve Not Ataması Yapıldı",
                    colorText: Colors.white,
                      backgroundColor: Colors.black);
                 Timer.periodic(const Duration(seconds: 1),  (Timer t) => Get.to(const MainView()));
      })
    );
  }
}

