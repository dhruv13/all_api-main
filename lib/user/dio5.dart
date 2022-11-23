import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio5 extends StatefulWidget {
  const dio5({Key? key}) : super(key: key);

  @override
  State<dio5> createState() => _dio5State();
}

class _dio5State extends State<dio5> {

  List l = [];
  bool status = false;

  @override
  void initState() {
    super.initState();
    use_Data();
  }

  use_Data() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/users');
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
        title: const Text("Users dio"),
      ),
      body: status
          ? ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          flutter f = flutter.fromJson(l[index]);
          return Card(
              child: ListTile(
                leading: Text("${f.id}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name :${f.name}"),
                    Text("UName${f.username}"),
                    Text("Email :${f.email}"),
                    const Text("Address :"),
                    Text("    Suite :${f.address!.suite}"),
                    Text("    Street :${f.address!.street}"),
                    Text("    City :${f.address!.city}"),
                    Text("    ZipCode :${f.address!.zipcode}"),
                    const Text("Address :   Geo:"),
                    Text("        Lat :${f.address!.geo!.lat}"),
                    Text("        Lag :${f.address!.geo!.lng}"),
                    Text("${f.phone}"),
                    Text("${f.website}"),
                    const Text("Company :"),
                    Text("    Name :${f.company!.name}"),
                    Text("    CPhrase :${f.company!.catchPhrase}"),
                    Text("    BS :${f.company!.bs}"),
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
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  flutter(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company});

  flutter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  get geo => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}
