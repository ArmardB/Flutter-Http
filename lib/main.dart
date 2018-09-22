import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;


void main () async {

  List _data = await getPosts();
  int num = _data[0]['userId'];
  print(num);

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'JSON Parse'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
      body: new Center(
        child: new Text('Parsing...'),
      ),
      ),
    ),
  );
}

Future getPosts() async {
  String URI = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(URI);
  return json.decode(response.body);
}