import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/components/personagemTile.dart';
import 'package:rpg_app/provider/personagens.dart';
import 'package:rpg_app/routes/approutes.dart';
import 'package:rpg_app/view/homePage.dart';

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
          backgroundColor: Color(0xFF432986),
          title: const Text(
            "Meus Personagens",
          ),
          actions: [
            IconButton(
                onPressed: () {
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
        ));
  }
}
