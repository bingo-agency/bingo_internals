import 'package:bingo_internals/AppState/appState.dart';
import 'package:bingo_internals/constants.dart';
import 'package:bingo_internals/models/ChatMessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  final CollectionReference chatsRef =
      FirebaseFirestore.instance.collection("chatMessage");

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();

    return Consumer<AppState>(
      builder: (context, value, child) {
        if (value.chatId == '0') {
          return Container(
            child: Center(
              child: Text('Welcome ' +
                  value.name +
                  ' to internals. Stay updated with your team.'),
            ),
          );
        } else {
          final CollectionReference chatsRef = FirebaseFirestore.instance
              .collection("chatMessage")
              .doc()
              .collection(value.chatId);
          return Column(
            children: [
              buildAppBar(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: FutureBuilder<QuerySnapshot>(
                    future: chatsRef.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong!');
                      }
                      if (snapshot.hasData) {
                        QuerySnapshot querySnapshot = snapshot.data!;
                        List<QueryDocumentSnapshot> documents =
                            querySnapshot.docs;
                        List<ChatMessage> chats = documents
                            .map(
                              (e) => ChatMessage(
                                  chatId: e["chatId"],
                                  text: e["text"],
                                  messageType: e['messageType'],
                                  messageStatus: e['messageStatus'],
                                  isSender: e['isSender']),
                            )
                            .toList();
                        return buildChats(chats);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                  // ListView.builder(
                  //   itemCount: ChatMessages.length,
                  //   itemBuilder: (context, index) =>
                  //       Message(message: ChatMessages[index]),
                  // ),
                ),
              ),
              const ChatInputField(),
            ],
          );
        }
      },
    );
  }

  Widget buildChats(chats) => ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => Message(message: chats[index]),
      );

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kristin Watson",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
