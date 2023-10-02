import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/CustomUI/own_file_card.dart';
import 'package:whatsapp_clone/CustomUI/replay_card.dart';
import 'package:whatsapp_clone/CustomUI/reply_file_card.dart';
import 'package:whatsapp_clone/Screens/camera_screen.dart';
import 'package:whatsapp_clone/Screens/camera_view_screen.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../CustomUI/own_message_card.dart';
import '../model/message_model.dart';

class IndividualChatScreen extends StatefulWidget {
  IndividualChatScreen({super.key, required this.chatIndividual,required this.sourceChat});
  ChatModel chatIndividual;
  ChatModel sourceChat;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndividualChatScreenState();
  }
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  late io.Socket socket;//object of socket
  ImagePicker imagePicker=ImagePicker();
  XFile? file;
  bool isEmoji = false;
  bool sendButton=true;
  ScrollController _scrollController=ScrollController();
  final TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<MessageModel>messages=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isEmoji = false;
        });
      }
    });
  }

  void connect(){

    socket=io.io("http://192.168.137.1:5500",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false,
    });
    socket.connect();
    socket.onConnect((data){
      debugPrint("connected");
      socket.on("message", (msg) {
        setMessage(msg["message"],"destination");
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 300), curve: Curves.bounceIn);
      });
    });
    socket.emit("sign",widget.sourceChat.id);
    debugPrint((socket.connected).toString());
  }
  
  void sendMessage(String msg,int sourceId,int destinationId){
    setMessage(msg,"source");
    socket.emit("message",{"message":msg,"sourceId":sourceId,"destinationId":destinationId});
  }

  void setMessage(String message,String type){
    MessageModel msg=MessageModel(type: type, message: message,time: DateTime.now().toString());
    debugPrint(DateTime.now().toString().substring(11,16));
    setState(() {
      messages.add(msg);
    });
  }
  
  Widget emojiSelect() {
    return const SizedBox(
      height: 250,
      child: Center(
        child: Text("Emoji not available"),
      ),
    );
    // return SizedBox(
    //     height: 250,
    //     child: EmojiPicker(
    //       onEmojiSelected: (category,Emoji emoji){
    //         setState(() {
    //           _controller.text=_controller.text+emoji.emoji;
    //         });
    //       },
    //       textEditingController: _controller,
    //       // onBackspacePressed: _onBackspacePressed,
    //       config: Config(
    //         columns: 7,
    //         // issue: https://github.com/flutter/flutter/issues/28894
    //         emojiSizeMax: 32 *
    //             (foundation.defaultTargetPlatform == TargetPlatform.iOS
    //                 ? 1.30
    //                 : 1.0),
    //         verticalSpacing: 0,
    //         horizontalSpacing: 0,
    //         gridPadding: EdgeInsets.zero,
    //         initCategory: Category.RECENT,
    //         bgColor: const Color(0xFFF2F2F2),
    //         indicatorColor: Colors.blue,
    //         iconColor: Colors.grey,
    //         iconColorSelected: Colors.blue,
    //         backspaceColor: Colors.blue,
    //         skinToneDialogBgColor: Colors.white,
    //         skinToneIndicatorColor: Colors.grey,
    //         enableSkinTones: true,
    //         recentTabBehavior: RecentTabBehavior.RECENT,
    //         recentsLimit: 28,
    //         replaceEmojiOnLimitExceed: false,
    //         noRecents: const Text(
    //           'No Recents',
    //           style: TextStyle(fontSize: 20, color: Colors.black26),
    //           textAlign: TextAlign.center,
    //         ),
    //         loadingIndicator: const SizedBox.shrink(),
    //         tabIndicatorAnimDuration: kTabScrollDuration,
    //         categoryIcons: const CategoryIcons(),
    //         buttonMode: ButtonMode.MATERIAL,
    //         checkPlatformCompatibility: true,
    //       ),
    //     ));
  }

  //for attachment
  Widget createIconButton(String title,IconData icon,Color color,){
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(icon,size: 29,color: Colors.white,),
        ),
        const SizedBox(height: 5,),
        Text(title,style:const TextStyle(fontSize: 12),)
      ],
    );
  }
  Widget customBottomSheetAttachment() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin:const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createIconButton("Documents",Icons.insert_drive_file,Colors.blue,),
                InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
                    },
                child: createIconButton("Camera",Icons.camera_alt,Colors.pink)),
                InkWell(
                  onTap:()async{
                      file=await imagePicker.pickImage(source:ImageSource.gallery);
                      if(file!=null){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>CameraViewScreen(path: file!.path)));
                      }
                  },
                    child: createIconButton("Gallery",Icons.image,Colors.purple)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createIconButton("Audio",Icons.headphones,Colors.orange),
                createIconButton("Location",Icons.location_on_sharp,Colors.teal),
                createIconButton("Contact",Icons.person,Colors.lightBlue),
              ],
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        titleSpacing: 3,
        title: Container(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chatIndividual.name),
                  Text(
                    "last seen today at ${widget.chatIndividual.time}",
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              )),
        ),
        leadingWidth: 90,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                )),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 20,
                child: widget.chatIndividual.isGroup
                    ? const Icon(
                        CupertinoIcons.group_solid,
                        size: 30,
                        color: Colors.white,
                      )
                    : const Icon(
                        CupertinoIcons.person_solid,
                        size: 30,
                        color: Colors.white,
                      ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton(
              onSelected: (value) {},
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: "View contact",
                    child: Text("View contact"),
                  ),
                  PopupMenuItem(
                    value: "Media, links, and docs",
                    child: Text("Media, links, and docs"),
                  ),
                  PopupMenuItem(
                    value: "Search",
                    child: Text("Search"),
                  ),
                  PopupMenuItem(
                    value: "Mute notifications",
                    child: Text("Mute notifications"),
                  ),
                  PopupMenuItem(
                    value: "Disappearing messages",
                    child: Text("Disappearing messages"),
                  ),
                  PopupMenuItem(
                    value: "Wallpapers",
                    child: Text("Wallpapers"),
                  ),
                  PopupMenuItem(
                    value: "More",
                    child: Text("More"),
                  ),
                ];
              })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
              image:DecorationImage( image: AssetImage('assets/background/chat_bg.png'),fit: BoxFit.cover)),
        child: WillPopScope(
          onWillPop: () {
            if (isEmoji) {
              setState(() {
                isEmoji = false;
              });
            } else {
              setState(() {
                Navigator.pop(context);
              });
            }
            return Future.value();
          },
          child: Stack(
            children: [
              Container(
                padding:const EdgeInsets.only(bottom: 60),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length+1,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                    if(index==messages.length){
                      return const SizedBox(height: 60,);
                    }
                      if(messages[index].type=="source"){
                        return OwnMessageCard(message: messages[index].message,time: messages[index].time.toString().substring(11,16),);
                      }
                      return ReplayCard(message: messages[index].message,time: messages[index].time.toString().substring(11,16),);

                })
              ),

              Align(
                alignment: Alignment.bottomCenter,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 57,
                            child: Card(
                                margin: const EdgeInsets.only(
                                    left: 2, bottom: 8, right: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: _controller,
                                  keyboardType: TextInputType.multiline,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 5,
                                  minLines: 1,
                                  onChanged: (value){
                                      if(value.isNotEmpty){setState((){sendButton=true;});}
                                      else{setState((){sendButton=false;});
                                      }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              backgroundColor: Colors.transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    customBottomSheetAttachment());
                                          },
                                          icon: Transform.rotate(angle: 180,child: const Icon(Icons.attach_file)),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CameraScreen()));
                                          },
                                          icon: const Icon(Icons.camera_alt),
                                        )
                                      ],
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.emoji_emotions_outlined,
                                        color: Colors.black45,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          isEmoji = !isEmoji;
                                        });
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.all(5),
                                  ),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 3, bottom: 8, right: 0),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF128C7E),
                            child: IconButton(
                              onPressed: () {
                                if(_controller.toString()!="" && sendButton) {
                                  sendMessage(_controller.text, widget.sourceChat.id, widget.chatIndividual.id);
                                  _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration:const Duration(microseconds: 300), curve: Curves.easeInOut);
                                  _controller.clear();
                                  setState(() {
                                    sendButton=false;
                                  });
                                }
                              },
                              icon: Icon(
                                !sendButton?Icons.mic:Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isEmoji) emojiSelect()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
