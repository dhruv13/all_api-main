import 'package:all_api/po_comment/dio8.dart';
import 'package:all_api/po_comment/http8.dart';
import 'package:flutter/material.dart';

class po_co_button extends StatefulWidget {
  const po_co_button({Key? key}) : super(key: key);

  @override
  State<po_co_button> createState() => _po_co_buttonState();
}

class _po_co_buttonState extends State<po_co_button> {
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
                      return http8();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio8();
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
