import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/camera_page.dart';
import 'package:whatsapp_clone/Pages/status_page.dart';

import '../Pages/chat_page.dart';
import '../model/chat_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.chats,required this.sourceChat});
  final List<ChatModel>chats;
  final ChatModel sourceChat;

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
              onSelected: (value) {},
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: "New group",
                    child: Text("New group"),
                  ),
                  PopupMenuItem(
                    value: "New broadcast",
                    child: Text("New broadcast"),
                  ),
                  PopupMenuItem(
                    value: "Linked devices",
                    child: Text("Linked devices"),
                  ),
                  PopupMenuItem(
                    value: "Starred messages",
                    child: Text("Starred messages"),
                  ),
                  PopupMenuItem(
                    value: "Settings",
                    child: Text("Settings"),
                  ),
                ];
              })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: const [
            Tab(
              icon: SizedBox(child: Icon(Icons.camera_alt)),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CameraPage(),
          ChatPage(chats: widget.chats,sourceChat:widget.sourceChat),
          const StatusPage(),
          Text("Calls"),
        ],
      ),
    );
  }
}
