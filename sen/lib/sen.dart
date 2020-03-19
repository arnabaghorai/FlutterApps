import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:speech_recognition/speech_recognition.dart';

class SensorsExample extends StatefulWidget {
  final count = 0;
  final resulttext = "";
  final flag = 0;

  @override
  _SensorsExampleState createState() => _SensorsExampleState();
}

class _SensorsExampleState extends State<SensorsExample> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText;
  int flag;
  double threshold;
  int count;
  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

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
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));

    //UserAccelerometer events
    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));

    //UserAccelerometer events
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));
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
    final List<String> accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final List<String> gyroscope =
        _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final List<String> userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        ?.toList();

    //print(userAccelerometer[0]);
    double x = double.parse(userAccelerometer[0]);
    double y = double.parse(userAccelerometer[1]);
    double z = double.parse(userAccelerometer[2]);

    // print(x);
    print(resultText);

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
                  builder: (BuildContext context) => new Page()),
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

    if ((x >= 2 || x <= -2 || y <= -2 || z <= -2 || y >= 2 || z >= 2) &&
        count == 0) {
      print("Innnn");
      setState(() {
        count = 1;
        Future.delayed(Duration.zero, () {
          Navigator.of(context).push(
            new MaterialPageRoute(
                builder: (BuildContext context) => new Page()),
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
        appBar: AppBar(title: Text('Sensors Example')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Accelerometer: $accelerometer'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('UserAccelerometer: $userAccelerometer'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Gyroscope: $gyroscope'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.cyanAccent[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ));
  }
}

class Page extends StatelessWidget {
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
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new SensorsExample()),
                  );
                },
              )
            ],
          ),
        ));
  }
}
