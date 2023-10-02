
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReplyFileCard extends StatelessWidget {
  const ReplyFileCard({super.key,required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.centerLeft,

      child: Container(
        height: MediaQuery.of(context).size.height/2.4,
        width: MediaQuery.of(context).size.width/1.6,
        padding:const EdgeInsets.symmetric(vertical: 0.5,horizontal: 0.5),
        margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[400]
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.file(File(path)),
        ),
      ),
    );
  }
}
