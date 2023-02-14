import 'package:bingo_internals/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

class RightBody extends StatefulWidget {
  @override
  _RightBodyState createState() => new _RightBodyState();
}

class _RightBodyState extends State<RightBody> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth > 900)
        ? Expanded(flex: 2, child: MessagesScreen())
        : MessagesScreen();
  }
}
