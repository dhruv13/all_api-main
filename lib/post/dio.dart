import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dioapi extends StatefulWidget {
  const dioapi({Key? key}) : super(key: key);

  @override
  State<dioapi> createState() => _dioapiState();
}

class _dioapiState extends State<dioapi> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
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
        title: const Text("Post dio"),
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
