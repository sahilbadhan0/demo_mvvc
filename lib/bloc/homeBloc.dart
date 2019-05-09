import 'dart:async';

import 'package:demo_mvvc/provider/counterProvider.dart';

class HomeBloc {
  StreamController counterController= new StreamController();

  Stream get getCount => counterController.stream;

  CounterProvider provider =new CounterProvider();

  incrementCounter(){
    provider.incrementCounter();
    counterController.sink.add(provider.count);
  }

  void dispose(){
    counterController.close();
  }



}

//final homeBloc=new HomeBloc();// any class importing this can use it / that's bullshit man