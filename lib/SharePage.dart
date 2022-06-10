import 'package:flutter/material.dart';
class  SharePage extends StatelessWidget {
  const  SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}
