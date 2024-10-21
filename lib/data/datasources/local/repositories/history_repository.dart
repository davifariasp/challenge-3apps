import 'package:challenge_3apps/models/data_user.dart';
import 'package:flutter/material.dart';

class HistoryRepository extends ChangeNotifier {
  DataUser? history;

  save(DataUser dataUser) {
    history = dataUser;
    notifyListeners();
  }

  clear() {
    history = null;
    notifyListeners();
  }

  DataUser? getHistory() {
    return history;
  }
}
