import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio7 extends StatefulWidget {
  const dio7({Key? key}) : super(key: key);

  @override
  State<dio7> createState() => _dio7State();
}

class _dio7State extends State<dio7> {
  Map? k;
  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    pos_Data();
  }

  pos_Data() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/1');
      print(response);

      setState(() {
        if (response.statusCode == 200) {
          l = response.data;
          l.add(k);
        } else {
          print("Error");
        }
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
        title: const Text("Posts/1 dio"),
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
