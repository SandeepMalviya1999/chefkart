import 'package:flutter/material.dart';

class DishDetailsScreen extends StatefulWidget {
  const DishDetailsScreen({super.key});

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Text('Hello')
        ],
      ),

    );
  }
}
