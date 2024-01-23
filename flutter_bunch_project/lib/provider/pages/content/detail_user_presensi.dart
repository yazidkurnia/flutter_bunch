import 'package:flutter/material.dart';

class DetailUserPresensi extends StatefulWidget {
  String? waktu;
  DetailUserPresensi({this.waktu});

  @override
  State<DetailUserPresensi> createState() => _DetailUserPresensiState();
}

class _DetailUserPresensiState extends State<DetailUserPresensi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('${widget.waktu}')],
    );
  }
}
