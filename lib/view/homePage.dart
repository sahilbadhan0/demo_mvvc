import 'package:demo_mvvc/bloc/homeBloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeBloc homeBloc= new HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier counter= ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: homeBloc.getCount,
              initialData: 0,
              builder: (context,snapshot){
                return     Text('${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            homeBloc.incrementCounter();
        },

        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
