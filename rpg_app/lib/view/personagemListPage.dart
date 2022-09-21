import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/components/personagemTile.dart';
import 'package:rpg_app/provider/personagens.dart';
import 'package:rpg_app/routes/approutes.dart';
import 'package:rpg_app/view/homePage.dart';
import 'package:rpg_app/view/models/personagem.dart';
import 'package:rpg_app/view/registerPage.dart';

class PersonagemListPage extends StatefulWidget {
  const PersonagemListPage({Key? key}) : super(key: key);

  @override
  State<PersonagemListPage> createState() => _PersonagemListPageState();
}

class _PersonagemListPageState extends State<PersonagemListPage> {
  @override
  Widget build(BuildContext context) {
    final Personagens personagens = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus Personagens"),
          actions: [
            IconButton(
                onPressed: () {
                  // personagens.put(Personagem(
                  //     avatarUrl: "",
                  //     carisma: "teste",
                  //     classe: "teste",
                  //     constituicao: "teste",
                  //     destreza: "teste",
                  //     forca: "teste",
                  //     historia: "teste",
                  //     id: "2",
                  //     ideais: "teste",
                  //     inteligencia: "teste",
                  //     jogador: "teste",
                  //     mana: "teste",
                  //     nivel: "teste",
                  //     nome: "A",
                  //     raca: "teste",
                  //     sabedoria: "teste",
                  //     vida: "teste"));
                  Navigator.of(context).pushNamed(AppRoutes.PERSONAGEM_FORM);
                },
                icon: Icon(Icons.add))
          ],
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ),
        body: ListView.builder(
          itemCount: personagens.count,
          itemBuilder: (ctx, i) => PersonagemTile(personagens.byIndex(i)),
        )
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8),
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: Column(
        //           children: [
        //             Card(
        //               clipBehavior: Clip.antiAlias,
        //               child: Column(
        //                 children: [
        //                   ListTile(
        //                     leading: const Icon(
        //                       Icons.assignment_ind_outlined,
        //                       size: 50.0,
        //                       color: Colors.purple,
        //                     ),
        //                     title: const Text('ZF'),
        //                     subtitle: Text(
        //                       "Idade: 10 - Classe: Mago",
        //                       style: TextStyle(
        //                         color: Colors.black.withOpacity(0.6),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: ElevatedButton(
        //                 onPressed: () {
        //                   Navigator.of(context).push(MaterialPageRoute(
        //                       builder: (context) => const RegisterPage()));
        //                 },
        //                 child: const Text(
        //                   "NOVO PERSONAGEM",
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10.0,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
