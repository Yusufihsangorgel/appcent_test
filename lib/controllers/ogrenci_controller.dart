import 'package:appcent_test/models/ogrenci_model.dart';
import 'package:get/get.dart';
import 'dart:math';
class OgrenciController extends GetxController {
  var yazilimMuhList = <OgrenciModel>[
  ].obs;
  var bilgisayarMuhList = <OgrenciModel>[
  ].obs;

  int min = 0;
  int max = 100;
  Random random = new Random();
  var uretilenNot = 0.obs;
  var aList = <OgrenciModel>[].obs;
  var bList = <OgrenciModel>[].obs;
  var cList = <OgrenciModel>[].obs;
  var dList = <OgrenciModel>[].obs;
  var fList = <OgrenciModel>[].obs;

 @override
  void onInit() {

    super.onInit();
  }
  @override
  void onClose() {

    super.onClose();
  }

  void ogrenciEkle(OgrenciModel ogrenci) {
    ogrenciList.add(ogrenci);
  }

  void ogrenciSil(OgrenciModel ogrenci) {
    ogrenciList.remove(ogrenci);
  }

  void notUret(){
    uretilenNot.value = random.nextInt(max - min) + min;
  }

  void 


  
}
