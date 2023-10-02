
import 'package:flutter/material.dart';

class ReplayCard extends StatelessWidget {
  const ReplayCard({super.key,required this.message,required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
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

            child: Stack(
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 20,right: 10,top: 5,bottom: 20),
                  child: Text(message,style:const TextStyle(fontSize: 16),),
                ),
                Positioned(
                  bottom: 3,
                  right: 10,
                  child: Text(time,style: TextStyle(fontSize: 13,color: Colors.grey[600]),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
