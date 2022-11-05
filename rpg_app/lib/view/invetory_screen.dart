import 'package:flutter/material.dart';
import 'package:rpg_app/style/colors.dart';

class Invetory extends StatefulWidget {
  const Invetory({Key? key}) : super(key: key);

  @override
  State<Invetory> createState() => _InvetoryState();
}

class _InvetoryState extends State<Invetory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height*0.9,
              width: size.width*0.9,
              color: otherColor,
            ),
          ),
         const Text('inventario',
              style: TextStyle(
                color: defaultColor,
                fontWeight: FontWeight.bold,
                fontSize: 20)),

        ],
      ),
    );
  }
}