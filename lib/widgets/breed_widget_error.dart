import 'package:flutter/material.dart';

class BreedError extends StatelessWidget {
  const BreedError({super.key, required this.textError});

  final String textError;
  final double sizeOfErrorIcon = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Colors.red,
                size: sizeOfErrorIcon,
              ),
              const SizedBox(height: 15),
              Text(
                textError,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
