import 'dart:developer';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
class ImageSaver {
  final Uint8List imageData;
  final String name;

  const ImageSaver({required this.imageData, required this.name});

  Future<void> saveImage() async {
    try {
      final directory = Directory('/storage/emulated/0/Pictures/DynamAI');
      if (!(await directory.exists())) {
        await directory.create(recursive: true);
      }
      final String path = '${directory.path}/$name.jpg';
      log('Saving image to: $path');

      await Gal.putImageBytes(imageData, album: directory.path, name: name);
      log('Image saved successfully');
    } catch (e) {
      log('Error saving image: $e');
    }
  }
}
