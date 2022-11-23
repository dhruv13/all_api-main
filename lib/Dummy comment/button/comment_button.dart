import 'package:all_api/Dummy%20comment/dio15.dart';
import 'package:all_api/Dummy%20comment/http15.dart';
import 'package:flutter/material.dart';

class comment_button extends StatefulWidget {
  const comment_button({Key? key}) : super(key: key);

  @override
  State<comment_button> createState() => _comment_buttonState();
}

class _comment_buttonState extends State<comment_button> {
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
                      return http15();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio15();
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
