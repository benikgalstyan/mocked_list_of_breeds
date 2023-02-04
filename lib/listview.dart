import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> breeds = [
    "affenpincher",
    "african",
    "airedale ",
    "akita",
    "appenzeller ",
    "australian shepherd",
    "basenji",
    "beagle  ",
    "bluetick ",
    "borzoi ",
    "bouvier",
    "boxer",
    "brabancon",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dogs List Screen"),
          backgroundColor: Colors.black,
        ),
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: breeds.length,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(breeds[index], style: const TextStyle(fontSize: 30),),
          ),
          separatorBuilder: (_, __) =>  const Divider(
            color: Colors.grey,
            height: 60,
            thickness: 1,
          ),
        ),
      ),
    );
  }
}
