import 'package:flutter/material.dart';
import 'package:tdc_demo/generated/i18n.dart';
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
          title: Text(S.of(context).flutter_tdc_demo),
        ),
        body: Center(
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
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.data.name,
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              Text(
                '$_fruitNumber/${widget.data.availableNumber.toString()}',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${S
                      .of(context)
                      .currency}\$ ${widget.data.price.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _buyItem,
          tooltip: S.of(context).buy,
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
