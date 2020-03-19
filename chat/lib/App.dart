// import 'package:emailapp/InboxScreen.dart';
// import 'package:emailapp/screen/CalendarScreen.dart';
// import 'package:emailapp/screen/ContactsScreen.dart';
import 'package:chat/beforechat.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'chat_screen.dart';
import 'trigger.dart';
import 'call_screen.dart';
// import 'AppDrawer.dart';
import 'package:sensors/sensors.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'dart:async';

class App extends StatefulWidget {
  final phoneno, email, name, state, reward, age, sex;
  App(this.phoneno, this.email, this.name, this.state, this.reward, this.age,
      this.sex);
  final count = 0;
  final resulttext = "";
  final flag = 0;

  @override
  _AppState createState() =>
      _AppState(phoneno, email, name, state, reward, age, sex);
}

class _AppState extends State<App> {
  final phoneno, email, name, state, reward, age, sex;
  _AppState(this.phoneno, this.email, this.name, this.state, this.reward,
      this.age, this.sex);
  int _selectedIndex = 1;
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText;
  int flag;
  double threshold;
  int count;
  // List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  // List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  void _onItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();

    initSpeechRecognizer();

    setState(() {
      count = widget.count;
      resultText = widget.resulttext;
      flag = widget.flag;
    });

    initSensor();

    if (_isAvailable && !_isListening) print("Readyy");
    _speechRecognition
        .listen(locale: "en_US")
        .then((result) => print('$result'));
  }

  void initSensor() {
    //Accelerometer events

    //UserAccelerometer events
    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));

    //UserAccelerometer events
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  @override
  void dispose() {
    for (StreamSubscription<dynamic> sub in _streamSubscriptions) {
      sub.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        ?.toList();

    double x = double.parse(userAccelerometer[0]);
    double y = double.parse(userAccelerometer[1]);
    double z = double.parse(userAccelerometer[2]);

    if (resultText.toLowerCase().contains("help") && count == 0) {
      print("Heree");

      setState(() {
        count = 1;
        resultText = "";

        if (_isListening) {
          _speechRecognition.stop().then(
                (result) => setState(() {
                  _isListening = result;
                }),
              );

          setState(() {
            flag = 1;
          });
        }
        if (flag == 1) {
          Future.delayed(Duration.zero, () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new Trigger(
                      phoneno, email, name, state, reward, age, sex)),
            );
          });
        }
      });
    }

    if ((!resultText.toLowerCase().contains("help")) && count == 0) {
      setState(() {
        resultText = "";
        if (_isAvailable && !_isListening) print("Readyy");
        _speechRecognition
            .listen(locale: "en_US")
            .then((result) => print('$result'));
      });
    }

    // if (!resultText.toLowerCase().contains("help")) {
    //   print("Yessss");
    //   if (_isListening)
    //     _speechRecognition.cancel().then(
    //           (result) => setState(() {
    //             _isListening = result;
    //             resultText = "";
    //           }),
    //         );

    //   if (_isAvailable && !_isListening)
    //     _speechRecognition
    //         .listen(locale: "en_IN")
    //         .then((result) => print('$result'));
    // }

    if ((x >= 9 || x <= -9 || y <= -9 || z <= -9 || y >= 9 || z >= 9) &&
        count == 0) {
      print("Innnn");
      setState(() {
        if (_isListening) {
          _speechRecognition.stop().then(
                (result) => setState(() {
                  _isListening = result;
                }),
              );
        }

        count = 1;
        Future.delayed(Duration.zero, () {
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new Trigger(phoneno, email, name, state, reward, age, sex)),
          );
        });
        // setState(() {
        //   count = 0;
        // });
      });
      // Navigator.of(context).push(
      //   new MaterialPageRoute(builder: (BuildContext context) => new Page()),
      // );
    }

    return Scaffold(
      // drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            title: Text('Alert'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Contacts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Social'),
          ),
        ],
        onTap: _onItemTap,
        currentIndex: _selectedIndex,
      ),
      body: [
        CallsScreen(),
        MainScreen(phoneno, email, name, state, reward, age, sex),
        Page(),
        BeforeChat(phoneno, email, name, state, reward, age, sex),
      ].elementAt(_selectedIndex),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Page"),
      ),
    );
  }
}

// class NewPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("New"),
//         ),
//         body: Container(
//           child: Column(
//             children: <Widget>[
//               Center(
//                 child: Text("Hey"),
//               ),
//               RaisedButton(
//                 child: Text("Press"),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     new MaterialPageRoute(
//                         builder: (BuildContext context) => new App(phoneno, email, name, state,reward, age, sex)),
//                   );
//                 },
//               )
//             ],
//           ),
//         ));
//   }
// }
