import 'package:flutter/material.dart';

class SelectedAiProvider extends ChangeNotifier {
  String _imageGenerationEndpoint = 'black-forest-labs/FLUX.1-schnell';
  String _textGenerationEndpoint = 'Qwen/Qwen2.5-72B-Instruct';
  String _translationEndpoint = 'google-t5/t5-base';

  String get imageGenerationEndpoint => _imageGenerationEndpoint;
  String get textGenerationEndpoint => _textGenerationEndpoint;
  String get translationEndpoint => _translationEndpoint;

  setImageGenerationEndpoint(String s) {
    _imageGenerationEndpoint = s;
    notifyListeners();
  }

  setTextGenerationEndpoint(String s) {
    _textGenerationEndpoint = s;
    notifyListeners();
  }

  setTranslationEndpoint(String s) {
    _translationEndpoint = s;
    notifyListeners();
  }
}
