import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio8 extends StatefulWidget {
  const dio8({Key? key}) : super(key: key);

  @override
  State<dio8> createState() => _dio8State();
}

class _dio8State extends State<dio8> {

  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    po_co_Data();
  }

  po_co_Data()
  async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts/1/comments');
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
        title: const Text("Posts Comment dio"),
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

