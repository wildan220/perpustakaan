import 'package:flutter_app/models/newbook_model.dart';
import 'package:flutter_app/services/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookprovider with ChangeNotifier {
  List<newboookModel> _newbook = [];

  List<newboookModel> get newbook => _newbook;

  set newbook(List<newbookModel> newbook) {
    _newbook = newbook;
    notifyListeners();
  }

  Future<void> getnewbook() async {
    try {
      List<newbookModel> newbook = await bookService().getnewbook();
      _newbook = newbook;
    } catch (e) {
      print(e);
    }
  }
}