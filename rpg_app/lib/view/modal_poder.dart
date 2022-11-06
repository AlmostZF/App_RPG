import 'package:flutter/material.dart';
import 'package:rpg_app/style/colors.dart';

class ModalPoder extends StatelessWidget {
  const ModalPoder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.width * 0.15),
          child: Column(
            children: [
              const Text('Criar de poderes',
                  style: TextStyle(
                      color: otherColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Padding(
                  padding: EdgeInsets.only(
                      right: size.width * 0.3, top: size.width * 0.03)),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.2, top: size.width * 0.03),
                    child: SizedBox(
                      width: size.width * 0.46,
                      height: size.height * 0.06,
                      child: const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nome do Poder"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.5,
                      bottom: size.width * 0.02,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: size.width * 0.2,
                        height: size.height * 0.1,
                        color: otherColor,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: size.height * 0.03,
                ),
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Tempo de Conjuração"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Alcance"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Duração"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Mana"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Dano"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Componente"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.03),
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.06,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Nivel"),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.height * 0.1),
                    child: SizedBox(
                      width: size.width * 0.25,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondColor)),
                          onPressed: () {
                            //Navigator.of(context).pushNamed(AppRoutes.battleScreen);
                          },
                          child: const Text("Criar",
                              style: TextStyle(
                                color: colorFist,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.height * 0.05),
                    child: SizedBox(
                      width: size.width * 0.25,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondColor)),
                          onPressed: () {
                            //Navigator.of(context).pushNamed(AppRoutes.battleScreen);
                          },
                          child: const Text("Limpar",
                              style: TextStyle(
                                color: colorFist,
                              ))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
