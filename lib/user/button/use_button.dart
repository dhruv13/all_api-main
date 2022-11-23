import 'package:all_api/user/dio5.dart';
import 'package:all_api/user/http5.dart';
import 'package:flutter/material.dart';

class use_button extends StatefulWidget {
  const use_button({Key? key}) : super(key: key);

  @override
  State<use_button> createState() => _use_buttonState();
}

class _use_buttonState extends State<use_button> {
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
                      return http5();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio5();
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
