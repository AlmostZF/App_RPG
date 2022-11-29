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
        padding: EdgeInsets.only(top: size.width * .6),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: size.width * .7,
                width: size.width * .7,
                child: const Center(
                    child: Image(
                  image: AssetImage('asset/images/logo.png'),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * .2),
              child: SizedBox(
                width: size.width * 0.35,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.roomsScreen);
                    },
                    child: const Text("Criar sala")),
              ),
            ),
            SizedBox(
              width: size.width * 0.35,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.personScreen);
                  },
                  child: const Text("Entrar na sala")),
            ),
          ],
        ),
      ),
    );
  }
}
