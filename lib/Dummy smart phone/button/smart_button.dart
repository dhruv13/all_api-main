import 'package:all_api/Dummy%20smart%20phone/dio21.dart';
import 'package:all_api/Dummy%20smart%20phone/http21.dart';
import 'package:flutter/material.dart';

class smart_button extends StatefulWidget {
  const smart_button({Key? key}) : super(key: key);

  @override
  State<smart_button> createState() => _smart_buttonState();
}

class _smart_buttonState extends State<smart_button> {
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
                      return http21();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio21();
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
