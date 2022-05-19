import 'package:appcent_test/widgets/ogrenci_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OgrenciDialog extends StatelessWidget {
  final List<bool> isSelected;
  final void Function() onPressed;
  final TextEditingController ogrTextEditingController;
  final TextEditingController yasTextEditingController;
  OgrenciDialog(
      {Key? key,
      required this.ogrTextEditingController,
      required this.yasTextEditingController,
      required this.onPressed, required this.isSelected})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        Get.dialog(
        Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDetailString(),
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: ToggleButtons(
                      children: <Widget>[
                        Text("Yazılım Mühendisliği"),
                        Text("Bilgisayar Mühendisliği"),
                      ],
                      onPressed: (int index) {
                       isSelected[index] = !isSelected[index];
                      },
                      isSelected: isSelected,
                    ),
                  ),
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
      child: const Icon(Icons.add),
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
