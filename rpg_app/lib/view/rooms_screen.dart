import 'package:flutter/material.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        foregroundColor: colorFist,
        title: const Text(
          "Minhas Campanhas",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondColor,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.roomForm);
        },
        child: const Icon(
          Icons.add,
          color: defaultColor,
        ),
      ),
      //body: Text("a"),
    );
  }
}
