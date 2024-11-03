import 'package:flutter/material.dart';

class SelectedAiProvider extends ChangeNotifier {
  String _imageGenerationEndpoint = 'black-forest-labs/FLUX.1-schnell';
  String _textGenerationEndpoint = 'Qwen/Qwen2.5-72B-Instruct';
  String _textTranslationEndpoint = 'google-t5/t5-base';

  String get textToImageEndpoint => _imageGenerationEndpoint;
  String get textToText => _textGenerationEndpoint;
  String get textTranslation => _textTranslationEndpoint;

  setImageGenerationEndpoint(String s) {
    _imageGenerationEndpoint = s;
    notifyListeners();
  }

  setTextGenerationEndpoint(String s) {
    _textGenerationEndpoint = s;
    notifyListeners();
  }

  setTextTranslationEndpoint(String s) {
    _textTranslationEndpoint = s;
    notifyListeners();
  }
}
