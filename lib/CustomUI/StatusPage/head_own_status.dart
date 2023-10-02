import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadOwnStatus extends StatelessWidget {
  const HeadOwnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Stack(
        children: [
          const CircleAvatar(radius: 25,backgroundImage:  AssetImage("assets/profiles/img.png")),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.greenAccent.shade700,
                child:const Icon(Icons.add,size: 20,color: Colors.white,),
              ))

        ],
      ),

      title: const Text("My Status",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      subtitle: Text("Tap to add status update",style: TextStyle(fontSize: 13,color: Colors.grey.shade900),),
    );
  }
}
