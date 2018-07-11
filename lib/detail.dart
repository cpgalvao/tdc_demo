import 'package:flutter/material.dart';
import 'package:tdc_demo/list_item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key, this.data}) : super(key: key);

  final ListItem data;

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  int _fruitNumber = 0;

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
                Hero(
                  tag: widget.data.name,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      widget.data.emoji,
                      style: TextStyle(fontSize: 80.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    widget.data.name,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    '$_fruitNumber/${widget.data.availableNumber.toString()}',
                  ),
                ),
                Text(
                  'R\$ ${widget.data.price.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: _buyItem,
          tooltip: 'Buy',
          child: Icon(Icons.add),
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
