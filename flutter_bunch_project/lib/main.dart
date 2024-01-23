import 'package:flutter/material.dart';
import 'package:flutter_bunch_project/provider/pages/view_detail_presensi.dart';
import 'package:flutter_bunch_project/provider/providers/presensi_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PresensiProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter',

        debugShowCheckedModeBanner: false,
        // scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(
          child: ViewDetailPresensi(),
        ),
      ),
    );
  }
}
