import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/constans/app_constants.dart';
import 'package:flutter_dinamik_not/widget/ortalama_hesapla_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dinamik Ortalama Hesapla",
      theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OrtalamaHesaplaPage(),
    );
  }
}
