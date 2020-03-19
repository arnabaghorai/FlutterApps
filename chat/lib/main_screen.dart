import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Upload.dart';
// import 'Track.dart';
// import 'AppDrawer.dart';

class MainScreen extends StatefulWidget {
  final phoneno, email, name, state, reward, age, sex;
  MainScreen(this.phoneno, this.email, this.name, this.state, this.reward,
      this.age, this.sex);
  @override
  _MainScreenState createState() =>
      _MainScreenState(phoneno, email, name, state, reward, age, sex);
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final phoneno, email, name, state, reward, age, sex;
  _MainScreenState(this.phoneno, this.email, this.name, this.state, this.reward,
      this.age, this.sex);
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black45,
        title: new Text("Speak Up"),
        //centerTitle: true,
        elevation: 0.7,
        centerTitle: true,

        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(
              child: Icon(Icons.add_location),
            ),
            new Tab(
              child: Icon(FontAwesomeIcons.car),
            ),
          ],
        ),
      ),
      // drawer: AppDrawer(),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new MainPage(),
          new Track(phoneno, email, name, state, reward, age, sex),

          // new StatusScreen(),
          // new News(),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
          radius: 30.0,
          child: Icon(Icons.warning),
        ),
      ],
    ));
  }
}

class Track extends StatelessWidget {
  final phoneno, email, name, state, reward, age, sex;
  Track(this.phoneno, this.email, this.name, this.state, this.reward, this.age,
      this.sex);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
        RaisedButton(
          child: Text("Upload Image"),
          onPressed: () {
            // Navigator.of(context).push(new MaterialPageRoute(
            //     builder: (BuildContext context) => new UploadImage(
            //         phoneno, email, name, state, reward, age, sex)));
          },
        )
      ],
    ));
  }
}
