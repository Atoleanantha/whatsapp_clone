import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
             const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 23,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
            contact.select? const Positioned(
                right: 5,
                bottom:4,
                child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ))):Container(),
          ],
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.status),
    );
  }
}
