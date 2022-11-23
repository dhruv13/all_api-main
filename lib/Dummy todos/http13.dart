import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http13 extends StatefulWidget {
  const http13({Key? key}) : super(key: key);

  @override
  State<http13> createState() => _http13State();
}

class _http13State extends State<http13> {
  Map<String, dynamic> l = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    super.initState();
    to_Data();
  }

  to_Data() async {
    var url = Uri.parse('https://dummyjson.com/todos');
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
        title: const Text("Dummy ToDoc http"),
      ),
      body: status
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: d!.todos!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text("${d!.todos![index].id}"),
                    title: Text("${d!.todos![index].todo}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Completed :${d!.todos![index].completed}"),
                        Text("UserId :${d!.todos![index].userId}"),
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
  List<Todos>? todos;
  int? total;
  int? skip;
  int? limit;

  dummy({this.todos, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['todos'] != null) {
      todos = <Todos>[];
      json['todos'].forEach((v) {
        todos!.add(new Todos.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todos != null) {
      data['todos'] = this.todos!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Todos {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todos({this.id, this.todo, this.completed, this.userId});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['todo'] = this.todo;
    data['completed'] = this.completed;
    data['userId'] = this.userId;
    return data;
  }
}
