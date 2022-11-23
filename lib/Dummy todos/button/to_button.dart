import 'package:all_api/Dummy%20todos/dio13.dart';
import 'package:all_api/Dummy%20todos/http13.dart';
import 'package:flutter/material.dart';

class to_button extends StatefulWidget {
  const to_button({Key? key}) : super(key: key);

  @override
  State<to_button> createState() => _to_buttonState();
}

class _to_buttonState extends State<to_button> {
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
                      return http13();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio13();
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
