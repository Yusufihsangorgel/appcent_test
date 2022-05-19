import 'package:appcent_test/widgets/ogrenci_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OgrenciDialog extends StatefulWidget {
  final void Function() onPressed;
  final TextEditingController ogrTextEditingController;
  final TextEditingController yasTextEditingController;
  const OgrenciDialog(
      {Key? key,
      required this.ogrTextEditingController,
      required this.yasTextEditingController,
      required this.onPressed})
      : super(key: key);

  @override
  State<OgrenciDialog> createState() => _OgrenciDialogState();
}

class _OgrenciDialogState extends State<OgrenciDialog> {
  bool value = true;
  List isSelected = [false, true];
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        Get.dialog(Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDetailString(),
              BuildTextFormField(
                controller: widget.ogrTextEditingController,
                text: "Öğrenci Adı",
                textInputType: TextInputType.text,
                textInputFormatter: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                ],
              ),
              BuildTextFormField(
                controller: widget.yasTextEditingController,
                text: "Öğrenci Yaşı",
                textInputType: TextInputType.number,
                textInputFormatter: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              // ToggleButtons(
              //   children: <Widget>[
              //     Text("Yazılım Mühendisliği"),
              //     Text("Bilgisayar Mühendisliği"),
              //   ],
              //   onPressed: (int index) {
              //     setState(() {
              //       isSelected[index] = !isSelected[index];
              //     });
              //   },
              //   isSelected: isSelected,
              // ),
              buildUyariMessage(),
              buildTextButton(),
              buildAndroidSwitch(),
            ],
          ),
        ));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget buildAndroidSwitch() => Transform.scale(
        scale: 2,
        child: Switch(
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );

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
      onPressed: widget.onPressed,
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
