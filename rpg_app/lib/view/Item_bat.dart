import 'package:flutter/material.dart';
import 'package:rpg_app/routes/app_routes.dart';

import '../model/Item_model.dart';

class ItemBar extends StatelessWidget {
  final Item item;
  const ItemBar(this.item);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        item.id == "1"
            ? Navigator.of(context).pushNamed(AppRoutes.modalItem)
            : Navigator.of(context).pushNamed(
                AppRoutes.modalItem,
                arguments: item,
              );
      },
      child: item.id == "1"
          ? Row(
            children: [
              ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Center(
                          child: Container(
                            width: size.width * 0.3,
                            height: size.height * 0.15,
                           child: Icon(Icons.add),
                            ),
                            ),
                        ), 
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.1),
                  child: Text("Adicione um poder"),
                ),
            ],
          )
          : Row(
            children: [
              ClipRRect(
                        //borderRadius: BorderRadius.circular(15),
                        child: Center(
                          child: Container(
                            width: size.width * 0.3,
                            height: size.height * 0.15,
                            decoration:BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(item.itemUrl),
                                fit: BoxFit.cover,
                              )
                            ),
                            ),
                        )
                        ),
                 Padding(
                                padding:
                                    EdgeInsets.only(top: size.width * 0.02, left: size.width * 0.02),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: size.width * 0.42,
                                        child: Text("Nome: ${item.nome}")),
                                    SizedBox(
                                        width: size.width * 0.42,
                                        child: Text("Peso: ${item.peso}")),
                                    SizedBox(
                                        width: size.width * 0.42,
                                        child: Text("Dano: ${item.dano}")),
                                    SizedBox(
                                        width: size.width * 0.42,
                                        child:
                                             Text("Alcance: ${item.alcance}")),
                                    SizedBox(
                                        width: size.width * 0.42,
                                        child: Text("Preço: ${item.preco}")),
                                  ],
                                ),
                              ),
            ],
          ),
    );
  }
}
