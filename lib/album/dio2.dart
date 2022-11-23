import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio2 extends StatefulWidget {
  const dio2({Key? key}) : super(key: key);

  @override
  State<dio2> createState() => _dio2State();
}

class _dio2State extends State<dio2> {
  List l = [];
  bool status = true;

  @override
  void initState() {
    super.initState();
    alb_Data();
  }
                      //      DIO HTTP          //
  alb_Data() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/albums');
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
        title: const Text("Album dio"),
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
                    children: [Text("${f.title}")],
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

  flutter({this.userId, this.id, this.title});

  flutter.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
