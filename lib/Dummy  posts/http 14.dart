import 'dart:convert';

import 'package:all_api/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http14 extends StatefulWidget {
  const http14({Key? key}) : super(key: key);

  @override
  State<http14> createState() => _http14State();
}

class _http14State extends State<http14> {
  Map<String, dynamic> l = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post_Data();
  }

  post_Data() async {
    var url = Uri.parse('https://dummyjson.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body);
    d = dummy.fromJson(l);
    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy Posts"),
      ),
      body: status
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: d!.posts!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text("${d!.posts![index].id}"),
                    title: Text("${d!.posts![index].title}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Body :${d!.posts![index].body}"),
                        Text("UserId :${d!.posts![index].userId}"),
                        const Text("Tags :"),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: d!.posts![index].tags!.length,
                          itemBuilder: (context, index1) {
                            return Text(
                                "     ${d!.posts![index].tags![index1]}");
                          },
                        ),
                        Text("reactions :${d!.posts![index].reactions}")
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class dummy {
  List<Posts>? posts;
  int? total;
  int? skip;
  int? limit;

  dummy({this.posts, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  Posts(
      {this.id, this.title, this.body, this.userId, this.tags, this.reactions});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['tags'] = this.tags;
    data['reactions'] = this.reactions;
    return data;
  }
}
