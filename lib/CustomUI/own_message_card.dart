import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key,required this.message,required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width-45,
          minWidth: 100
      ),
      child: Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          color: const Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 40,top: 5,bottom: 20),
                child: Text(message.toString(),style:const TextStyle(fontSize: 16),),
              ),
              Positioned(
                bottom: 3,
                right: 10,
                child: Row(
                  children: [
                    Text(time,style: TextStyle(fontSize: 13,color: Colors.grey[600]),),
                    const SizedBox(width: 5,),
                    const Icon(Icons.done_all,size: 20,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
