import 'package:flutter/material.dart';
import 'package:rpg_app/view/characterPage.dart';

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
        child: Expanded(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: size.width * .3,
                  width: size.width * .3,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: const Center(
                    child: Text(
                      "LOGO",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.width * .4),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Criar Sala")),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CharacterPage()));
                  },
                  child: const Text("Entrar na Sala")),
            ],
          ),
        ),
      ),
    );
  }
}
