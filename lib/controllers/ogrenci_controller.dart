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
    if (yazilimMuhList.length > 12) {
      Get.snackbar(
        'Uyari',
        'Yazilim Mühendisliği bölümüne 12 den fazla öğrenci eklenemez',
        icon: const Icon(Icons.error),
      );
    } else {
      yazilimMuhList.add(OgrenciModel(isim: isim, yas: yas, not: not));
    }
  }

  //Bilgisayar bölümü öğrencileri eklenecek
  void bilgisayarOgrEkle(String isim, int yas, String not) {
    if (bilgisayarMuhList.length > 18) {
      Get.snackbar(
        'Uyari',
        'Bilgisayar Mühendisliği bölümüne 18 den fazla öğrenci eklenemez',
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
  void notlariHesapla() {
    for (var ogrenci in yazilimMuhList) {
      if (int.parse(ogrenci.not) >= 80) {
        aList.add(ogrenci);
      } else if (int.parse(ogrenci.not) >= 60) {
        bList.add(ogrenci);
      } else if (int.parse(ogrenci.not) >= 40) {
        cList.add(ogrenci);
      } else if (int.parse(ogrenci.not) >= 20) {
        dList.add(ogrenci);
      } else {
        fList.add(ogrenci);
      }
    }
    for (var ogrenci in bilgisayarMuhList) {
      if (int.parse(ogrenci.not) >= 80) {
        aList.add(ogrenci);
      } else if (int.parse(ogrenci.not) >= 60) {
        bList.add(ogrenci);
      } else if (int.parse(ogrenci.not) >= 40) {
        cList.add(ogrenci);
      } else if (int.parse(ogrenci.not) >= 20) {
        dList.add(ogrenci);
      } else {
        fList.add(ogrenci);
      }
    }
  }

  //Sıralama hesaplama yapıldı
  void sirala() {
    yazilimMuhList.sort((a, b) => a.not.compareTo(b.not));
    bilgisayarMuhList.sort((a, b) => a.not.compareTo(b.not));
  }

  //Ortalama hesaplama yapıldı
  void ortalamaHesapla() {
    for (var ogrenci in yazilimMuhList) {
      yazilimOrt += int.parse(ogrenci.not);
    }
    for (var ogrenci in bilgisayarMuhList) {
      bilgisayarOrt += int.parse(ogrenci.not);
    }
    yazilimOrt = yazilimOrt / yazilimMuhList.length;
    bilgisayarOrt = bilgisayarOrt / bilgisayarMuhList.length;
    genelOrt = (yazilimOrt + bilgisayarOrt) / 2;
    print(yazilimOrt);
    print(bilgisayarOrt);
    print(genelOrt);
  }

  void maxOgrenciChange() {
    for (var ogrenci in aList) {
      ogrenci.not = "A";
    }
  }

  void minOgrenciChange() {
    for (var ogrenci in fList) {
      ogrenci.not = "F";
    }
  }
}
