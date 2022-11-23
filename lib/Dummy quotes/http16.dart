import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class http16 extends StatefulWidget {
  const http16({Key? key}) : super(key: key);

  @override
  State<http16> createState() => _http16State();
}

class _http16State extends State<http16> {
  Map<String, dynamic> l = {};
  bool status = false;
  dummy? d;
                        //     HTTP DUMMY        //
  @override
  void initState() {
    super.initState();
    quotes_Data();
  }

  quotes_Data() async {
    var url = Uri.parse('https://dummyjson.com/quotes');
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
        title: const Text("Dummy Quoyes http"),
      ),
      body: status
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: d!.quotes!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text("${d!.quotes![index].id}"),
                    title: Text("${d!.quotes![index].quote}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Completed :${d!.quotes![index].author}"),
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
  List<Quotes>? quotes;
  int? total;
  int? skip;
  int? limit;

  dummy({this.quotes, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(new Quotes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Quotes {
  int? id;
  String? quote;
  String? author;

  Quotes({this.id, this.quote, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}
