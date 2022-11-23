import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio16 extends StatefulWidget {
  const dio16({Key? key}) : super(key: key);

  @override
  State<dio16> createState() => _dio16State();
}

class _dio16State extends State<dio16> {

  Map<String, dynamic> l = {};
  bool status = false;
  dummy? d;
                                 //     DUMMY     //
  @override
  void initState() {
    super.initState();
    quotes_Data();
  }

  quotes_Data() async {
    try {
      var response = await Dio().get('https://dummyjson.com/quotes');
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
        title: const Text("Dummy Quotes dio"),
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

