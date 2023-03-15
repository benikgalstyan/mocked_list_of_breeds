import 'package:flutter/material.dart';

class BreedError extends StatelessWidget {
  const BreedError({super.key, required this.textError});

  final String textError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textError,
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
              const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}
