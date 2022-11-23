import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio10 extends StatefulWidget {
  const dio10({Key? key}) : super(key: key);

  @override
  State<dio10> createState() => _dio10State();
}

class _dio10State extends State<dio10> {
  Map<String, dynamic> l = {};
  bool status = false;
  flutter? f;

  @override
  void initState() {
    super.initState();
    pro_Data();
  }

  pro_Data() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      print(response);
      l = response.data;
      f = flutter.fromJson(l);
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
        title: const Text("Dummy Products dio"),
      ),
      body: status
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: f!.products!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Text("${f!.products![index].id}"),
                    title: Text("${f!.products![index].title}"),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "description : ${f!.products![index].description}",
                          ),
                          Text(
                            "price : ${f!.products![index].price}",
                          ),
                          Text(
                            "discountPercentage : ${f!.products![index].discountPercentage}",
                          ),
                          Text(
                            "rating : ${f!.products![index].rating}",
                          ),
                          Text(
                            "stock : ${f!.products![index].stock}",
                          ),
                          Text(
                            "brand : ${f!.products![index].brand}",
                          ),
                          Text(
                            "category : ${f!.products![index].category}",
                          ),
                          Text(
                            "thumbnail : ${f!.products![index].thumbnail}",
                          ),
                          Text("images :"),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: f!.products![index].images!.length,
                            itemBuilder: (context, index1) {
                              return Text(
                                  "  ${f!.products![index].images![index1]}");
                            },
                          )
                        ]),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class flutter {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  flutter({this.products, this.total, this.skip, this.limit});

  flutter.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = double.parse(json['rating'].toString());
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
