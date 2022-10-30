import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Criar de poderes'),

      actions: <Widget>[
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: size.width*0.3),
              child: SizedBox(
                width: size.width*0.4,
                height: size.height*0.06,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Poder"
                    
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width*0.45, bottom: size.width*0.02),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width:65,
                  height: 65,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: const TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: "Tempo de Conjuração"
             ),
           ),
         ),
       ),
      Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: const TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: "Alcance"
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: const TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: "Duração"
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: const TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: "Mana"
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: const TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: "Dano"
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: const TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: "Componente"
             ),
           ),
         ),
       ),
       Padding(
         padding: EdgeInsets.only(bottom: size.height*0.03),
         child: SizedBox(
           width: size.width*0.7,
           height: size.height*0.06,
           child: const TextField(
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               labelText: "Nível"
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
                          color: Colors.amber
                        ),
                      ),
                    )
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Criar'),
                      child: const Text('Criar', style: TextStyle(color: Colors.black)),
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
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber
                      ),
                    )
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Limpar'),
                      child: const Text('Limpar', style: TextStyle(color: Colors.black),),
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
