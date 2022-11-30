import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/controller/service/campaign_service.dart';
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
  late Future<Campaign> _futureActivesPerson;

  PersonService _personService = new PersonService();
  CampaignService _campaignService = CampaignService();

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
    _futureActivesPerson = _campaignService.fetchCampaign(campaign.id);
  }

  @override
  Widget build(BuildContext context) {
    final Persons persons = Provider.of(context);

    String pAtivos = campaign.pAtivos;
    List<String> ativosList = pAtivos.split(",");

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _futureActivesPerson =
                        _campaignService.fetchCampaign(campaign.id);
                    _futureActivesPerson.then((value) {
                      ativosList = value.pAtivos.split(",");
                    });

                    _futurePerson = _personService.fetchPersons();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
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
                        itemBuilder: (ctx, i) =>
                            ativosList.contains(snapshot.data![i].id)
                                ? ActivePersonCard(
                                    snapshot.data![i],
                                  )
                                : Container(),
                      );
                  }
                })));
  }
}
