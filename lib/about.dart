import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Flutter TDC Demo"),
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
                  "App demo para o TDC",
                  style: TextStyle(fontSize: 30.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text("Desenvolvido por:"),
                ),
                Text(
                  "Cícero Duarte da Silva\n\nCinthia Pineroli Galvão",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
      );
}
