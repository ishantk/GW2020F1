import 'dart:io';

import 'package:flutter/material.dart';

class DisplayCapturedImage extends StatelessWidget{

  String imagePath;

  DisplayCapturedImage({Key key, @required this.imagePath}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(imagePath),
      ),
      body: Image.file(File(imagePath)),
    );
  }

}