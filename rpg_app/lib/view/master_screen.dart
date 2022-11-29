import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/controller/service/person_service.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/active_person_card.dart';

class MasterScreen extends StatefulWidget {
  final Campaign campaign;
  const MasterScreen(this.campaign);
  @override
  State<MasterScreen> createState() => _MasterScreenState(campaign);
}

class _MasterScreenState extends State<MasterScreen> {
  late Future<List<Person>> _futurePerson;

  PersonService _personService = new PersonService();

  final Campaign campaign;
  _MasterScreenState(this.campaign);

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Campaign campaing) {
    if (campaing != null) {
      id:
      _formData['id'] = campaing.id;
      nome:
      _formData['nome'] = campaing.nome;
      descricao:
      _formData['descricao'] = campaing.descricao;
      pAtivos:
      _formData['pAtivos'] = campaing.pAtivos;
    }
  }

  @override
  void initState() {
    super.initState();

    _futurePerson = _personService.fetchPersons();
  }

  @override
  Widget build(BuildContext context) {
    final Persons persons = Provider.of(context);
    String pAtivos = campaign.pAtivos;
    List<String> ativosList = pAtivos.split(",");
    return Scaffold(
        appBar: AppBar(
          foregroundColor: colorFist,
          title: Text("Em batalha"),
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
                        itemBuilder: (ctx, i) =>
                            ativosList.contains(persons.byIndex(i).id)
                                ? ActivePersonCard(
                                    persons.byIndex(i),
                                  )
                                : Container(),
                      );
                  }
                })));
  }
}
