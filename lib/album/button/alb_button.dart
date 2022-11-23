import 'package:all_api/album/dio2.dart';
import 'package:all_api/album/http2.dart';
import 'package:flutter/material.dart';

class alb_button extends StatefulWidget {
  const alb_button({Key? key}) : super(key: key);

  @override
  State<alb_button> createState() => _alb_buttonState();
}

class _alb_buttonState extends State<alb_button> {
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
                      return http2();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio2();
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
