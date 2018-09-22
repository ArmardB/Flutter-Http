import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


void main () async {

  List _data = await getPosts();
  int num = _data[0]['userId'];
  String title = _data[0]['title'];

  String _body = "";

  for (int i = 0; i < _data.length; i++) {
    print(_data[i]['title'] );
    print(' body: ' + _data[i]['body']);
  }

  _body = _data[0]['body'];



  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'JSON Parse'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
      body: new Center(
        child: new Text('Body.... $_body'),
      ),
      ),
    ),
  );
}

Future<List> getPosts() async {
  String uri = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(uri);
  return json.decode(response.body);
}