import 'package:flutter/material.dart';
import 'package:tdc_demo/about.dart';
import 'package:tdc_demo/detail.dart';
import 'package:tdc_demo/list_item.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter TDC Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter TDC Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _list;

  _MyHomePageState({Key key}) : super() {
    _list = _generateList();
  }

  List<ListItem> _generateList() {
    List<ListItem> list = <ListItem>[];

    list
      ..add(new ListItem(emoji: "🍓", name: "Morango", price: 3.99, availableNumber: 10))
      ..add(new ListItem(emoji: "🍒", name: "Cereja", price: 5.99, availableNumber: 10))
      ..add(new ListItem(emoji: "🍑", name: "Pêssego", price: 8.99, availableNumber: 10))
      ..add(new ListItem(emoji: "🍇", name: "Uva", price: 4.99, availableNumber: 10))
      ..add(new ListItem(emoji: "🍋", name: "Limão", price: 2.99, availableNumber: 10))
      ..add(new ListItem(emoji: "🍎", name: "Maçã", price: 3.49, availableNumber: 10))
      ..add(new ListItem(emoji: "🍉", name: "Melancia", price: 6.99, availableNumber: 10));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter TDC Demo"),
        actions: <Widget>[IconButton(
          icon: Icon(Icons.help_outline),
          onPressed: () {
            Navigator
                .of(context)
                .push(new PageRouteBuilder<AboutPage>(
              pageBuilder: (_, __, ___) =>
              new AboutPage(),
              transitionsBuilder: (context, animation,
                  secondaryAnimation, child) =>
              new FadeTransition(
                  opacity: animation, child: child),
            ));
          },
        ),],
      ),
      body: _getListLayout(context),
    );
  }

  Widget _getListLayout(BuildContext context) => new ListView(
        children: ListTile
            .divideTiles(
                context: context,
                color: Colors.black,
                tiles: _list.map<Widget>((listItem) => new ListTile(
                      title: new Text(listItem.name),
                      subtitle: new Text(listItem.price.toString()),
                      leading: new Hero(
                        tag: listItem.name,
                        child: new Material(
                            child: new Text(
                            listItem.emoji,
                            style: new TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator
                            .of(context)
                            .push(new PageRouteBuilder<DetailPage>(
                              pageBuilder: (_, __, ___) =>
                                  new DetailPage(data: listItem),
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  new FadeTransition(
                                      opacity: animation, child: child),
                            ));
                      },
                    )))
            .toList(),
      );
}
