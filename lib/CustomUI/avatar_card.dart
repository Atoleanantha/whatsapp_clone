import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key,required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 8),
      child: Container(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(children: const[
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 23,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
               Positioned(
                  right: 5,
                  bottom: 4,
                  child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.teal,
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 18,
                      )))
            ]),
            Text("${name.substring(0,name.length>6?4:name.length)} ${name.length>6?"...":""}",style:const TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}
