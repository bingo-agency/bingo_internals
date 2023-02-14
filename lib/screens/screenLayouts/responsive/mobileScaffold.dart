import 'package:bingo_internals/components/floatingButton.dart';
import 'package:bingo_internals/components/topBar.dart';
import 'package:bingo_internals/screens/chats/components/body.dart';
import 'package:bingo_internals/screens/home/rightBody.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Chats"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const ChatBody(),
      body: RightBody(),
      // floatingActionButton: FloatingButton(),
    );
  }
}
