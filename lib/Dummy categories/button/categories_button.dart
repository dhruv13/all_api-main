import 'package:all_api/Dummy%20categories/dio20.dart';
import 'package:all_api/Dummy%20categories/http20.dart';
import 'package:flutter/material.dart';

class categories_button extends StatefulWidget {
  const categories_button({Key? key}) : super(key: key);

  @override
  State<categories_button> createState() => _categories_buttonState();
}

class _categories_buttonState extends State<categories_button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selsect Page"),
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
                      return http20();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio20();
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
