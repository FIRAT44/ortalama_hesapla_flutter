import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/constans/app_constants.dart';
import 'package:flutter_dinamik_not/helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  const KrediDropdownWidget({Key? key, required this.onKrediSecildi})
      : super(key: key);
  final Function onKrediSecildi;
  @override
  _KrediDropdownWidgetState createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDeger = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenKrediDeger,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
            widget.onKrediSecildi(deger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
