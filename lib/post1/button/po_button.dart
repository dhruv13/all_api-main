import 'package:all_api/post1/dio6.dart';
import 'package:all_api/post1/http6.dart';
import 'package:flutter/material.dart';


class po_button extends StatefulWidget {
  const po_button({Key? key}) : super(key: key);

  @override
  State<po_button> createState() => _po_buttonState();
}

class _po_buttonState extends State<po_button> {
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
                      return http6();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio6();
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
