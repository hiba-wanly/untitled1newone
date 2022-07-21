import 'dart:io';
import 'package:flutter/material.dart';

class DisplayPicture extends StatelessWidget {
  final File DisplayPhoto ;
  DisplayPicture({Key? key, required this.DisplayPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: ClipOval(child: Container(width: 200, height: 200,child: Image.file(DisplayPhoto),),));
  }
}
