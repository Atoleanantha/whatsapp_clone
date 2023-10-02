import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/button_card.dart';
import 'package:whatsapp_clone/CustomUI/contact_card.dart';
import 'package:whatsapp_clone/Screens/create_group.dart';

import '../model/chat_model.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelectContactScreenState();
  }
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  List<ChatModel> contact = [
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Select Contact",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "200 contacts",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 26,
                )),
            PopupMenuButton(
                onSelected: (value) {},
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      value: "Invite a friend",
                      child: Text("Invite a friend"),
                    ),
                    PopupMenuItem(
                      value: "Contacts",
                      child: Text("Contacts"),
                    ),
                    PopupMenuItem(
                      value: "Refresh",
                      child: Text("Refresh"),
                    ),
                    PopupMenuItem(
                      value: "Help",
                      child: Text("Help"),
                    ),
                  ];
                })
          ],
        ),
        body: ListView.builder(
            itemCount: contact.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroupScreen()));
                    },
                    child: const ButtonCard(
                      title: "New group",
                      icon: Icons.groups,
                    ));
              } else if (index == 1) {
                return const ButtonCard(
                  title: "New contact",
                  icon: Icons.person_add,
                );
              }
              return ContactCard(contact: contact[index - 2]);
            }));
  }
}
