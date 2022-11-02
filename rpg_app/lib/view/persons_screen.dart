import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/view/homePage.dart';
import 'package:rpg_app/view/person_card.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  late Future<Person> _person;

  @override
  Widget build(BuildContext context) {
    final Persons persons = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF432986),
        title: const Text(
          "Meus Personagens",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.persomForm);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: persons.count,
        itemBuilder: (ctx, i) => PersomCard(
          persons.byIndex(i),
        ),
      ),
    );
  }
}
