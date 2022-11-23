import 'package:all_api/photo/dio3.dart';
import 'package:all_api/photo/http3.dart';
import 'package:flutter/material.dart';

class pho_bitton extends StatefulWidget {
  const pho_bitton({Key? key}) : super(key: key);

  @override
  State<pho_bitton> createState() => _pho_bittonState();
}

class _pho_bittonState extends State<pho_bitton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Page"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return http3();
                    },
                  ));
                },
                child: const Text("http")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dio3();
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
