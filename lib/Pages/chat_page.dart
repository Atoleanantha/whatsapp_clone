import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/custom_card.dart';
import 'package:whatsapp_clone/Screens/select_contact.dart';

import '../model/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key,required this.chats,required this.sourceChat});
  final List<ChatModel>chats;
  final ChatModel sourceChat;

  @override
  State<StatefulWidget> createState() {
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectContactScreen()));
          },
          child: const Icon(
            Icons.message,
          ),
        ),
        body: ListView.builder(
            itemCount: widget.chats.length,
            itemBuilder: (context, index) => CustomCard(
                  chatIndividual: widget.chats[index],
              sourceChat:widget.sourceChat
                )));
  }
}
