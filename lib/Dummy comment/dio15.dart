import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio15 extends StatefulWidget {
  const dio15({Key? key}) : super(key: key);

  @override
  State<dio15> createState() => _dio15State();
}

class _dio15State extends State<dio15> {
  Map<String, dynamic> l = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    super.initState();
    comment_Data();
  }

  comment_Data() async {
    try {
      var response = await Dio().get('https://dummyjson.com/comments');
      print(response);
      l = response.data;
      d = dummy.fromJson(l);
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
        title: const Text("Dummy Comment dio"),
      ),
      body: status
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: d!.comments!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text("${d!.comments![index].id}"),
                    title: Text("Body :${d!.comments![index].body}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PostID :${d!.comments![index].postId}"),
                        const Text("Users :"),
                        Text("      ID :${d!.comments![index].user!.id}"),
                        Text("      Username :${d!.comments![index].user!.username}"),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class dummy {
  List<Comments>? comments;
  int? total;
  int? skip;
  int? limit;

  dummy({this.comments, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Comments {
  int? id;
  String? body;
  int? postId;
  User? user;

  Comments({this.id, this.body, this.postId, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    postId = json['postId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['postId'] = this.postId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;

  User({this.id, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}
