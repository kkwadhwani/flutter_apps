import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsing extends StatefulWidget {
  JsonParsing({Key key}) : super(key: key);

  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome Json"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              return Text(snapshot);
            },
          ),
        ),
      ),
    );
  }

  Future getData() {
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);

    data = network.fetchData();
    data.then((value) {
      print(value);
    });

    return data;
  }
}

class Network {
  final String url;
  Network(this.url);

  Future fetchData() async {
    print("$url");

    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      //of to go
      //print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
