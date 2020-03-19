import 'package:flutter/material.dart';
import 'package:chat/chatscreen.dart';

class BeforeChat extends StatefulWidget {
  final phoneno, email, name, state, rewards, age, sex;
  BeforeChat(this.phoneno, this.email, this.name, this.state, this.rewards,
      this.age, this.sex);
  @override
  State createState() => BeforeChatState(phoneno, email, name, state, rewards, age, sex);
}

class BeforeChatState extends State<BeforeChat> {
  final phoneno, email, name, state, rewards, age, sex;
  BeforeChatState(this.phoneno, this.email, this.name, this.state, this.rewards,
      this.age, this.sex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Products(phoneno, email, name, state, rewards, age, sex),
    ));
  }
}

class Products extends StatefulWidget {
  final phoneno, email, name, state, rewards, age, sex;
  Products(this.phoneno, this.email, this.name, this.state, this.rewards,
      this.age, this.sex);
  @override
  _ProductsState createState() => _ProductsState(phoneno, email, name, state, rewards, age, sex);
}

class _ProductsState extends State<Products> {
  final phoneno, email, name, state, rewards, age, sex;
  _ProductsState(this.phoneno, this.email, this.name, this.state, this.rewards,
      this.age, this.sex);
  final list_item = [
    {"name": "Eve Teasing", "pic": "assets/img/1.jpg"},
    {"name": "Safe Routes", "pic": "assets/img/2.jpg"},
    {"name": "Self Awareness", "pic": "assets/img/3.jpg"},
    {"name": "Social Abuse", "pic": "assets/img/4.jpg"},
    {"name": "Stay Safe", "pic": "assets/img/5.jpg"},
    {"name": "Self Defense", "pic": "assets/img/6.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list_item.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Product(list_item[index]['name'], list_item[index]['pic'],phoneno, email, name, state, rewards, age, sex);
      },
    );
  }
}

class Product extends StatelessWidget {
  final product_name;
  final product_pic;
  final phoneno, email, name, state, rewards, age, sex;
  Product(this.product_name, this.product_pic,this.phoneno, this.email, this.name, this.state, this.rewards,
      this.age, this.sex);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: product_name,
            child: Material(
                child: InkWell(
              onTap: () {
                print("$product_name presses");

                Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => ChatScreen(product_name,phoneno, email, name, state, rewards, age, sex)),
                );
              },
              child: GridTile(
                // child: Container(
                //   height: 130,
                //   width: 130,
                //   decoration: BoxDecoration(
                //       // backgroundBlendMode: true,
                //       image: DecorationImage(
                //           image: AssetImage('assets/$product_pic'),
                //           fit: BoxFit.fill),
                //       borderRadius: BorderRadius.circular(100),
                //       border: Border.all(
                //           color: Colors.blueAccent.withOpacity(.5),
                //           width: 1)),
                // ),
                child: Image.asset(
                  product_pic,
                  fit: BoxFit.cover,
                ),
                footer: Container(
                  height: 50,
                  color: Colors.black38,
                  child: ListTile(
                      title: Text(
                    product_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18.0),
                  )),
                ),
              ),
            ))));
  }
}
