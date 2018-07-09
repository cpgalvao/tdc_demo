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
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter TDC Demo"),
        ),
        body: new Container(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Hero(
                  tag: widget.data.name,
                  child: new Material(
                    color: Colors.transparent,
                    child: new Text(
                    widget.data.emoji,
                    style: new TextStyle(fontSize: 80.0),
                  ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: new Text(
                    widget.data.name,
                  ),
                ),
                new Text(
                  widget.data.price.toString(),
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
      );
}
