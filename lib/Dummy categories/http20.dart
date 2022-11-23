import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http20 extends StatefulWidget {
  const http20({Key? key}) : super(key: key);

  @override
  State<http20> createState() => _http20State();
}

class _http20State extends State<http20> {
  bool status = false;
  List l = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories_Data();
  }

  categories_Data() async {
    var url = Uri.parse('https://dummyjson.com/products/categories');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body);
    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dummy Categories http"),
      ),
      body: status
          ? ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${l[index]}"),
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
