import 'package:flutter/material.dart';
//const String _name = "Anonymous";
//String name;

class ChatMessage extends StatelessWidget {
  final String text;
  final String name;

// constructor to get text from textfield
  ChatMessage({this.text, this.name});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 20.0,
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //new Text(, style: Theme.of(context).textTheme.subhead),
                new Text(this.name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )
              ],
            )
          ],
        ));
  }
}
