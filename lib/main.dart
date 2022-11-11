import 'package:flutter/material.dart';
import 'dart:async';
import 'phil_model.dart';
import 'digimon_list.dart';
import 'new_digimon_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Most amazing dogs around!',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Most amazing dogs around!',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dogs> initialDogs = []
    ..add(Dogs('1'))
    ..add(Dogs('2'))
    ..add(Dogs('3'))
    ..add(Dogs('4'))
    ..add(Dogs('5'))
    ..add(Dogs('6'));

  Future _showNewDigimonForm() async {
    Dogs newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDigimonFormPage();
    }));
    //print(newDigimon);
    if (newDog != null) {
      initialDogs.add(newDog);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xFF0B479E),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDigimonForm,
          ),
        ],
      ),
      body: new Container(
          color: Color(0xFFABCAED),
          child: new Center(
            child: new DogList(initialDogs),
          )),
    );
  }
}
