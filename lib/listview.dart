import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mocked_list_of_breeds/models/breed.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Breed> _breeds = [];

  Future<void> getData() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    var responseMapBreeds = json.decode(response.body);
    var breedsMap = responseMapBreeds['message'];

    var breeds = <Breed>[];
    breedsMap.forEach((key, value) {
      if (value.isNotEmpty) {
        var subBreeds = <String>[];
        value.forEach((subBreed) {
          subBreeds.add(subBreed.toString());
        });
        breeds.add(Breed(key.toString(), subBreed: subBreeds));
      } else {
        breeds.add(Breed(key.toString()));
      }
    });
    setState(() {
      _breeds = breeds;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  final nameOfScreen = "Dogs List Screen";

  final double heightOption = 60;

  final double thicknessOption = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(nameOfScreen),
              backgroundColor: Colors.black,
            ),
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: _breeds.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _breeds[index].breed,
                      style: const TextStyle(fontSize: 30),
                    ),
                    if (_breeds[index].subBreed != null)
                      Text(
                        _breeds[index].subBreed?.toString() ?? '',
                        style: const TextStyle(fontSize: 18),
                      ),
                  ],
                ),
              ),
              separatorBuilder: (_, __) => Divider(
                color: Colors.grey,
                height: heightOption,
                thickness: thicknessOption,
              ),
            )));
  }
}
