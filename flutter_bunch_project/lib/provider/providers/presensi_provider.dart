import 'package:flutter/material.dart';
import 'package:flutter_bunch_project/provider/models/presensi_model.dart';
import 'package:flutter_bunch_project/provider/services/presensi_service.dart';

class PresensiProvider with ChangeNotifier {
  PresensiModel? _presensi;

  PresensiModel? get presensi => _presensi;

  Future<void> getPresensiByKidAndDate(String date) async {
    try {
      PresensiModel presensi =
          await PresensiService().getKaryawanPresensiByDate(date);
      _presensi = presensi;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> sendData(String date) async {
    try {
      var postResult = await PresensiService().sendPresensi(date);
      notifyListeners();
      return postResult;
    } catch (e) {
      throw Exception(e);
    }
  }
}
