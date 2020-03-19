import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     CircleAvatar(
        //       backgroundColor: Colors.deepOrangeAccent,
        //       radius: 30.0,
        //     ),
        //     SizedBox(
        //       width: 10.0,
        //       height: 10.0,
        //     ),
        //     CircleAvatar(
        //       backgroundColor: Colors.deepOrangeAccent,
        //       radius: 30.0,
        //     ),
        //   ],
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     CircleAvatar(
        //       backgroundColor: Colors.deepOrangeAccent,
        //       radius: 30.0,
        //     ),
        //     SizedBox(
        //       width: 10.0,
        //       height: 10.0,
        //     ),
        //     CircleAvatar(
        //       backgroundColor: Colors.deepOrangeAccent,
        //       radius: 30.0,
        //     ),
        //     SizedBox(
        //       width: 10.0,
        //       height: 10.0,
        //     ),
        //     CircleAvatar(
        //       backgroundColor: Colors.deepOrangeAccent,
        //       radius: 30.0,
        //     ),
        //   ],
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     CircleAvatar(
        //       backgroundColor: Colors.deepOrangeAccent,
        //       radius: 30.0,
        //     ),
        //     SizedBox(
        //       width: 10.0,
        //       height: 10.0,
        //     ),
        //     CircleAvatar(
        //       backgroundColor: Colors.deepOrangeAccent,
        //       radius: 30.0,
        //     ),
        //   ],
        // ),

        // CircleAvatar(
        //   backgroundColor: Colors.deepOrangeAccent,
        //   radius: 70.0,
        // ),
        // new Divider(
        //   height: 30.0,
        // ),
        InkWell(
            onTap: () => launch(
                "https://www.google.com/maps/search/?api=1&query=police+station+near+me"),
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
                    "Nearby Police Station",
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
            )),
        new Divider(
          height: 30.0,
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
        new Divider(
          height: 30.0,
        ),

        InkWell(
            onTap: () => launch(
                "https://www.google.com/maps/search/?api=1&query=public+places+near+me"),
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
                    "Nearby Public Places",
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
            )),
        CircleAvatar(
          backgroundColor: Colors.redAccent,
          radius: 70.0,
        ),
      ],
    ));
  }
}
