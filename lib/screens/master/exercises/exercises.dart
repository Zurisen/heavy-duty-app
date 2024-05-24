import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () => {throw Exception('test exception')},
          child: Text('throw exception'),
        ),
      ),
    );
  }
}