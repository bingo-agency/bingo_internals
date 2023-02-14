import 'package:bingo_internals/components/floatingButton.dart';
import 'package:bingo_internals/components/topBar.dart';
import 'package:bingo_internals/constants.dart';
import 'package:bingo_internals/screens/chats/components/body.dart';
import 'package:bingo_internals/screens/home/rightBody.dart';
import 'package:flutter/material.dart';

class DesktopScaffold extends StatefulWidget {
  @override
  _DesktopScaffoldState createState() => new _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Row(
        children: [
          const ChatBody(),
          RightBody(),
        ],
      ),
      // floatingActionButton: FloatingButton(),
    );
  }
}
