import 'package:all_api/posts1/dio7.dart';
import 'package:all_api/posts1/http7.dart';
import 'package:flutter/material.dart';

class pos_button extends StatefulWidget {
  const pos_button({Key? key}) : super(key: key);

  @override
  State<pos_button> createState() => _pos_buttonState();
}

class _pos_buttonState extends State<pos_button> {
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
                      return http7();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio7();
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
