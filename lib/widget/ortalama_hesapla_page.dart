import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/constans/app_constants.dart';
import 'package:flutter_dinamik_not/helper/data_helper.dart';
import 'package:flutter_dinamik_not/model/ders.dart';
import 'package:flutter_dinamik_not/widget/ders_listesi.dart';
import 'package:flutter_dinamik_not/widget/harf_dropdown_widget.dart';
import 'package:flutter_dinamik_not/widget/kredi_dropdown_widget.dart';
import 'package:flutter_dinamik_not/widget/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // form
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          //list
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                setState(() {
                  DataHelper.tumEklenenDersler.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      setState(() {
                        secilenHarfDeger = harf;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(onKrediSecildi: (kredi) {
                    setState(() {
                      secilenKrediDeger = kredi;
                    });
                  }),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var eklenecekDers = Ders(
                        ad: girilenDersAdi,
                        harfDegeri: secilenHarfDeger,
                        krediDegeri: secilenKrediDeger);

                    DataHelper.dersEkle(eklenecekDers);
                    print("----------------" * 10);
                    print(DataHelper.tumEklenenDersler);
                    print("----------------" * 10);
                    print(DataHelper.ortalamaHesapla());
                    print("----------------" * 10);

                    setState(() {});
                  }
                },
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders adını giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }
}
