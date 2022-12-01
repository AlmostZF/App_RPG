import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/model/carousel_model.dart';
import 'package:rpg_app/view/Item_bat.dart';
import 'package:rpg_app/controller/item_controller.dart';

import '../routes/app_routes.dart';

class Invetory extends StatefulWidget {
   final Items item;
   const Invetory(this.item);

  @override
  State<Invetory> createState() => _InvetoryState(item);
}

class _InvetoryState extends State<Invetory> {
   final Items item;
   _InvetoryState(this.item);
  
  @override
  Widget build(BuildContext context) {
    final Items items = Provider.of(context);
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
              child: ListView.builder(
                  itemCount: item.count,
                  itemBuilder: (ctx, i) =>
                    // if (index == 0) {
                    //   return SizedBox(
                    //     width: size.width * 0.05,
                    //   );
                    // }
                    SizedBox(
                      height: size.height * 0.18,
                      width: size.height * 0.3,
                      child: Card(
                          margin: EdgeInsets.all(size.width * 0.04),
                          child: Row(
                            children: [
                              ItemBar(items.byIndex(i)),
                              // InkWell(
                              //   onTap: index == 1
                              //       ? () => {
                              //        Navigator.of(context).pushNamed(AppRoutes.invetory)
                              //     }
                              //       : () => {
                              //        Navigator.of(context).pushNamed(AppRoutes.invetory)
                              //     },
                              //   child: Image.network(
                              //     carousel.carouselItens[index],
                              //     height: size.width * 0.160,
                              //     width: size.height * 0.160,
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       EdgeInsets.only(top: size.width * 0.02),
                              //   child: Column(
                              //     children: [
                              //       SizedBox(
                              //           width: size.width * 0.42,
                              //           child: const Text("Nome: Guilherme")),
                              //       SizedBox(
                              //           width: size.width * 0.42,
                              //           child: const Text("Peso: Guilherme")),
                              //       SizedBox(
                              //           width: size.width * 0.42,
                              //           child: const Text("Dano: Guilherme")),
                              //       SizedBox(
                              //           width: size.width * 0.42,
                              //           child:
                              //               const Text("Alcance: Guilherme")),
                              //       SizedBox(
                              //           width: size.width * 0.42,
                              //           child: const Text(
                              //               "Descrição: Guilherme")),
                              //     ],
                              //   ),
                              // ),
                            ],
                          )),
                    )
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
                 Navigator.of(context).pushNamed(AppRoutes.modalItem);
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
