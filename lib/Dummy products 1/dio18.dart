import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio18 extends StatefulWidget {
  const dio18({Key? key}) : super(key: key);

  @override
  State<dio18> createState() => _dio18State();
}

class _dio18State extends State<dio18> {
  Map<String, dynamic> l = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    super.initState();
    quotes_Data();
  }

  quotes_Data() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products/1');
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
        title: const Text("Dummy Products/1 dio"),
      ),
      body: status
          ? Card(
              child: ListTile(
                leading: Text("${d!.id}"),
                title: Text("${d!.title}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description :${d!.description}"),
                    Text("Price :${d!.price}"),
                    Text("Rating :${d!.rating}"),
                    Text("Stock :${d!.stock}"),
                    Text("Brand :${d!.brand}"),
                    Text("Category :${d!.category}"),
                    Text("Thumbnail :${d!.thumbnail}"),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: d!.images!.length,
                      itemBuilder: (context, index) {
                        return Text("Images : \n      ${d!.images![index]}");
                      },
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class dummy {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  dummy(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  dummy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
