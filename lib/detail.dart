import 'package:flutter/material.dart';
import 'package:tdc_demo/list_item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.data}) : super(key: key);

  final ListItem data;

  @override
  _DetailPage createState() => new _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) =>
      new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter TDC Demo"),
          ),
          body: new Text(widget.data.name),
      );
}