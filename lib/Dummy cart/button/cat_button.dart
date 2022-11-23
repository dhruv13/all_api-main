import 'package:all_api/Dummy%20cart/dio11.dart';
import 'package:all_api/Dummy%20cart/http11.dart';
import 'package:flutter/material.dart';

class cat_button extends StatefulWidget {
  const cat_button({Key? key}) : super(key: key);

  @override
  State<cat_button> createState() => _cat_buttonState();
}

class _cat_buttonState extends State<cat_button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Select Page")),
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
                      return http11();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio11();
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
