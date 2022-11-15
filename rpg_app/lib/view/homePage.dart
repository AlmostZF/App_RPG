import 'package:flutter/material.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.width * .7),
        child: Column(
          children: [
            Center(
              child: Container(
                height: size.width * .3,
                width: size.width * .3,
                decoration: const BoxDecoration(color: secondColor),
                child: const Center(
                  child: Text(
                    "LOGO",
                    style: TextStyle(color: otherColor, fontSize: 40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * .4),
              child: SizedBox(
                width: size.width * 0.35,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.roomsScreen);
                    },
                    child: const Text("Campanhas")),
              ),
            ),
            SizedBox(
              width: size.width * 0.35,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.personScreen);
                  },
                  child: const Text("Personagens")),
            ),
          ],
        ),
      ),
    );
  }
}
