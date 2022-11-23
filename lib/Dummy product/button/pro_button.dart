import 'package:all_api/Dummy%20product/dio10.dart';
import 'package:all_api/Dummy%20product/http10.dart';
import 'package:flutter/material.dart';

class pro_button extends StatefulWidget {
  const pro_button({Key? key}) : super(key: key);

  @override
  State<pro_button> createState() => _pro_buttonState();
}

class _pro_buttonState extends State<pro_button> {
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
                      return http10();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio10();
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
