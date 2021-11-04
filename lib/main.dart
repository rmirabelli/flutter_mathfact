import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'math_fact.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MathFact mathFact = MathFact(found: false, text: '', type: '', number: 0);

  Future<http.Response> fetchFact() async {
    var headers = {'content-type': 'application/json'};
    return await http.get(
      Uri.parse('http://numbersapi.com/42/math'),
      headers: headers,
    );
  }

  _MyHomePageState() {
    fetchFact().then((response) {
      MathFact fact = MathFact.fromJson(jsonDecode(response.body));
      setState(() {
        mathFact = fact;
      });
    });
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
            Text(
              mathFact.text,
            ),
          ],
        ),
      ),
    );
  }
}
