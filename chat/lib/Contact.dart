import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Contact extends StatefulWidget {
  final phoneno;
  Contact(this.phoneno);
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
