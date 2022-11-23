import 'package:all_api/Dummy%20products%201/dio18.dart';
import 'package:all_api/Dummy%20products%201/http18.dart';
import 'package:flutter/material.dart';

class product1_button extends StatefulWidget {
  const product1_button({Key? key}) : super(key: key);

  @override
  State<product1_button> createState() => _product1_buttonState();
}

class _product1_buttonState extends State<product1_button> {
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
                      return http18();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio18();
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
