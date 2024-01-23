import 'dart:convert';

import 'package:flutter_bunch_project/provider/models/presensi_model.dart';
import 'package:http/http.dart' as http;

class PresensiService {
  var _baseUrl = 'https://65afb9862f26c3f2139b9c5d.mockapi.io/presensi';

  Future<PresensiModel> getKaryawanPresensiByDate(String date) async {
    var response = await http.get(Uri.parse('$_baseUrl?waktu=$date'));

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responseData = jsonDecode(response.body)[0];

      return PresensiModel.fromJson(responseData);
    } else {
      throw Exception("Gagal mendapatkan data");
    }
  }

  Future<bool> sendPresensi(String date) async {
    var response = await http.post(Uri.parse('$_baseUrl'), body: {
      'waktu': date,
      'foto_selfie': 'sdfd.jpg',
      'tipe_log': 'Checkin',
      'karyawanid': '1'
    });

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
