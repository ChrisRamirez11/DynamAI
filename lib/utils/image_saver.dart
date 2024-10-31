import 'dart:developer';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageSaver {
  final Uint8List imageData;
  final String name;

  const ImageSaver({required this.imageData, required this.name});

  Future<void> saveImage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        final directory = Directory('/storage/emulated/0/Pictures/DynamAI');
        if (!(await directory.exists())) {
          await directory.create(recursive: true);
        }
        final String path = '${directory.path}/$name.jpg';
        log(path);

        File file = File(path);
        await file.writeAsBytes(imageData);
      } catch (e) {
        log('Error al guardar la imagen: $e');
      }
    } else {
      return;
    }
  }
}
