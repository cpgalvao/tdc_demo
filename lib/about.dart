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
