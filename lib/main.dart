import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tdc_demo/about.dart';
import 'package:tdc_demo/detail.dart';
import 'package:tdc_demo/generated/i18n.dart';
import 'package:tdc_demo/list_item.dart';
import 'package:tdc_demo/native.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TDC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _list;

  List<ListItem> _generateList(BuildContext context) {
    List<ListItem> list = <ListItem>[];

    list
      ..add(ListItem(
          emoji: "🍓",
          name: S.of(context).strawberry,
          price: 3.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍒",
          name: S.of(context).cherry,
          price: 5.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍑",
          name: S.of(context).peach,
          price: 8.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍇",
          name: S.of(context).grape,
          price: 4.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍋",
          name: S.of(context).lemon,
          price: 2.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍎",
          name: S.of(context).apple,
          price: 3.49,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍉",
          name: S.of(context).watermelon,
          price: 6.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍈",
          name: S.of(context).melon,
          price: 6.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍍",
          name: S.of(context).pineapple,
          price: 6.99,
          availableNumber: 10))
      ..add(ListItem(
          emoji: "🍊",
          name: S.of(context).orange,
          price: 6.99,
          availableNumber: 10));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (_list == null) {
      _list = _generateList(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).flutter_tdc_demo),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder<AboutPage>(
                    pageBuilder: (_, __, ___) => AboutPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ));
            },
          ),
          IconButton(
            icon: Icon((defaultTargetPlatform == TargetPlatform.android)
                ? Icons.android
                : Icons.phone_iphone),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder<NativePage>(
                    pageBuilder: (_, __, ___) => NativePage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ));
            },
          ),
        ],
      ),
      body: _getListLayout(context),
    );
  }

  Widget _getListLayout(BuildContext context) => ListView(
        children: ListTile
            .divideTiles(
                context: context,
                color: Colors.black,
                tiles: _list.map<Widget>((listItem) => ListTile(
                      title: Text(listItem.name),
                      subtitle: Text('${S
                      .of(context)
                      .currency} ${listItem.price}'),
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
                        Navigator.of(context).push(PageRouteBuilder<DetailPage>(
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
