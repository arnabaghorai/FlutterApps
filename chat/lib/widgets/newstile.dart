import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final String data, date, img, link;
  NewsItem(this.data, this.date, this.img, this.link);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        new Divider(
          height: 30.0,
        ),
        InkWell(
            onTap: () => launch("$link"),
            child: ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage("$img"),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    data,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    date,
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  data,
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ))
      ],
    ));
  }
}
