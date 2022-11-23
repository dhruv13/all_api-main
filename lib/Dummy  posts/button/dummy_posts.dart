import 'package:all_api/Dummy%20%20posts/dio%2014.dart';
import 'package:all_api/Dummy%20%20posts/http%2014.dart';
import 'package:flutter/material.dart';

class dummy_posts extends StatefulWidget {
  const dummy_posts({Key? key}) : super(key: key);

  @override
  State<dummy_posts> createState() => _dummy_postsState();
}

class _dummy_postsState extends State<dummy_posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return http14();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio14();
                    },
                  ));
                },
                child: const Text("dio")),
          ],
        ),
      ),
    );
  }
}
