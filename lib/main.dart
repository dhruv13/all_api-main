import 'package:all_api/Dummy%20%20posts/button/dummy_posts.dart';
import 'package:all_api/Dummy%20categories/button/categories_button.dart';
import 'package:all_api/Dummy%20comment/button/comment_button.dart';
import 'package:all_api/Dummy%20products%201/button/product1_button.dart';
import 'package:all_api/Dummy%20products/button/prod_button.dart';
import 'package:all_api/Dummy%20quotes/button/quotes_button.dart';
import 'package:all_api/Dummy%20search%20laptop/button/laptop_button.dart';
import 'package:all_api/Dummy%20smart%20phone/button/smart_button.dart';
import 'package:all_api/album/button/alb_button.dart';
import 'package:all_api/co_post1/button/co_po_button.dart';
import 'package:all_api/comment/button/comm_button.dart';
import 'package:all_api/photo/pho_button/pho_button.dart';
import 'package:all_api/po_comment/button/po_co_button.dart';
import 'package:all_api/post/button/button.dart';
import 'package:all_api/post1/button/po_button.dart';
import 'package:all_api/posts1/button/pos_button.dart';
import 'package:all_api/todos/button/tod_button.dart';
import 'package:all_api/user/button/use_button.dart';
import 'package:flutter/material.dart';
import 'Dummy cart/button/cat_button.dart';
import 'Dummy product/button/pro_button.dart';
import 'Dummy todos/button/to_button.dart';
import 'Dummy users/button/us_button.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: all_api(),
  ));
}

class all_api extends StatefulWidget {
  const all_api({Key? key}) : super(key: key);

  @override
  State<all_api> createState() => _all_apiState();
}

class _all_apiState extends State<all_api> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All API"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return button();
                          },
                        ));
                      },
                      child: const Text("/post")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return comm_button();
                          },
                        ));
                      },
                      child: const Text("/comments")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return alb_button();
                          },
                        ));
                      },
                      child: const Text("/albums")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return pho_bitton();
                          },
                        ));
                      },
                      child: const Text("/photos")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return tod_button();
                          },
                        ));
                      },
                      child: const Text("/todos")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return use_button();
                          },
                        ));
                      },
                      child: const Text("/users")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return po_button();
                          },
                        ));
                      },
                      child: const Text("/posts")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return pos_button();
                          },
                        ));
                      },
                      child: const Text("/posts/1")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return po_co_button();
                          },
                        ));
                      },
                      child: const Text("/posts/1/comments")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return co_po_button();
                          },
                        ));
                      },
                      child: const Text("/comments?postld=1")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return pro_button();
                          },
                        ));
                      },
                      child: const Text("DProduct")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return cat_button();
                          },
                        ));
                      },
                      child: const Text("DCart")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return us_button();
                          },
                        ));
                      },
                      child: const Text("DUser")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return to_button();
                          },
                        ));
                      },
                      child: const Text("DToDoc")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return dummy_posts();
                          },
                        ));
                      },
                      child: const Text("Dposts")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return comment_button();
                          },
                        ));
                      },
                      child: const Text("DComment")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return quotes_button();
                          },
                        ));
                      },
                      child: const Text("DQuotes")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return prod_button();
                          },
                        ));
                      },
                      child: const Text("DProducts")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return product1_button();
                          },
                        ));
                      },
                      child: const Text("DProducts/1")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return laptop_button();
                          },
                        ));
                      },
                      child: const Text("Dummy Laptop")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return categories_button();
                          },
                        ));
                      },
                      child: const Text("Dummy Cate..")),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return smart_button();
                          },
                        ));
                      },
                      child: const Text("Dummy Smartphone")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
