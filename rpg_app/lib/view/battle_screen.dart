import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  int _valueVida = 20;
  int _valueMana = 20;
  int maxVida = 100;
  int maxMana = 100;
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
                            Text("$_valueVida/$maxVida"),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _valueVida--;
                                    print(_valueVida);
                                  });
                                },
                                child: Icon(Icons.remove)),
                            SfSlider(
                              activeColor: Colors.red,
                              min: 0.0,
                              max: maxVida,
                              value: _valueVida,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _valueVida = value;
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
                                    _valueVida++;
                                    print(_valueVida);
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
                            Text("$_valueMana/$maxMana"),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _valueMana--;
                                    print(_valueMana);
                                  });
                                },
                                child: Icon(Icons.remove)),
                            SfSlider(
                              activeColor: Colors.blue,
                              min: 0.0,
                              max: maxMana,
                              value: _valueMana,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _valueMana = value;
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
                                    _valueMana++;
                                    print(_valueMana);
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
          ],
        ),
      ),
    );
  }
}