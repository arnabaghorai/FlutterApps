import 'package:flutter/material.dart';
import 'App.dart';

class Trigger extends StatelessWidget {
  final phoneno, email, name, state, reward, age, sex;
  Trigger(this.phoneno, this.email, this.name, this.state, this.reward,
      this.age, this.sex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Hey"),
              ),
              RaisedButton(
                child: Text("Press"),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new App(
                          phoneno, email, name, state, reward, age, sex)));
                },
              )
            ],
          ),
        ));
  }
}
