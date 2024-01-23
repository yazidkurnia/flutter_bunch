import 'package:flutter/material.dart';
import 'package:flutter_bunch_project/provider/providers/presensi_provider.dart';
import 'package:provider/provider.dart';

import 'content/detail_user_presensi.dart';

class ViewDetailPresensi extends StatefulWidget {
  const ViewDetailPresensi({super.key});

  @override
  State<ViewDetailPresensi> createState() => _ViewDetailPresensiState();
}

class _ViewDetailPresensiState extends State<ViewDetailPresensi> {
  @override
  void initState() {
    super.initState();
    _getUserPresensiByDate();
  }

  _getUserPresensiByDate() async {
    await Provider.of<PresensiProvider>(context, listen: false)
        .getPresensiByKidAndDate(
            '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
  }

  Widget build(BuildContext context) {
    PresensiProvider _presensiProvider = Provider.of<PresensiProvider>(context);
    bool isAbsen = false;
    // print(_presensiProvider.presensi!.waktu);
    return Scaffold(
        body: Column(
      children: [
        isAbsen == false
            ? ElevatedButton(
                onPressed: () {
                  _presensiProvider
                      .sendData(
                          '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}')
                      .then((success) {
                    if (success == true) {
                      setState(() {
                        isAbsen = true;
                      });
                    } else {
                      print('failed');
                    }
                  });
                },
                child: Text('Absen'))
            : ElevatedButton(
                onPressed: () {
                  _presensiProvider.sendData(
                      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
                },
                child: Text('Sudah absen')),
        DetailUserPresensi(waktu: '${_presensiProvider.presensi?.waktu}'),
      ],
    ));
  }
}
