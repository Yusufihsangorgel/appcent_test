import 'package:appcent_test/controllers/ogrenci_controller.dart';
import 'package:appcent_test/widgets/ogrenci_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class OgrenciDialog extends StatelessWidget {
  final void Function() onPressed;
  final TextEditingController ogrTextEditingController;
  final TextEditingController yasTextEditingController;
  OgrenciDialog({
    Key? key,
    required this.ogrTextEditingController,
    required this.yasTextEditingController,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OgrenciController ogrenciController = Get.put(OgrenciController());
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              insetPadding: EdgeInsets.all(10),
              title: buildDetailString(),
              content: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildTextFormField(
                      controller: ogrTextEditingController,
                      text: "Öğrenci Adı",
                      textInputType: TextInputType.text,
                      textInputFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextFormField(
                      controller: yasTextEditingController,
                      text: "Öğrenci Yaşı",
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => buildTogglebuttons(ogrenciController)),
                    const SizedBox(
                      height: 10,
                    ),
                    buildUyariMessage(),
                    buildTextButton(),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }

  Container buildTogglebuttons(OgrenciController ogrenciController) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: ToggleButtons(
        children: <Widget>[
          Text("Yazılım Mühendisliği"),
          Text("Bilgisayar Mühendisliği"),
        ],
        onPressed: (int index) {
          if (ogrenciController.isSelected[0] == false &&
              ogrenciController.isSelected[1] == false) {
            ogrenciController.isSelected[index] =
                !ogrenciController.isSelected[index];
          } else if (ogrenciController.isSelected[0] == true) {
            ogrenciController.isSelected[index] =
                !ogrenciController.isSelected[index];
            ogrenciController.isSelected[1] = true;
            ogrenciController.isSelected[0] = false;
            Get.snackbar("Uyarı", "Sadece bir bölüm seçebilirsiniz",
                backgroundColor: Colors.red, colorText: Colors.white);
          } else if (ogrenciController.isSelected[1] == true) {
            ogrenciController.isSelected[index] =
                !ogrenciController.isSelected[index];
            ogrenciController.isSelected[1] = false;
            ogrenciController.isSelected[0] = true;
            Get.snackbar("Uyarı", "Sadece bir bölüm seçebilirsiniz",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        },
        isSelected: ogrenciController.isSelected,
      ),
    );
  }

  Padding buildUyariMessage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                "Not random olarak 0-100 arasından oluşturulup atanacaktır!")),
      ),
    );
  }

  TextButton buildTextButton() {
    return TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.black)),
      child: Text(
        "Oluştur",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }

  Container buildDetailString() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: const Text("Öğrenci Not Giriş Ekranı"),
    );
  }
}
