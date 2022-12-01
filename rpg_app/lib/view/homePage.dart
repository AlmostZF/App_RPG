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
            Expanded(
              child: const Center(
                  child: Image(
                image: AssetImage('asset/images/logo.png'),
              )),
            ),
            SizedBox(
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      width: 130,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.roomsScreen);
                          },
                          child: const Text("Criar sala")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 130,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.personScreen);
                          },
                          child: const Text("Entrar na sala")),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
