import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter TDC Demo"),
        ),
        body: new Container(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "App demo para o TDC",
                  style: new TextStyle(fontSize: 30.0),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: new Text("Desenvolvido por:"),
                ),
                new Text(
                  "Cícero Duarte da Silva\n\nCinthia Pineroli Galvão",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
      );
}
