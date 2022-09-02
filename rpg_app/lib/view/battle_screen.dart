import 'package:flutter/material.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({Key? key}) : super(key: key);

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.width * .08),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  maxRadius: size.width * .15,
                ),
                Column(
                  children: [
                    Container(
                      height: size.width * .1,
                      width: size.width * .5,
                      decoration: const BoxDecoration(color: Colors.black),
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
                              decoration:
                                  const BoxDecoration(color: Colors.black),
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
                              decoration:
                                  const BoxDecoration(color: Colors.black),
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
                              decoration:
                                  const BoxDecoration(color: Colors.black),
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
                              decoration:
                                  const BoxDecoration(color: Colors.black),
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
                              decoration:
                                  const BoxDecoration(color: Colors.black),
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
            
          ],
        ),
      ),
    );
  }
}
