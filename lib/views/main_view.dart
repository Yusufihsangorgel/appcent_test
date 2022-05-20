import 'dart:async';

import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/views/bilgisayar_muh_view.dart';
import 'package:appcent_test/views/genel_muh_view.dart';
import 'package:appcent_test/views/harfnot_siralamali.dart';
import 'package:appcent_test/views/yazilim_muh_view.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            BuildContainerWithText(
              text: "Yazılım Mühendisliği için tıklayın",
              onPressed: () {
                Get.to(const YazilimMuh());
              },
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            BuildContainerWithText(
              text: "Bilgisayar Mühendisliği için tıklayın",
              onPressed: () {
                Get.to(const BilgisayarMuh());
              },
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            BuildContainerWithText(
              text: "Harf Notlu Sıralaması için tıklayın",
              onPressed: () {
                Get.to(const HarfNotSiralama());
              },
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            BuildContainerWithText(
              text: "Tüm Mühendislik Sıralamaları için tıklayın",
              onPressed: () {
                Get.to(const GenelMuh());
              },
            ),
            SizedBox(
              height: Get.height * 0.2,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Text("Öğrenci Eklemek için aşağıdaki butonu kullanınız"),
              ),
            ),
          ],
        ),
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
          } else if (ogrenciController.isSelected[1] == true) {
            ogrenciController.bilgisayarOgrEkle(
                ogrTextEditingController.text,
                int.parse(yasTextEditingController.text),
                ogrenciController.uretilenNot.value
                    .toString()); //Öğrenci oluşturulup not atandı
          }
          else {
            //error

            Get.snackbar("Uyarı", "Lütfen bölüm seçiniz");
          }
          
          
        },
      ),
    );
  }
}

class BuildContainerWithText extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const BuildContainerWithText({
    Key? key,
    required this.text,
    required this.onPressed,
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
