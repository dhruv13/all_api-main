import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio3 extends StatefulWidget {
  const dio3({Key? key}) : super(key: key);

  @override
  State<dio3> createState() => _dio3State();
}

class _dio3State extends State<dio3> {

  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    pho_Data();
  }

  pho_Data() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/photos');
      print(response);
      l = response.data;
      setState(() {
        status = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo dio"),
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
