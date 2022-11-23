import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio9 extends StatefulWidget {
  const dio9({Key? key}) : super(key: key);

  @override
  State<dio9> createState() => _dio9State();
}

class _dio9State extends State<dio9> {

  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    co_poData();
  }

  co_poData() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/comments?postId=1');
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
          title: const Text("Comment Posts dio"),
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
            : const Center(child: CircularProgressIndicator())
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