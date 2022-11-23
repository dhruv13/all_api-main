import 'package:all_api/Dummy%20products/dio17.dart';
import 'package:all_api/Dummy%20products/http17.dart';
import 'package:flutter/material.dart';

class prod_button extends StatefulWidget {
  const prod_button({Key? key}) : super(key: key);

  @override
  State<prod_button> createState() => _prod_buttonState();
}

class _prod_buttonState extends State<prod_button> {
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
                      return http17();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio17();
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
