import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/StatusPage/others_status_card.dart';
import 'package:whatsapp_clone/Screens/camera_screen.dart';
import 'package:whatsapp_clone/Screens/camera_view_screen.dart';

import '../CustomUI/StatusPage/head_own_status.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  Widget label(String labelName){
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 7),
        child: Text(labelName,style:const TextStyle(fontSize: 13),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: 48,
              child: FloatingActionButton(
                backgroundColor: Colors.grey.shade200,
                elevation: 5,
                onPressed: () {},
                child: const Icon(Icons.edit,color: Colors.black,),
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 48,
              child: FloatingActionButton(
                backgroundColor: Colors.greenAccent.shade700,
                onPressed: () {},
                child: const Icon(Icons.camera_alt),
              )),
        ],
      ),
      body:SingleChildScrollView(
        child: Column(

            children: [
               // SizedBox(height: 10,),
              HeadOwnStatus(),
              label("Recent updates"),
              const OthersStatusCard(name: "Atole",img: "assets/profiles/img_1.png",time: "9:10",isSeen: false,statusNum: 2,),
              const OthersStatusCard(name: "Narendra",img: "assets/profiles/img.png",time: "10:10",isSeen: false,statusNum: 4,),
              const OthersStatusCard(name: "9975655439",img: "assets/profiles/img_2.png",time: "2:10",isSeen: false,statusNum: 6,),
              const SizedBox(height: 10,),
              label("Viewed"),
              const OthersStatusCard(name: "Unknown",img: "assets/profiles/img_3.png",time: "1:10",isSeen: true,statusNum: 2,),
              const OthersStatusCard(name: "7083430276",img: "assets/profiles/img_2.png",time: "1:10",isSeen: true,statusNum: 4,),
            ],
        ),
      ),
    );
  }
}
