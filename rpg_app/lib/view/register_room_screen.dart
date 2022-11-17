import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';

class RegisterRoomScreen extends StatefulWidget {
  const RegisterRoomScreen({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterRoomScreen> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  // void _loadFormData(Person person) {
  //   if (person != null) {
  //     id:
  //     _formData['id'] = person.id;
  //     nome:
  //     _formData['nome'] = person.nome;
  //     jogador:
  //     _formData['jogador'] = person.jogador;
  //     raca:
  //     _formData['raca'] = person.raca;
  //     classe:
  //     _formData['classe'] = person.classe;
  //     nivel:
  //     _formData['nivel'] = person.nivel;
  //     historia:
  //     _formData['historia'] = person.historia;
  //     ideais:
  //     _formData['ideais'] = person.ideais;
  //     forca:
  //     _formData['forca'] = person.forca;
  //     destreza:
  //     _formData['destreza'] = person.destreza;
  //     constituicao:
  //     _formData['constituicao'] = person.constituicao;
  //     inteligencia:
  //     _formData['inteligencia'] = person.inteligencia;
  //     sabedoria:
  //     _formData['sabedoria'] = person.sabedoria;
  //     carisma:
  //     _formData['carisma'] = person.carisma;
  //     vida:
  //     _formData['vida'] = person.vida;
  //     mana:
  //     _formData['mana'] = person.mana;
  //     avatarUrl:
  //     _formData['avatarUrl'] = person.avatarUrl;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // try {
    //   final person = ModalRoute.of(context)?.settings.arguments as Person;
    //   _loadFormData(person);
    // } catch (e) {
    //   print(e);
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        foregroundColor: colorFist,
        title: const Text("Criar campanha"),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.save),
        //     onPressed: () {
        //       _form.currentState?.save();

        //       Provider.of<Persons>(context, listen: false).put(
        //         Person(
        //           id: _formData['id'].toString(),
        //           nome: _formData['nome'].toString(),
        //           jogador: _formData['jogador'].toString(),
        //           raca: _formData['raca'].toString(),
        //           classe: _formData['classe'].toString(),
        //           nivel: _formData['nivel'].toString(),
        //           historia: _formData['historia'].toString(),
        //           ideais: _formData['ideais'].toString(),
        //           forca: _formData['forca'].toString(),
        //           destreza: _formData['destreza'].toString(),
        //           constituicao: _formData['constituicao'].toString(),
        //           inteligencia: _formData['inteligencia'].toString(),
        //           sabedoria: _formData['sabedoria'].toString(),
        //           carisma: _formData['carisma'].toString(),
        //           vida: _formData['vida'].toString(),
        //           mana: _formData['mana'].toString(),
        //           avatarUrl: _formData['avatarUrl'].toString(),
        //         ),
        //       );
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ],
      ),
      body: Form(
        key: _form,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondColor,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.save,
          color: defaultColor,
        ),
      ),
    );
  }
}
