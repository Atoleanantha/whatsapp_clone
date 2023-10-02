class ChatModel {
  ChatModel(
      {required this.name,
      required this.currentMessage,
      required this.icon,
      required this.isGroup,
      required this.time,
        this.status="",
        this.select=false,
        this.id=0,
      });
  int id;
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select;
}
