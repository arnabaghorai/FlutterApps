import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:async';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
// https://docs.flutter.io/flutter/dart-ui/AppLifecycleState-class.html

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  void helper() {
    while (true) {
      final List<String> accelerometer = _accelerometerValues
          ?.map((double v) => v.toStringAsFixed(1))
          ?.toList();
      final List<String> gyroscope =
          _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
      final List<String> userAccelerometer = _userAccelerometerValues
          ?.map((double v) => v.toStringAsFixed(1))
          ?.toList();

      print(userAccelerometer);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

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

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    for (StreamSubscription<dynamic> sub in _streamSubscriptions) {
      sub.cancel();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        print('paused state');
        helper();

        break;
      case AppLifecycleState.resumed:
        print('resumed state');
        break;
      case AppLifecycleState.inactive:
        print('inactive state');
        break;
      case AppLifecycleState.suspending:
        print('suspending state');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("HEy"),
            ),
            body: Text("Hey")));
  }
}
