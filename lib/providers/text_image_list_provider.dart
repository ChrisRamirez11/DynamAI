import 'package:flutter/material.dart';

class TextImageListProvider extends ChangeNotifier{
  final List<dynamic> _textImageList = [];

  List<dynamic> get textImageList =>_textImageList;

  addToList(Widget widget){
    _textImageList.add(widget);
    notifyListeners();
  }
}