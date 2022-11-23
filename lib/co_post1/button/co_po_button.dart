import 'package:all_api/co_post1/dio9.dart';
import 'package:all_api/co_post1/http9.dart';
import 'package:flutter/material.dart';

class co_po_button extends StatefulWidget {
  const co_po_button({Key? key}) : super(key: key);

  @override
  State<co_po_button> createState() => _co_po_buttonState();
}

class _co_po_buttonState extends State<co_po_button> {
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
                      return http9();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio9();
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
