import 'package:all_api/todos/dio4.dart';
import 'package:all_api/todos/http4.dart';
import 'package:flutter/material.dart';

class tod_button extends StatefulWidget {
  const tod_button({Key? key}) : super(key: key);

  @override
  State<tod_button> createState() => _tod_buttonState();
}

class _tod_buttonState extends State<tod_button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select page"),
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
                      return http4();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio4();
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
