import 'package:appcent_test/models/ogrenci_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class OgrenciController extends GetxController {
  //Hangi mühendisliğe atama yapılacağını seçmek için
  List<bool> isSelected = [false, false].obs;

  // bölümlerin listeleri modele uygun şekilde oluşturuldu
  var yazilimMuhList = <OgrenciModel>[].obs;
  var bilgisayarMuhList = <OgrenciModel>[].obs;

  //random ataması için gerekli min ve max noktalar
  int min = 0;
  int max = 100;

  //random sınıfı çağırıldı
  Random random = Random();

  //random üretilecek not sonradan ataması yapılacak
  var uretilenNot = 0.obs;

  //not harflendirmesi için gerekli değişkenler
  var aList = <OgrenciModel>[].obs;
  var bList = <OgrenciModel>[].obs;
  var cList = <OgrenciModel>[].obs;
  var dList = <OgrenciModel>[].obs;
  var fList = <OgrenciModel>[].obs;

  //ortalama hesaplama için gerekli değişkenler
  double yazilimOrt = 0;
  double bilgisayarOrt = 0;
  double genelOrt = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Yazılım bölümü öğrencileri eklenecek
  void yazilimOgrEkle(String isim, int yas, String not) {
    if (yazilimMuhList.length > 11) {
      Get.snackbar(
        'Uyari',
        'Yazilim Mühendisliği bölümüne 12 den fazla öğrenci eklenemez',
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.error),
      );
    } else {
      yazilimMuhList.add(OgrenciModel(isim: isim, yas: yas, not: not));
    }
  }

  //Bilgisayar bölümü öğrencileri eklenecek
  void bilgisayarOgrEkle(String isim, int yas, String not) {
    if (bilgisayarMuhList.length > 17) {
      Get.snackbar(
        'Uyari',
        'Bilgisayar Mühendisliği bölümüne 18 den fazla öğrenci eklenemez',
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.error),
      );
    } else {
      bilgisayarMuhList.add(OgrenciModel(isim: isim, yas: yas, not: not));
    }
  }

  //Random not üretildi
  void notUret() {
    uretilenNot.value = random.nextInt(max - min) + min;
  }

  //Not harflendirmesi yapıldı
  void yazilimNotlariHesapla() {
    print("31");
    for (var ogrenci in yazilimMuhList) {
      if (double.parse(ogrenci.not) >= 80.00) {
        aList.add(ogrenci);
      } else if (double.parse(ogrenci.not) >= 60.00) {
        bList.add(ogrenci);
      } else if (double.parse(ogrenci.not) >= 40.00) {
        cList.add(ogrenci);
      } else if (double.parse(ogrenci.not) >= 20.00) {
        dList.add(ogrenci);
      } else {
        fList.add(ogrenci);
      }
    }
  }
//Not harflendirmesi yapıldı
  void bilgisayarNotlariHesapla(){
      print("32");
for (var ogrenci in bilgisayarMuhList) {
      if (double.tryParse(ogrenci.not)! >= 80.00) {
        aList.add(ogrenci);
      } else if (double.tryParse(ogrenci.not)! >= 60.00) {
        bList.add(ogrenci);
      } else if (double.tryParse(ogrenci.not)! >= 40.00) {
        cList.add(ogrenci);
      } else if (double.tryParse(ogrenci.not)! >= 20.00) {
        dList.add(ogrenci);
      } else {
        fList.add(ogrenci);
      }
    }
  }

  //Sıralama hesaplama yapıldı
  void sirala() {
      print("33");
    yazilimMuhList.sort((a, b) => a.not.compareTo(b.not));
    bilgisayarMuhList.sort((a, b) => a.not.compareTo(b.not));
  }

  //Ortalama hesaplama yapıldı
  void ortalamaHesapla() {
    for (var ogrenci in yazilimMuhList) {
      yazilimOrt += double.tryParse(ogrenci.not)!;
    }
    for (var ogrenci in bilgisayarMuhList) {
      bilgisayarOrt += double.tryParse(ogrenci.not)!;
    }
    yazilimOrt = yazilimOrt / yazilimMuhList.length;
    bilgisayarOrt = bilgisayarOrt / bilgisayarMuhList.length;
    genelOrt = (yazilimOrt + bilgisayarOrt) / 2;
    print(" Güncel yazilim ort : $yazilimOrt");
    print(" Güncel bilgisayar ort : $bilgisayarOrt");
    print(" Güncel genel ort : $genelOrt");
  }

  void maxOgrenciChange() {
      print("41");
    for (var ogrenci in aList) {
      ogrenci.not = "A";
    }
  }

  void minOgrenciChange() {
      print("42");
    for (var ogrenci in fList) {
      ogrenci.not = "F";
    }
  }
}
