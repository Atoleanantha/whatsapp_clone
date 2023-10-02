import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/button_card.dart';
import 'package:whatsapp_clone/Screens/home_screen.dart';

import '../model/chat_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chats = [
    ChatModel(
        id: 10,
        name: "Anantha",
        currentMessage: "Hello",
        icon: "person",
        isGroup: false,
        time: "05:30"),

    ChatModel(
        id: 8,
        name: "Narendra",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    // ChatModel(
    //     name: "SE",
    //     currentMessage: "hi",
    //     icon: "group",
    //     isGroup: true,
    //     time: "06:30"),
    ChatModel(
        id: 1,
        name: "9975655439",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        id: 2,
        name: "7875298622",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        id: 3,
        name: "7083430276",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        id: 4,
        name: "7709287881",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        id: 6,
        name: "9011421416",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
    ChatModel(
        id: 7,
        name: "7875298622",
        currentMessage: "hi",
        icon: "person",
        isGroup: false,
        time: "05:30"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
          itemBuilder: (context, index) =>
              InkWell(
                onTap: (){
                  sourceChat=chats.removeAt(index);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(chats: chats,sourceChat: sourceChat,)));
                },
                  child: ButtonCard(title: chats[index].name, icon: Icons.person))),
    );
  }
}
