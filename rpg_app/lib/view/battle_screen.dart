import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';
import 'package:rpg_app/controller/battele_controller.dart';
import 'package:rpg_app/view/modal_Item.dart';
import 'package:rpg_app/view/modal_poder.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:rpg_app/model/carousel_model.dart';
import 'package:rpg_app/style/colors.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  CarouselModel carousel = CarouselModel();
  BattleController battleController = BattleController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
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
                    backgroundColor: colorFist,
                    maxRadius: size.width * .15,
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.width * .1,
                        width: size.width * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: colorFist),
                        child: Center(
                          child: Text(
                            "NOME DO USÁRIO",
                            style: TextStyle(
                                fontSize: size.width * .06, color: otherColor),
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
                                    color:
                                        colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: otherColor),
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
                                  color: colorFist,
                                ),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: otherColor),
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
                                        colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: otherColor),
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
                                        colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: otherColor),
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
                                        colorFist),
                                child: Center(
                                  child: Text(
                                    "ICON",
                                    style: TextStyle(
                                        fontSize: size.width * .04,
                                        color: otherColor),
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
                    children: const [
                      Icon(Icons.star, color: otherColor),
                      Text("Nível", style: TextStyle(color: otherColor)),
                      Icon(Icons.star, color: otherColor),
                    ],
                  ),
                  GestureDetector(
                    child: const Icon(Icons.backpack, color: otherColor,),
                  )
                ],
              ),
              Text(
                "Poderes",
                style: TextStyle(color: otherColor, fontSize: size.width * .09),
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
                    return ClipOval(
                      child: Container(
                         margin: EdgeInsets.all(size.width * 0.02),
                        width: size.width * 0.167,
                        height: size.height * 0.167,
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Ink.image(
                                  image: NetworkImage(
                                  carousel.carouselItens[index],
                                ),
                                fit: BoxFit.cover,
                                   height: size.width * 0.167,
                                  width: size.height * 0.167,
                                  child: InkWell(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const ModalPoder())))
                                  ),
                                ),
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
                          Padding(
                            padding: EdgeInsets.only(top: size.width*0.05),
                            child: Row(
                              children: [
                                const Icon(Icons.heart_broken, color: otherColor,),
                                const Text(" Vida ", style: TextStyle(color: otherColor)),
                                Text(
                                    "${battleController.valueVida}/${battleController.maxVida}", style: const TextStyle(color: otherColor),),
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
                                  child: const Icon(Icons.remove, color: otherColor,)),
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
                                thumbIcon: const  Icon(
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
                                  child: const Icon(Icons.add, color: otherColor,))
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
                              const Icon(Icons.hourglass_bottom, color: otherColor,),
                              const Text("Mana", style: TextStyle(color: otherColor)),
                              Text(
                                  "${battleController.valueMana}/${battleController.maxMana}", style: const TextStyle(color: otherColor)),
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
                                  child: const Icon(Icons.remove, color: otherColor,)),
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
                                    // battleController.valueMana = value;
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
                                      battleController.valueMana++;
                                    });
                                  },
                                  child: const Icon(Icons.add, color: otherColor))
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
                          children: const [Icon(Icons.balance, color: otherColor), Text("Banco", style: TextStyle(color: otherColor))],
                        ),
                      ),
                      const Text("1120,00",style: TextStyle(color: otherColor))
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [Icon(Icons.monetization_on, color: otherColor), Text("Ouro",style: TextStyle(color: otherColor))],
                        ),
                      ),
                      const Text("110,00",style: TextStyle(color: otherColor))
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [Icon(Icons.diamond, color: otherColor), Text("Diamante",style: TextStyle(color: otherColor))],
                        ),
                      ),
                      const Text("20,00",style: TextStyle(color: otherColor))
                    ],
                  ),
                ],
              ),
              // END COIN
              // START GRÁFICO
      
              Padding(
                padding: EdgeInsets.only(top: size.height*0.03),
                child: RadarWidget(
                  skewing: 0,
                  radarMap: RadarMapModel(
                    legend: [
                      LegendModel('10/10', secondColor),
                    ],
                    indicator: [
                      IndicatorModel("English", 100, ),
                      IndicatorModel("Physics", 100),
                      IndicatorModel("Chemistry", 100),
                      IndicatorModel("Biology", 100),
                      IndicatorModel("Politics", 100),
                      IndicatorModel("History", 100),
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
                  textStyle: const TextStyle(color: otherColor, fontSize: 14),
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
              ),
      
              // END GRÁFICO
            ],
          ),
        ),
      ),
    );
  }
}