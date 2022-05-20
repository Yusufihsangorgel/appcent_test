import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/widgets/ogrenci_siralayici.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenelMuh extends StatelessWidget {
  const GenelMuh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
final OgrenciController ogrenciController = Get.put(OgrenciController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Genel Mühendislik'),
        actions: [IconButton(onPressed: (){
          Get.snackbar("Uyarı", "Mühendislik Fakültesi bazında en yüksek ve en düşük notlu öğrenciler harfli sistemdeki notuyla tutulacaktır.",
          colorText: Colors.white,
          backgroundColor: Colors.black);
        }, icon: Icon(Icons.info))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ogrenciController.aList.length,
              itemBuilder: ((context, index) {
              return OgrenciSiralayici(ogrenciModel: ogrenciController.aList[index]);
            })),
          ),
          Divider(),
           Expanded(
             child: ListView.builder(
               
              itemCount: ogrenciController.fList.length,
              itemBuilder: ((context, index) {
              return OgrenciSiralayici(ogrenciModel: ogrenciController.fList[index]);
                     })),
           ),
        ],
      ),
    );
  }
}