import 'package:flutter/material.dart';
import 'package:flutter_my_awesome_uis/fade_and_bounce_tooltip/fade_and_bounce_tooltip.dart';
import 'package:flutter_my_awesome_uis/scroll_to_item_in_list_after_redirection/scroll_to_item_in_list_after_redirection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const UIList(),
    );
  }
}

final _uis = [
  const FadeAndBounceTooltipView(),
  const ScrollToItemInListAfterRedirectionView()
];

class UIList extends StatelessWidget {
  const UIList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My awesome UIs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _uis
              .map((ui) => ListTile(
                  title: Text(ui.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ui,
                      ),
                    );
                  }))
              .toList(),
        ),
      ),
    );
  }
}
