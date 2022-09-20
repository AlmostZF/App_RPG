import 'package:flutter/material.dart';
import 'package:rpg_app/controller/battele_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:rpg_app/model/carousel_model.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  CarouselModel carousel = new CarouselModel();
  BattleController battleController = BattleController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff323433),
      body: Padding(
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
                          "NOME DO USÁRIO",
                          style: TextStyle(
                              fontSize: size.width * .07, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(25, 217, 217, 217)),
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
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(25, 217, 217, 217),
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
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(25, 217, 217, 217)),
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
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(25, 217, 217, 217)),
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
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(25, 217, 217, 217)),
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
                    Text("Nível"),
                    Icon(Icons.star),
                  ],
                ),
                GestureDetector(
                  child: Icon(Icons.backpack),
                )
              ],
            ),
            Text(
              "Poderes",
              style: TextStyle(color: Colors.white, fontSize: size.width * .09),
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
                          children: [
                            Icon(Icons.heart_broken),
                            Text("Vida"),
                            Text("${battleController.valueVida}/${battleController.maxVida}"),
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
                                child: Icon(Icons.remove)),
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
                                  battleController.valueVida= value;
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
                                child: Icon(Icons.add))
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
                            Icon(Icons.hourglass_bottom),
                            Text("Mana"),
                            Text("${battleController.valueMana}/${battleController.maxMana}"),
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
                                child: Icon(Icons.remove)),
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
                                child: Icon(Icons.add))
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.balance),
                          Text("Banco")
                        ],
                      ),
                      Text("1120,00")
                    ],
                  ),
                                    Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.monetization_on),
                          Text("Ouro")
                        ],
                      ),
                      Text("110,00")
                    ],
                  ),
                                    Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.diamond),
                          Text("Diamante")
                        ],
                      ),
                      Text("20,00")
                    ],
                  ),
                ],
              ),
            ),
            // END COIN
            // START GRÁFICO
            
            // END GRÁFICO
          ],
        ),
      ),
    );
  }
}
