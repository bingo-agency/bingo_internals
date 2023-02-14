import 'package:bingo_internals/components/floatingButton.dart';
import 'package:bingo_internals/components/topBar.dart';
import 'package:bingo_internals/constants.dart';
import 'package:bingo_internals/screens/chats/components/body.dart';
import 'package:bingo_internals/screens/home/rightBody.dart';
import 'package:flutter/material.dart';

class TabletScaffold extends StatefulWidget {
  @override
  _TabletScaffoldState createState() => new _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      drawer: const ChatBody(),
      body: RightBody(),
      // floatingActionButton: FloatingButton(),
    );
  }
}
