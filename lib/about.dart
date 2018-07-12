import 'package:flutter/material.dart';
import 'package:tdc_demo/generated/i18n.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).flutter_tdc_demo),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    "images/flutter.png",
                    height: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    "images/eldorado.png",
                    height: 50.0,
                  ),
                ),
                Text(
                  S.of(context).app_desc,
                  style: TextStyle(fontSize: 30.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(S.of(context).developer),
                ),
                Text(
                  "Cícero Duarte da Silva\n\nCinthia Pineroli Galvão",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
      );
}
