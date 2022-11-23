import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dio20 extends StatefulWidget {
  const dio20({Key? key}) : super(key: key);

  @override
  State<dio20> createState() => _dio20State();
}

class _dio20State extends State<dio20> {
  bool status = false;
  List l = [];

  @override
  void initState() {
    super.initState();
    categories_Data();
  }

  categories_Data() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products/categories');
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
        title: const Text("Dummy Categories dio"),
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
