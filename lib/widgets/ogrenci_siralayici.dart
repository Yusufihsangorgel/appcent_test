import 'package:appcent_test/models/ogrenci_model.dart';
import 'package:flutter/material.dart';

class OgrenciSiralayici extends StatelessWidget {
  final OgrenciModel ogrenciModel;
  const OgrenciSiralayici({Key? key, required this.ogrenciModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              "İsim : ${ogrenciModel.isim}",
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
               "Yaş : ${ogrenciModel.yas}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Text( "Not : ${ogrenciModel.not}",
                style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}

