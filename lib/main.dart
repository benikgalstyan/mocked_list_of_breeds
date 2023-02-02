  import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final List<String> events = [
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
           title: const Text(
             "Dogs List Screen",
           ),
           backgroundColor: Colors.black,
         ),
         body: ListView.separated(
           padding: const EdgeInsets.only(left: 20),
           physics: const BouncingScrollPhysics(),
           itemCount: events.length,
           itemBuilder: (_, index) => Text(
             events[index],

             style: const TextStyle(fontSize: 30),
           ),
           separatorBuilder: (_, __) => const Divider(color: Colors.grey,height: 60,thickness: 1,),
         ),
       ),
     );
   }
}