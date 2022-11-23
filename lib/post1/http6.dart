import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http6 extends StatefulWidget {
  const http6({Key? key}) : super(key: key);

  @override
  State<http6> createState() => _http6State();
}

class _http6State extends State<http6> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    po_Data();
  }

  po_Data() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    l = jsonDecode(response.body);

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts http"),
      ),
      body: status
          ? ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          flutter f = flutter.fromJson(l[index]);
          return Card(
              child: ListTile(
                leading: Text("${f.userId}"),
                title: Text("${f.id}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${f.title}"),
                    Text("${f.body}"),
                  ],
                ),
              ));
        },
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class flutter {
  int? userId;
  int? id;
  String? title;
  String? body;

  flutter({this.userId, this.id, this.title, this.body});

  flutter.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
