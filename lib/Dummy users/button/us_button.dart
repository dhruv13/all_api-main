import 'package:all_api/Dummy%20users/dio12.dart';
import 'package:all_api/Dummy%20users/http12.dart';
import 'package:flutter/material.dart';

class us_button extends StatefulWidget {
  const us_button({Key? key}) : super(key: key);

  @override
  State<us_button> createState() => _us_buttonState();
}

class _us_buttonState extends State<us_button> {
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
                      return http12();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio12();
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
