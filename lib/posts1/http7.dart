import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http7 extends StatefulWidget {
  const http7({Key? key}) : super(key: key);

  @override
  State<http7> createState() => _http7State();
}

class _http7State extends State<http7> {

  Map? k;
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    pos_Data();
  }

  pos_Data() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200)
      {
        k = jsonDecode(response.body);
        l.add(k);
      }else{
      print("Error");
    }

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts/1 http"),
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
