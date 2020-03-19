import 'package:flutter/material.dart';
import 'package:speak_up/pages/news.dart';
import 'package:speak_up/pages/profile.dart';
import 'package:speak_up/pages/chat_screen.dart';
import 'package:speak_up/pages/main_screen.dart';
//import 'package:flutterwhatsapp/pages/weather.dart';
//import 'package:flutterwhatsapp/geo.dart';

class HomePage extends StatefulWidget {
  // var cameras;
  // WhatsAppHome(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Speak Up"),
        //centerTitle: true,
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(text: "NEWS"),
            new Tab(text: "HOME"),
            new Tab(
              text: "SOCIAL",
            ),
          ],
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Arnab Ghorai"),
              accountEmail: Text("arnabaghorai@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            new ListTile(
              title: Text("Your Account"),
              trailing: new Icon(Icons.person),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Profile(),
                  ),
                ),
              },
            ),
            new Divider(),
            new ListTile(
              title: Text("Weather"),
              trailing: new Icon(Icons.cloud),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Page(),
                  ),
                ),
              },
            ),
            new Divider(),
            new ListTile(
              title: Text("Locate"),
              trailing: new Icon(
                Icons.pin_drop,
                // size: 30.0,
              ),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Page(),
                  ),
                ),
              },
            ),
            new Divider(),
            new ListTile(
              title: Text("Logout"),
              trailing: new Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            new ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => {Navigator.of(context).pop()},
            )
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new News(),
          new MainScreen(),
          // new StatusScreen(),
          new Chat(),
        ],
      ),
      // floatingActionButton: new FloatingActionButton(
      //   backgroundColor: Theme.of(context).accentColor,
      //   child: new Icon(
      //     Icons.message,
      //     color: Colors.white,
      //   ),
      //   onPressed: () => print("open chats"),
      // ),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hey"),
        ),
        body: Center(
          child: Text("Page"),
        ));
  }
}
