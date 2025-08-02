// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen2Page(),
      debugShowCheckedModeBanner: false,
      title: 'Screen2',
    );
  }
}

class Screen2Page extends StatefulWidget {
  const Screen2Page({super.key});

  @override
  State<Screen2Page> createState() => _Screen2PageState();
}

class _Screen2PageState extends State<Screen2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Validation id done Successfully',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
