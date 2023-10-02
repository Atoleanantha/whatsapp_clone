import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/avatar_card.dart';
import 'package:whatsapp_clone/CustomUI/contact_card.dart';

import '../model/chat_model.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<StatefulWidget> createState() {

    return _CreateGroupScreenState();
  }
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  List<ChatModel>contact=[
    ChatModel(

        name: "Anantha",
        status: "Busy",
        currentMessage: "Hello",
        icon: "person",
        isGroup: false,
        time: "05:30"),

    ChatModel(
        name: "Narendra",
        status: "Busy",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        name: "SE",
        status: "Busy",
        currentMessage: "hi",
        icon: "group",
        isGroup: true,
        time: "06:30"),
    ChatModel(
        name: "9975655439",
        status: "Busy",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        name: "7875298622",
        status: "Busy",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        name: "7083430276",
        status: "Busy",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        name: "7709287881",
        status: "Busy",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        name: "9011421416",
        status: "Busy",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        name: "7875298622",
        status: "Busy",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
  ];
  List<ChatModel>group=[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const  [
              Text(
                "New group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "200 contacts",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 26,)),

          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount:contact.length+1,
                itemBuilder: (context,index){
                  if(index==0 ){
                    return Container(height:group.length>0? 75:10,);
                  }
                  return InkWell(
                      onTap: (){
                        if(contact[index-1].select==false){
                          setState(() {
                            contact[index-1].select=true;
                            group.add(contact[index-1]);
                          });
                        }else{
                          setState(() {
                            contact[index-1].select=false;
                            group.remove(contact[index-1]);
                          });
                        }
                      },
                      child:ContactCard(contact:contact[index-1]));

                }),
            if(group.isNotEmpty)
              Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: contact.length,
                      itemBuilder: (context,index){
                      if(contact[index].select==true){
                        return InkWell(
                            onTap: (){
                              setState(() {
                                contact[index].select=false;
                                group.remove(contact[index]);
                              });
                            },
                            child: AvatarCard(name: contact[index].name,));
                      }else{
                        return Container();
                      }
                      }),
                ),
                const Divider(thickness: 1,),
              ],
            ),
          ],
        )
    );
  }
}
