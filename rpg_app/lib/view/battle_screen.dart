import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:rpg_app/constants/constants.dart';
import 'package:rpg_app/controller/battele_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:rpg_app/model/carousel_model.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  CarouselModel carousel = CarouselModel();
  BattleController battleController = BattleController();
  CustomColors customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF1C0D2E),
      body: Padding(
        padding:
            EdgeInsets.only(top: size.width * .08, left: size.width * .006),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // START IMAGEM AVATAR
                  CircleAvatar(
                    maxRadius: size.width * .15,
                    backgroundColor: Color(0xFFFFC62F),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: size.width * .14,
                    ),
                  ),
                  // END IMAGEM AVATAR
                  Column(
                    children: [
                      Container(
                        height: size.width * .1,
                        width: size.width * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF432986)),
                        child: Center(
                          child: Text(
                            "NOME DO USÁRIO",
                            style: TextStyle(
                                fontSize: size.width * .06, color: Colors.white),
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
                                    color: const Color(0xFF432986)),
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
                                  color: const Color(0xFF432986),
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
                                    color: const Color(0xFF432986)),
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
                                    color: const Color(0xFF432986)),
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
                                    color: const Color(0xFF432986)),
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
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.width * .35),
                        child: Text(
                          "Nível 1 ",
                          style: TextStyle(
                              fontSize: size.width * .06, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * .3),
                    child: GestureDetector(
                      child: Icon(
                        Icons.backpack,
                        size: size.width * .1,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * .03),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Poderes",
                    style: TextStyle(
                        color: Colors.white, fontSize: size.width * .09),
                  ),
                ),
              ),
              // START CARROSEL
              Container(
                width: double.infinity,
                height: 100.0,
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
                        width: size.width * 0.167,
                        height: size.height * 0.167,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFC62F),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.network(
                              carousel.carouselItens[index],
                              height: size.width * 0.167,
                              width: size.height * 0.167,
                            ),
                          ),
                        ),
                      );
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.heart_broken,
                                size: size.width * .08,
                                color: Colors.white,
                              ),
                              Text(
                                "Vida",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.06),
                              ),
                              Text(
                                "${battleController.valueVida}/${battleController.maxVida}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.06),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      battleController.valueVida--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: size.width * .08,
                                    color: Colors.white,
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
                                thumbIcon: Icon(
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
                                  child: Icon(
                                    Icons.add,
                                    size: size.width * .08,
                                    color: Colors.white,
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
                              Icon(
                                Icons.hourglass_bottom,
                                size: size.width * .08,
                                color: Colors.white,
                              ),
                              Text(
                                "Mana",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.06),
                              ),
                              Text(
                                "${battleController.valueMana}/${battleController.maxMana}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.06),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      battleController.valueMana--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: size.width * .08,
                                    color: Colors.white,
                                  )),
                              SfSlider(
                                activeColor: Colors.blue,
                                min: 0.0,
                                max: battleController.maxMana,
                                value: battleController.valueMana,
                                showTicks: false,
                                showLabels: false,
                                enableTooltip: true,
                                minorTicksPerInterval: 1,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    battleController.valueMana = value;
                                  });
                                },
                                thumbIcon: Icon(
                                  Icons.health_and_safety_outlined,
                                  size: 20,
                                ),
                                showDividers: true,
                                stepSize: 1,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      battleController.valueMana++;
                                      print(battleController.valueMana);
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: size.width * .08,
                                    color: Colors.white,
                                  ))
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.balance,
                              size: size.width * .05,
                              color: Colors.white),
                          Text("Banco",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.05))
                        ],
                      ),
                      Text("1120,00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.04))
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [Icon(Icons.monetization_on,
                              size: size.width * .05,
                              color: Colors.white), Text("Ouro",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.05))],
                      ),
                      Text("110,00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.04))
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [Icon(Icons.diamond,
                              size: size.width * .05,
                              color: Colors.white), Text("Diamante",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.05))],
                      ),
                      Text("20,00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.04))
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
                    LegendModel('10/10', const Color(0XFF0EBD8D)),
                  ],
                  indicator: [
                    IndicatorModel("Força", 100),
                    IndicatorModel("Destreza", 100),
                    IndicatorModel("Constiuição", 100),
                    IndicatorModel("Sabedoria", 100),
                    IndicatorModel("Inteligência", 100),
                    IndicatorModel("Carisma", 100),
                  ],
                  data: [
                    //   MapDataModel([48,32.04,1.00,94.5,19,60,50,30,19,60,50]),
                    //   MapDataModel([42.59,34.04,1.10,68,99,30,19,60,50,19,30]),
                    MapDataModel([100, 90, 90, 90, 10, 20]),
                  ],
                  radius: 130,
                  duration: 2000,
                  shape: Shape.square,
                  maxWidth: 70,
                  line: LineModel(1),
                ),
                textStyle: const TextStyle(color: Colors.black, fontSize: 14),
                isNeedDrawLegend: true,
                lineText: (p, length) => "${(p * 100 ~/ length)}%",
                dilogText: (IndicatorModel indicatorModel,
                    List<LegendModel> legendModels, List<double> mapDataModels) {
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
