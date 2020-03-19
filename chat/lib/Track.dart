import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Track extends StatefulWidget {
  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        TextField(
          onChanged: (text) {
            value = text;
          },
        ),
        InkWell(
          onTap: () => launch(
              "https://www.google.com/maps/dir/?api=1&destination=7+bunglows+police+chowki"),
          child: ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              // backgroundImage: new NetworkImage("$img"),
            ),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "Track Your Ride",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                // new Text(
                //   date,
                //   style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                // ),
              ],
            ),
            // subtitle: new Container(
            //   padding: const EdgeInsets.only(top: 5.0),
            //   child: new Text(
            //     data,
            //     style: new TextStyle(color: Colors.grey, fontSize: 15.0),
            //   ),
            // ),
          ),
        ),
      ],
    ));
  }
}
