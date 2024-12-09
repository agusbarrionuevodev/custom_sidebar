<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

## Features

This is a flutter package, for people looking for a quick way to setup a responsive sidebar in your web.

## Getting started

To use this package you need to know that this widget already includes a scaffold and you will have to provide it with a scaffoldKey, the view you want next to that sidebar and the items to be displayed within the sidebar.

## Usage

to `/example` folder.

```dart
import 'package:custom_sidebar/sidebar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sidebar example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Custom Sidebar Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomSidebar(
      sidebarBackgroundColor: Colors.pink,
      scaffoldKey: _scaffoldKey,
      header: const Center(
        child: Text('Header'),
      ),
      footer: const Center(
        child: Text('Footer'),
      ),
      width: MediaQuery.sizeOf(context).width * 0.2,
      sideBarItems: sideBarItems(),
      child: Container(color: Colors.red, child: const Text('Content')),
    );
  }

  List<Widget> sideBarItems() {
    return [
      sideBarItem(),
      sideBarItem(),
      sideBarItem(),
      sideBarItem(),
      sideBarItem(),
      sideBarItem(),
      sideBarItem(),
      sideBarItem(),
      sideBarItem(),
    ];
  }

  Container sideBarItem() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 10,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            ),
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                ),
                child: const Text('Item')),
          ),
        ],
      ),
    );
  }
}
```

## Additional information
If you want to know more about the package or contribute to it, please visit the [GitHub repository](https://github.com/agusbarrionuevodev/custom_sidebar). Or email me at agusbarrionuevo@gmail.com
Thank you!
