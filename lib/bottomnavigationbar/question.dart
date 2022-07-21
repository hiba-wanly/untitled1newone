import 'package:flutter/material.dart';
class Question extends StatelessWidget {
  const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'sug',

        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,

            ),
            onPressed: (){
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'suggestion',
        ),
      ),
    );
  }
}