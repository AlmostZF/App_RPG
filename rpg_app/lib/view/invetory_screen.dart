import 'package:flutter/material.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/model/carousel_model.dart';
import 'package:rpg_app/view/modal_Item.dart';

class Invetory extends StatefulWidget {
  const Invetory({Key? key}) : super(key: key);

  @override
  State<Invetory> createState() => _InvetoryState();
}

class _InvetoryState extends State<Invetory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CarouselModel carousel = CarouselModel();
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.34, left: size.width * 0.05),
            child: SizedBox(
              height: size.height * 0.8,
              width: size.width * 0.9,
              child: Card(
                child: ListView.builder(
                    itemCount: carousel.carouselItens.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return SizedBox(
                          width: size.width * 0.05,
                        );
                      }
                      return SizedBox(
                        height: size.height * 0.18,
                        width: size.height * 0.3,
                        child: Card(
                            margin: EdgeInsets.all(size.width * 0.04),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: index == 1
                                      ? () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const Invetory())))
                                      : () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const Invetory()))),
                                  child: Image.network(
                                    carousel.carouselItens[index],
                                    height: size.width * 0.160,
                                    width: size.height * 0.160,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.02),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: size.width * 0.42,
                                          child: const Text("Nome: Guilherme")),
                                      SizedBox(
                                          width: size.width * 0.42,
                                          child: const Text("Peso: Guilherme")),
                                      SizedBox(
                                          width: size.width * 0.42,
                                          child: const Text("Dano: Guilherme")),
                                      SizedBox(
                                          width: size.width * 0.42,
                                          child:
                                              const Text("Alcance: Guilherme")),
                                      SizedBox(
                                          width: size.width * 0.42,
                                          child: const Text(
                                              "Descrição: Guilherme")),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),
                color: defaultColor,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 90, left: 25),
            child: Text('Inventario',
                style: TextStyle(
                    color: otherColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.23, left: size.width * 0.85),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ModalItem())));
                },
                child: Icon(
                  Icons.add,
                  size: size.height * 0.05,
                  color: secondColor,
                )),
          )
        ],
      ),
    );
  }
}
