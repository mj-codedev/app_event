import 'package:app_event/app_event.interface.dart';
import 'package:app_event/app_event.source.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppEventExample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'AppEventExample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final test1 = TestModel1();
  @override
  void initState() {
    super.initState();

    AppEvent.register("test1", test1);
  }

  void _callEvent() {
    AppEvent.dispatch("test1");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _Button(text: test1.text),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _callEvent,
          tooltip: 'update',
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
            child: const Text("update"),
          )),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12.0)),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Text(text),
    );
  }
}

class TestModel1 implements AppEventInterface {
  String text = "list tile";
  @override
  onEventReceived(String eventName, value) {
    if (eventName == "test1") {
      text = "receive text";
    }
  }
}
