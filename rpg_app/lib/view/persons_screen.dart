import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/controller/service/person_service.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/person_card.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  late Future<List<Person>> _futurePerson;

  PersonService _personService = new PersonService();

  @override
  void initState() {
    super.initState();

    _futurePerson = _personService.fetchPersons();
  }

  @override
  Widget build(BuildContext context) {
    final Persons persons = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        foregroundColor: colorFist,
        title: const Text(
          "Meus Personagens",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondColor,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.persomForm);
        },
        child: const Icon(
          Icons.add,
          color: defaultColor,
        ),
      ),
      body: Center(
          child: FutureBuilder<List<Person>>(
              future: _futurePerson,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('none');
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    return ListView.builder(
                      itemCount: persons.count,
                      itemBuilder: (ctx, i) => PersomCard(
                        persons.byIndex(i),
                      ),
                    );
                }
              })),
    );
  }
}
