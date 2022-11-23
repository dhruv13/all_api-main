import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http8 extends StatefulWidget {
  const http8({Key? key}) : super(key: key);

  @override
  State<http8> createState() => _http8State();
}

class _http8State extends State<http8> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    po_co_Data();
  }

  po_co_Data() async {
    var url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments');
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
        title: const Text("Posts Comment http"),
      ),
      body: status
          ? ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                flutter f = flutter.fromJson(l[index]);
                return Card(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "PID :${f.postId}\nID :${f.id}\nName :${f.name}\nEmail :${f.email}\nBody :${f.body}",
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class flutter {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  flutter({this.postId, this.id, this.name, this.email, this.body});

  flutter.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}
