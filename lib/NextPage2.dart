import 'package:flutter/material.dart';

class NextPage2 extends StatelessWidget {
  const NextPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("NextPage-2"),
        backgroundColor: Colors.cyan
      ),
      body: Center(
        child: Text("Mission Done")
      ),
    );
  }
}
