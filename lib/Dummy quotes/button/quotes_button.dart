import 'package:all_api/Dummy%20quotes/dio16.dart';
import 'package:all_api/Dummy%20quotes/http16.dart';
import 'package:flutter/material.dart';

class quotes_button extends StatefulWidget {
  const quotes_button({Key? key}) : super(key: key);

  @override
  State<quotes_button> createState() => _quotes_buttonState();
}

class _quotes_buttonState extends State<quotes_button> {
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
                      return http16();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio16();
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
