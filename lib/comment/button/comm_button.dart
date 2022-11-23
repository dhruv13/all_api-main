import 'package:all_api/comment/dio1.dart';
import 'package:all_api/comment/http1.dart';
import 'package:flutter/material.dart';

class comm_button extends StatefulWidget {
  const comm_button({Key? key}) : super(key: key);

  @override
  State<comm_button> createState() => _comm_buttonState();
}

class _comm_buttonState extends State<comm_button> {
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
                      return http1();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio1();
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
