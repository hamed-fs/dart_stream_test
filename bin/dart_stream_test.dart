import 'dart:async';

import 'package:rxdart/subjects.dart';

void main(List<String> arguments) {
  final int maxSize = null;

  var streamController = ReplaySubject(maxSize: maxSize);
// Accessing the stream and listening for data event
  streamController.stream.listen((data) {
    print('Stream Listener 01 -> $data');
  });

  streamController.sink.add('data 00.');
  streamController.sink.add('data 01.');
  streamController.sink.add('data 02.');
  streamController.sink.add('data 03.');

  Future.delayed(Duration(seconds: 2), () {
    streamController.stream.listen((data) {
      print('Stream Listener 02 -> $data');
    });
  });
}
