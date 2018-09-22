import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


void main () async {

  List _data = await getPosts();

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'JSON Parse'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _data.length,
            padding: const EdgeInsets.all(2.5),
            itemBuilder: (BuildContext context, int position) {
              return Column(
                children: <Widget>[
                  new Divider(height: 5.5),
                  new ListTile(
                    title: new Text("${_data[position]['title']}",
                    style: new TextStyle(
                      fontSize: 17.9,
                    ),
                    ),
                    subtitle: new Text("${_data[position]['body']}",
                      style: new TextStyle(
                        fontSize: 13.9,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: new Text("${_data[position]['body'][0]}".toUpperCase(),
                      style: new TextStyle(
                        fontSize: 18.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    onTap: () => _showOnTapMessage(context, "${_data[position]['body']}"),
                  )
                ],
              );
            }),
      ),
      ),
    ),
  );
}

void _showOnTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: Text("My App"),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );

  showDialog(context: context, builder: (context) => alert);
}

Future<List> getPosts() async {
  String uri = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(uri);
  return json.decode(response.body);
}