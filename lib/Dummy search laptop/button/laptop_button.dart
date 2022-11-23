import 'package:all_api/Dummy%20search%20laptop/dio19.dart';
import 'package:all_api/Dummy%20search%20laptop/http19.dart';
import 'package:flutter/material.dart';

class laptop_button extends StatefulWidget {
  const laptop_button({Key? key}) : super(key: key);

  @override
  State<laptop_button> createState() => _laptop_buttonState();
}

class _laptop_buttonState extends State<laptop_button> {
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
                      return http19();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio19();
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
