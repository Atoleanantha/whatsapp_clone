import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/chat_model.dart';

class ButtonCard extends StatelessWidget{
  const ButtonCard({super.key,required this.title,required this.icon});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children:  [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF25D366),
            radius: 23,
            child: Icon(icon,color: Colors.white,size: 26,),
          ),
          title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),

        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 78.0,right: 20),
        //   child: Divider(height: 1,),
        // )
      ],
    );
  }
}