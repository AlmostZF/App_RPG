import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:rpg_app/controller/battele_controller.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/invetory_screen.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/view/modal_poder.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:rpg_app/model/carousel_model.dart';

class BattleScreen extends StatefulWidget {
  final Person person;
  const BattleScreen(this.person);
  @override
  State<BattleScreen> createState() => _BattleScreenState(person);
}

class _BattleScreenState extends State<BattleScreen> {
  CarouselModel carousel = CarouselModel();
  BattleController battleController = BattleController();

  final Person person;
  _BattleScreenState(this.person);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int maxMana = int.parse(person.mana);
    int valueMana = int.parse(person.mana);

    List<double> atributos = [
      double.parse(person.forca),
      double.parse(person.destreza),
      double.parse(person.constituicao),
      double.parse(person.inteligencia),
      double.parse(person.sabedoria),
      double.parse(person.carisma)
    ];

    dynamic atributoMaximo = atributos.first;
    void maiorAtributo() {
      atributos.forEach((e) {
        if (e > atributoMaximo) atributoMaximo = e;
      });
    }

    maiorAtributo();

    return Scaffold(
      backgroundColor: const Color(0xff323433),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: size.width * .08, left: size.width * .006),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(25, 217, 217, 217),
                    maxRadius: size.width * .15,
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.width * .1,
                        width: size.width * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(25, 217, 217, 217)),
                        child: Center(
                          child: Text(
                            person.nome,
                            style: TextStyle(
                                fontSize: size.width * .06,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(size.width * .01),
                              child: Container(
                                height: size.width * .1,
                                width: size.width * .1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.width * .01),
                              child: Container(
                                height: size.width * .1,
                                width: size.width * .1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(25, 217, 217, 217),
                                ),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.width * .01),
                              child: Container(
                                height: size.width * .1,
                                width: size.width * .1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.width * .01),
                              child: Container(
                                height: size.width * .1,
                                width: size.width * .1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.width * .01),
                              child: Container(
                                height: size.width * .1,
                                width: size.width * .1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text("Nível: ${person.nivel}"),
                      Icon(Icons.star),
                    ],
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.backpack,
                      color: otherColor,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.02, bottom: size.width * 0.02),
                child: Text(
                  "Poderes",
                  style:
                      TextStyle(color: otherColor, fontSize: size.width * .07),
                ),
              ),
              // START CARROSEL
              Container(
                width: double.infinity,
                height: size.width * 0.23,
                //color: Colors.amber,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: carousel.carouselItens.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return SizedBox(width: size.width * 0.01);
                      }
                      return Container(
                          margin: EdgeInsets.all(size.width * 0.02),
                          width: size.width * 0.182,
                          height: size.height * 0.182,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: secondColor,
                              boxShadow: [
                                BoxShadow(
                                  color: secondColor,
                                  offset: Offset(0, 0),
                                  blurRadius: 4.0,
                                )
                              ]),
                          child: InkWell(
                            onTap: index == 1
                                ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const ModalPoder())))
                                : () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const Invetory()))),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  carousel.carouselItens[index],
                                  height: size.width * 0.182,
                                  width: size.height * 0.182,
                                ),
                              ),
                            ),
                          ));
                    }),
              ),
              // END CARROSEL
              // START SLIDER VIDA
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.width * 0.05),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.heart_broken,
                                  color: otherColor,
                                ),
                                const Text(" Vida ",
                                    style: TextStyle(color: otherColor)),
                                Text(
                                  "${battleController.valueVida}/${battleController.maxVida}",
                                  style: const TextStyle(color: otherColor),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      battleController.valueVida--;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: otherColor,
                                  )),
                              SfSlider(
                                activeColor: Colors.red,
                                min: 0.0,
                                max: battleController.maxVida,
                                value: battleController.valueVida,
                                showTicks: false,
                                showLabels: false,
                                enableTooltip: true,
                                minorTicksPerInterval: 1,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    battleController.valueVida = value;
                                  });
                                },
                                thumbIcon: const Icon(
                                  Icons.health_and_safety_outlined,
                                  size: 20,
                                ),
                                showDividers: true,
                                stepSize: 1,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      battleController.valueVida++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: otherColor,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // END SLIDER VIDA
              // START SLIDER MANA
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.hourglass_bottom,
                                color: otherColor,
                              ),
                              const Text("Mana",
                                  style: TextStyle(color: otherColor)),
                              Text(
                                  "${battleController.valueMana}/${battleController.maxMana}",
                                  style: const TextStyle(color: otherColor)),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      valueMana--;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: otherColor,
                                  )),
                              SfSlider(
                                activeColor: Colors.blue,
                                min: 0.0,
                                max: maxMana,
                                value: valueMana,
                                showTicks: false,
                                showLabels: false,
                                enableTooltip: true,
                                minorTicksPerInterval: 1,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    valueMana = value;
                                  });
                                },
                                thumbIcon: const Icon(
                                  Icons.health_and_safety_outlined,
                                  size: 20,
                                ),
                                showDividers: true,
                                stepSize: 1,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      valueMana++;
                                    });
                                  },
                                  child:
                                      const Icon(Icons.add, color: otherColor))
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // END SLIDER MANA
              // START COIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.balance, color: otherColor),
                            Text("Banco", style: TextStyle(color: otherColor))
                          ],
                        ),
                      ),
                      const Text("1120,00", style: TextStyle(color: otherColor))
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.monetization_on, color: otherColor),
                            Text("Ouro", style: TextStyle(color: otherColor))
                          ],
                        ),
                      ),
                      const Text("110,00", style: TextStyle(color: otherColor))
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.diamond, color: otherColor),
                            Text("Diamante",
                                style: TextStyle(color: otherColor))
                          ],
                        ),
                      ),
                      const Text("20,00", style: TextStyle(color: otherColor))
                    ],
                  ),
                ],
              ),
              // END COIN
              // START GRÁFICO

              RadarWidget(
                skewing: 0,
                radarMap: RadarMapModel(
                  legend: [
                    LegendModel('10/10', secondColor),
                  ],
                  indicator: [
                    IndicatorModel("Força", atributoMaximo),
                    IndicatorModel("Destreza", atributoMaximo),
                    IndicatorModel("Constituição", atributoMaximo),
                    IndicatorModel("Inteligência", atributoMaximo),
                    IndicatorModel("Sabedoria", atributoMaximo),
                    IndicatorModel("Carisma", atributoMaximo),
                  ],
                  data: [
                    //   MapDataModel([48,32.04,1.00,94.5,19,60,50,30,19,60,50]),
                    //   MapDataModel([42.59,34.04,1.10,68,99,30,19,60,50,19,30]),
                    MapDataModel([
                      double.parse(person.forca),
                      double.parse(person.destreza),
                      double.parse(person.constituicao),
                      double.parse(person.inteligencia),
                      double.parse(person.sabedoria),
                      double.parse(person.carisma),
                    ]),
                  ],
                  radius: 130,
                  duration: 2000,
                  shape: Shape.square,
                  maxWidth: 70,
                  line: LineModel(1),
                ),
                textStyle: const TextStyle(color: otherColor, fontSize: 14),
                isNeedDrawLegend: true,
                lineText: (p, length) => "${(p * 100 ~/ length)}%",
                dilogText: (IndicatorModel indicatorModel,
                    List<LegendModel> legendModels,
                    List<double> mapDataModels) {
                  StringBuffer text = StringBuffer("");
                  for (int i = 0; i < mapDataModels.length; i++) {
                    text.write(
                        "${legendModels[i].name} : ${mapDataModels[i].toString()}");
                    if (i != mapDataModels.length - 1) {
                      text.write("\n");
                    }
                  }
                  return text.toString();
                },
                outLineText: (data, max) => "${data * 100 ~/ max}%",
              ),

              // END GRÁFICO
            ],
          ),
        ),
      ),
    );
  }
}
