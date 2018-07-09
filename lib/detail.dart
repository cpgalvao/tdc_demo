import 'package:flutter/material.dart';
import 'package:tdc_demo/list_item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.data}) : super(key: key);

  final ListItem data;

  @override
  _DetailPage createState() => new _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  int _fruitNumber = 0;

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
                new Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    '${_fruitNumber}/${widget.data.availableNumber.toString()}',
                  ),
                ),
                new Text(
                  'R\$ ${widget.data.price.toString()}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
        floatingActionButton: new FloatingActionButton(
          onPressed: _buyItem,
          tooltip: 'Buy',
          child: new Icon(Icons.add),
        ),
      );

  void _buyItem() {
    setState(() {
      if (_fruitNumber < widget.data.availableNumber) {
        _fruitNumber++;
      }
    });
  }
}
