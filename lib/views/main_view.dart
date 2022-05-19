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
          title: const Text('Not Sayfası'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: ogrenciController.yazilimMuhList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: ogrenciController.yazilimMuhList.length > 0
                            ? Text(ogrenciController.yazilimMuhList[index].isim)
                            : Text("anan"));
                  }),
            ),
          ],
        ),
        floatingActionButton: OgrenciDialog(
            ogrTextEditingController: ogrTextEditingController,
            yasTextEditingController: yasTextEditingController,
            onPressed: () {
              ogrenciController.notUret(); //Random not üretildi
              ogrenciController.yazilimOgrEkle(
                  ogrTextEditingController.text,
                  int.parse(yasTextEditingController.text),
                  ogrenciController.uretilenNot.value
                      .toString()); //Öğrenci oluşturulup not atandı
              ogrenciController
                  .notlariHesapla(); //Notlar harflendirme kriterlerine göre listelerine atandı
              ogrenciController.sirala(); //Notlara göre öğrenciler sıralandı
              ogrenciController
                  .ortalamaHesapla(); //Bölümlerin not ortalamaları hesaplandı
              ogrenciController
                  .maxOgrenciChange(); // En yüksek not alanların notları rakam yerine harfe atandı
              ogrenciController
                  .minOgrenciChange(); // En düşük not alanların notları rakam yerine harfe atandı
              Get.snackbar(
                  "Başarılı", "Öğrenci Oluşturuldu ve Not Ataması Yapıldı",
                  colorText: Colors.white, backgroundColor: Colors.black);
              Timer.periodic(const Duration(seconds: 1),
                  (Timer t) => Get.to(const MainView()));
            }));
  }
}
