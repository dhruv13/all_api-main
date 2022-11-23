import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http3 extends StatefulWidget {
  const http3({Key? key}) : super(key: key);

  @override
  State<http3> createState() => _http3State();
}

class _http3State extends State<http3> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    pho_Data();
  }

  pho_Data() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
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
        title: const Text("Photo http"),
      ),
      body: status
          ? ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          flutter f = flutter.fromJson(l[index]);
          return Card(
              child: ListTile(
                leading: Text("${f.albumId}"),
                title: Text("${f.id}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${f.title}"),
                    Text("${f.url}"),
                    Text("${f.thumbnailUrl}"),
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
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  flutter({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  flutter.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
