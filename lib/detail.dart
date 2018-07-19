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
          title: Text("Comprar"),
        ),
        body: Column(
          children: <Widget>[
            Hero(
              tag: widget.data.name,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  widget.data.emoji,
                ),
              ),
            ),
            Text(
              widget.data.name,
            ),
            Text(
              '$_fruitNumber/${widget.data.availableNumber.toString()}',
            ),
            Text(
              '${S
                  .of(context)
                  .currency}\$ ${widget.data.price.toString()}',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _buyItem,
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
