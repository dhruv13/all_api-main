import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio11 extends StatefulWidget {
  const dio11({Key? key}) : super(key: key);

  @override
  State<dio11> createState() => _dio11State();
}

class _dio11State extends State<dio11> {
  Map<String, dynamic> m = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    super.initState();
    cat_Data();
  }

  cat_Data() async {
    try {
      var response = await Dio().get('https://dummyjson.com/carts');
      print(response);
      m = response.data;
      d = dummy.fromJson(m);
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
        title: const Text("Dummy Carts dio"),
      ),
      body: status
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: d!.carts!.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  leading: Text("${d!.carts![index].id}"),
                  title: Column(
                    children: [
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: d!.carts![index].products!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(
                                "${d!.carts![index].products![index].id}"),
                            title: Text(
                                "${d!.carts![index].products![index].title}"),
                            subtitle: Column(
                              children: [
                                Text(
                                    "price :${d!.carts![index].products![index].price}"),
                                Text(
                                    "quantity :${d!.carts![index].products![index].quantity}"),
                                Text(
                                    "total :${d!.carts![index].products![index].total}"),
                                Text(
                                    "discountPercentage :${d!.carts![index].products![index].discountPercentage}"),
                                Text(
                                    "discountedPrice :${d!.carts![index].products![index].discountedPrice}"),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ));
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class dummy {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  dummy({this.carts, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carts != null) {
      data['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Carts {
  int? id;
  List<Products>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts(
      {this.id,
      this.products,
      this.total,
      this.discountedTotal,
      this.userId,
      this.totalProducts,
      this.totalQuantity});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['discountedTotal'] = this.discountedTotal;
    data['userId'] = this.userId;
    data['totalProducts'] = this.totalProducts;
    data['totalQuantity'] = this.totalQuantity;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;

  Products(
      {this.id,
      this.title,
      this.price,
      this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedPrice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = double.parse(json['discountPercentage'].toString());
    discountedPrice = json['discountedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['discountPercentage'] = this.discountPercentage;
    data['discountedPrice'] = this.discountedPrice;
    return data;
  }
}
