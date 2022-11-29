import 'package:flutter/material.dart';
import 'package:rpg_app/style/colors.dart';

class ModalItem extends StatelessWidget {
  const ModalItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Item"),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.width * .25),
          child: Column(
            children: [
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
                            enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defaultColor),
                        ),
                            labelText: "Nome do Item"),
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
                        child: GestureDetector(
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            color: defaultColor,
                            size: size.width * .08,
                          ),
                          onTap: () => {print("clicado")},
                        ),
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defaultColor),
                        ), labelText: "Peso"),
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
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defaultColor),
                        ), labelText: "Alcance"),
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
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defaultColor),
                        ), labelText: "Dano"),
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
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defaultColor),
                        ), labelText: "Resistencia"),
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
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defaultColor),
                        ),
                        labelText: "Preço"),
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
