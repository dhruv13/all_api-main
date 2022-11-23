import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio4 extends StatefulWidget {
  const dio4({Key? key}) : super(key: key);

  @override
  State<dio4> createState() => _dio4State();
}

class _dio4State extends State<dio4> {

  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    tod_Data();
  }

  tod_Data() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/todos');
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
        title: const Text("ToDoc dio"),
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
                    Text("${f.title}"),
                    Text("${f.completed}"),
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
  bool? completed;

  flutter({this.userId, this.id, this.title, this.completed});

  flutter.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
