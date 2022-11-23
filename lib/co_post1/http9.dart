import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http9 extends StatefulWidget {
  const http9({Key? key}) : super(key: key);

  @override
  State<http9> createState() => _http9State();
}

class _http9State extends State<http9> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    co_poData();
  }

  co_poData() async {
    var url =
        Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1');
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
          title: const Text("Comment Posts http"),
        ),
        body: status
            ? ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  flutter f = flutter.fromJson(l[index]);
                  return Card(
                    child: ListTile(
                      leading: Text("${f.postId}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${f.id}"),
                          Text("${f.name}"),
                          Text("${f.email}"),
                          Text("${f.body}"),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()));
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
