import 'dart:async';

class StreamSocket{
  //we add broadcast stream to make it possible to listen to it by many listners
  final _socketResponse = StreamController<dynamic>.broadcast();
  void Function(dynamic) get addResponse => _socketResponse.sink.add;

  Stream<dynamic> get getResponse => _socketResponse.stream;

  void dispose(){
    _socketResponse.close();
  }
}