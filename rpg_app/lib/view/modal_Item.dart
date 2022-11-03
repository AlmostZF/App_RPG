import 'package:flutter/material.dart';
import 'package:rpg_app/style/colors.dart';

class ModalItem extends StatelessWidget {
  const ModalItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text('Criar Item',style: TextStyle(color: otherColor)),
      backgroundColor: defaultColor,
      actions: <Widget>[
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: size.width*0.3, top:size.width*0.032),
              child: SizedBox(
                width: size.width*0.4,
                height: size.height*0.06,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Item"
                    
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width*0.45, bottom: size.width*0.02),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: size.width*0.18,
                  height: size.height*0.1,
                  color: otherColor,
                ),
              ),
            ),
          ],
        ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03, ),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: Padding(
             padding: EdgeInsets.only(right: size.height*0.03),
             child: const TextField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Peso"
               ),
             ),
           ),
         ),
       ),
      Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child:  Padding(
             padding: EdgeInsets.only(right: size.height*0.03),
             child: const TextField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Alcance"
               ),
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child:  Padding(
             padding: EdgeInsets.only(right: size.height*0.03),
             child: const TextField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Dano"
               ),
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child:  Padding(
             padding: EdgeInsets.only(right: size.height*0.03),
             child: const TextField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Resistencia"
               ),
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child:  Padding(
             padding: EdgeInsets.only(right: size.height*0.03),
             child: const TextField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Preço"
               ),
             ),
           ),
         ),
       ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.height*0.05),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    Positioned.fill(
                    child: SizedBox(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: colorFist
                        ),
                      ),
                    )
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Criar'),
                      child: const Text('Criar', style: TextStyle(color: secondColor)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.height*0.1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    Positioned.fill(
                    child: 
                    SizedBox(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: colorFist
                        ),
                      ),
                    )
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Limpar'),
                      child: const Text('Limpar', style: TextStyle(color: secondColor),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
