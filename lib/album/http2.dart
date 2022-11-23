import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http2 extends StatefulWidget {
  const http2({Key? key}) : super(key: key);

  @override
  State<http2> createState() => _http2State();
}

class _http2State extends State<http2> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    alb_Data();
  }
                 //            HTTP            //
  alb_Data() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
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
        title: const Text("Album http"),
      ),
      body: status
          ? ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                flutter f = flutter.fromJson(l[index]);
                return Card(
                  child: ListTile(
                    leading: Text("${f.id}"),
                    title: Text("${f.userId}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${f.title}")
                      ],
                    ),
                  )
                );
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

  flutter({this.userId, this.id, this.title});

  flutter.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
