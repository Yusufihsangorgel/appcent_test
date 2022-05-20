import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/widgets/ogrenci_siralayici.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HarfNotSiralama extends StatelessWidget {
  const HarfNotSiralama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OgrenciController ogrenciController = Get.put(OgrenciController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Harf Notu Sıralama'),
        actions: [
          IconButton(
              onPressed: () {
                Get.snackbar("Uyarı",
                    "80-100 A / 60-80 B /  40-60 C /  20-40 D  / 0-20 F",
                    colorText: Colors.white, backgroundColor: Colors.black);
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Column(
        children: [
          Text("A Alanlar "),
          Expanded(
            child: ListView.builder(
              itemCount: ogrenciController.aList.length,
              itemBuilder: ((context, index) {
                return OgrenciSiralayici(
                    ogrenciModel: ogrenciController.aList[index]);
              }),
            ),
          ),
          const Divider(),
             Text("B Alanlar "),
         Expanded(
            child: ListView.builder(
              itemCount: ogrenciController.bList.length,
              itemBuilder: ((context, index) {
                return OgrenciSiralayici(
                    ogrenciModel: ogrenciController.bList[index]);
              }),
            ),
          ),
          const Divider(),
             Text("C Alanlar "),
          Expanded(
            child: ListView.builder(
              itemCount: ogrenciController.cList.length,
              itemBuilder: ((context, index) {
                return OgrenciSiralayici(
                    ogrenciModel: ogrenciController.cList[index]);
              }),
            ),
          ),
          const Divider(),
             Text("D Alanlar "),
          Expanded(
            child: ListView.builder(
              itemCount: ogrenciController.dList.length,
              itemBuilder: ((context, index) {
                return OgrenciSiralayici(
                    ogrenciModel: ogrenciController.dList[index]);
              }),
            ),
          ),
          const Divider(),
             Text("F Alanlar "),
          Expanded(
            child: ListView.builder(
              itemCount: ogrenciController.fList.length,
              itemBuilder: ((context, index) {
                return OgrenciSiralayici(
                    ogrenciModel: ogrenciController.fList[index]);
              }),
            ),
          ),
         
        ],
      ),
    );
  }
}
