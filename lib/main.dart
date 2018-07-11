import 'package:flutter/material.dart';
import 'package:tdc_demo/about.dart';
import 'package:tdc_demo/detail.dart';
import 'package:tdc_demo/list_item.dart';
import 'package:tdc_demo/native.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TDC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter TDC Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _list;

  _MyHomePageState({Key key}) : super() {
    _list = _generateList();
  }

  List<ListItem> _generateList() {
    List<ListItem> list = <ListItem>[];

    list
      ..add(ListItem(
          emoji: "🍓", name: "Morango", price: 3.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍒", name: "Cereja", price: 5.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍑", name: "Pêssego", price: 8.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍇", name: "Uva", price: 4.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍋", name: "Limão", price: 2.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍎", name: "Maçã", price: 3.49, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍉", name: "Melancia", price: 6.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍈", name: "Melão", price: 6.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍍", name: "Abacaxi", price: 6.99, availableNumber: 10))
      ..add(ListItem(
          emoji: "🍊", name: "Laranja", price: 6.99, availableNumber: 10));

    return list;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Flutter TDC Demo"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help_outline),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder<AboutPage>(
                      pageBuilder: (_, __, ___) => AboutPage(),
                      transitionsBuilder: (context, animation,
                              secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    ));
              },
            ),
            IconButton(
              icon: Icon(Icons.android),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder<NativePage>(
                      pageBuilder: (_, __, ___) => NativePage(),
                      transitionsBuilder: (context, animation,
                              secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    ));
              },
            ),
          ],
        ),
        body: _getListLayout(context),
      );

  Widget _getListLayout(BuildContext context) => ListView(
        children: ListTile
            .divideTiles(
                context: context,
                color: Colors.black,
                tiles: _list.map<Widget>((listItem) => ListTile(
                      title: Text(listItem.name),
                      subtitle: Text(listItem.price.toString()),
                      leading: Hero(
                        tag: listItem.name,
                        child: Material(
                          child: Text(
                            listItem.emoji,
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator
                            .of(context)
                            .push(PageRouteBuilder<DetailPage>(
                              pageBuilder: (_, __, ___) =>
                                  DetailPage(data: listItem),
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  FadeTransition(
                                      opacity: animation, child: child),
                            ));
                      },
                    )))
            .toList(),
      );
}
