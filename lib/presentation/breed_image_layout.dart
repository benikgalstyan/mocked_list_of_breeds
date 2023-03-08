import 'package:flutter/material.dart';

class BreedLayoutImg extends StatefulWidget {
  const BreedLayoutImg({Key? key}) : super(key: key);

  @override
  State<BreedLayoutImg> createState() => _BreedLayoutState();
}

class _BreedLayoutState extends State<BreedLayoutImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Image Screen'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: const Text ('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
