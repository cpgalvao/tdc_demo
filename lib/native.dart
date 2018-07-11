import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativePage extends StatefulWidget {
  @override
  NativePageState createState() => NativePageState();
}

class NativePageState extends State<NativePage> {
  static const platform = const MethodChannel('tdc_demo_channel');
  String _message = "waiting native call...";

  NativePageState() {
    platform.setMethodCallHandler(_handlerNativeCall);
  }

  Future<dynamic> _handlerNativeCall(MethodCall call) async {
    switch (call.method) {
      case "getFlutterText":
        return Future.value("\n\nMétodo Flutter, parâmetro: ${call.arguments}");
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Flutter TDC Demo"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _getNativeText("FlutterParam");
              },
              child: Text('Native call'),
            ),
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(_message),
            ),
          ],
        )),
      );

  _getNativeText(String param) async {
    String nativeText;
    try {
      final String result = await platform.invokeMethod('getNativeText', param);
      nativeText = 'Texto final recebido do Nativo:\n\n$result';
    } on PlatformException catch (e) {
      nativeText = "Falha na leitura do texto da plataforma: '${e.message}'.";
    }

    setState(() {
      _message = nativeText;
    });
  }
}
