import 'dart:async';

import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/widgets/ogrenci_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController ogrTextEditingController =
        TextEditingController();
    final TextEditingController yasTextEditingController =
        TextEditingController();
    final OgrenciController ogrenciController = Get.put(OgrenciController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Öğrenci Not Sistemi App'),
      ),
      body: Column(
        
        children: [
          BuildContainerWithText(text: "Yazılım Mühendisliği için tıklayın",onPressed: (){},),
          BuildContainerWithText(text: "Yazılım Mühendisliği için tıklayın",onPressed: (){},),
          BuildContainerWithText(text: "Yazılım Mühendisliği için tıklayın",onPressed: (){},),
           Positioned(
            top: 100,
height: 100,

             child: Container(
              child:
                  Text("Öğrenci Eklemek için aşağıdaki butonu kullanınız"),
                     ),
           ),
        ],
      ),
      floatingActionButton: OgrenciDialog(
        ogrTextEditingController: ogrTextEditingController,
        yasTextEditingController: yasTextEditingController,
        onPressed: () {
          ogrenciController.notUret(); //Random not üretildi
          if (ogrenciController.isSelected[0] == true) {
            ogrenciController.yazilimOgrEkle(
                ogrTextEditingController.text,
                int.parse(yasTextEditingController.text),
                ogrenciController.uretilenNot.value
                    .toString()); //Öğrenci oluşturulup not atandı
          } else {
            ogrenciController.bilgisayarOgrEkle(
                ogrTextEditingController.text,
                int.parse(yasTextEditingController.text),
                ogrenciController.uretilenNot.value
                    .toString()); //Öğrenci oluşturulup not atandı
          }

          ogrenciController
              .notlariHesapla(); //Notlar harflendirme kriterlerine göre listelerine atandı

          ogrenciController.sirala(); //Notlara göre öğrenciler sıralandı

          ogrenciController
              .ortalamaHesapla(); //Bölümlerin not ortalamaları hesaplandı

          ogrenciController
              .maxOgrenciChange(); // En yüksek not alanların notları rakam yerine harfe atandı

          ogrenciController
              .minOgrenciChange(); // En düşük not alanların notları rakam yerine harfe atandı
          Get.snackbar("Başarılı", "Öğrenci Oluşturuldu ve Not Ataması Yapıldı",
              colorText: Colors.white, backgroundColor: Colors.black);
          Timer.periodic(const Duration(seconds: 1),
              (Timer t) => Get.to(const MainView()));
        },
      ),
    );
  }
}

class BuildContainerWithText extends StatelessWidget {
    final void Function() onPressed;
  final String text;
  const BuildContainerWithText({
    Key? key, required this.text, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      width: Get.width * 0.5,
      child: TextButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
