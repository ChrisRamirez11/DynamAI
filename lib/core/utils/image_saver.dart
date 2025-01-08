import 'dart:developer';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageSaver {
  final Uint8List imageData;
  final String name;

  const ImageSaver({required this.imageData, required this.name});

  Future<void> saveImage() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      try {
        final documentsDirectory = await getApplicationDocumentsDirectory();
        final directory = Directory('${documentsDirectory.path}/Pictures');
        if (!(await directory.exists())) {
          await directory.create(recursive: true);
        }
        final String path = '${directory.path}/$name.jpg';
        log('Saving image to: $path');

        File file = File(path);
        await file.writeAsBytes(imageData);
        log('Image saved successfully');
      } catch (e) {
        log('Error saving image: $e');
      }
    } else {
      log('Storage permission denied');
    }
  }
}