
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/individual_chat_screen.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
        required this.chatIndividual,
        required this.sourceChat
      });
  ChatModel chatIndividual;
  ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualChatScreen(chatIndividual:chatIndividual,sourceChat:sourceChat)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 25,
              child :chatIndividual.isGroup
                  ? const Icon(
                      CupertinoIcons.group_solid,
                      size: 37,
                      color: Colors.white,
                    )
                  : const Icon(
                      CupertinoIcons.person_solid,
                      size: 37,
                      color: Colors.white,
                    ),
            ),
            title: Text(
              chatIndividual.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  chatIndividual.currentMessage,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chatIndividual.time),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 80.0, right: 20.0),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
