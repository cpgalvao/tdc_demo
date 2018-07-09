import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativePage extends StatefulWidget {
  @override
  _NativePageState createState() => _NativePageState();
}

class _NativePageState extends State<NativePage> {
  static const platform = const MethodChannel('tdc_demo_channel');
  String _message = "waiting native call...";

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter TDC Demo"),
        ),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                _getNativeText();
              },
              child: new Text('Native call'),
            ),
            new Padding(
              padding: EdgeInsets.all(50.0),
              child: new Text(_message),
            ),
          ],
        )),
      );

  _getNativeText() async {
    String nativeText;
    try {
      final String result = await platform.invokeMethod('getNativeText');
      nativeText = 'Texto da plataforma: $result.';
    } on PlatformException catch (e) {
      nativeText = "Falha na leitura do texto da plataforma: '${e.message}'.";
    }

    setState(() {
      _message = nativeText;
    });
  }
}
