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
