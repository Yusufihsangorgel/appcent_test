import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/widgets/ogrenci_siralayici.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YazilimMuh extends StatelessWidget {
  const YazilimMuh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OgrenciController ogrenciController = Get.put(OgrenciController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Yazılım Mühendisliği'),
        actions: [IconButton(onPressed: (){
          Get.snackbar("Uyarı", "Mühendislik Fakültesi bazında en yüksek ve en düşük notlu öğrenciler harfli sistemdeki notuyla tutulacaktır.",
          colorText: Colors.white,
          backgroundColor: Colors.black);
        }, icon: Icon(Icons.info))],
      ),
      body: Column(
        children: [
          Expanded( flex: 5,
            child: ListView.builder(
              itemCount: ogrenciController.yazilimMuhList.length,
              itemBuilder: ((context, index) {
                return OgrenciSiralayici(
                    ogrenciModel: ogrenciController.yazilimMuhList[index]);
              }),
            ),
          ),
          Expanded(child: Text("Ortalama : ${ogrenciController.yazilimOrt}")),
        ],
      ),
    );
  }
}
