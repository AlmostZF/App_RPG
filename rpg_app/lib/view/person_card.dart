import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/controller/service/campaign_service.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/model/power_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/battle_screen.dart';

class PersomCard extends StatelessWidget {
  final Person person;
  const PersomCard(this.person);

  @override
  Widget build(BuildContext context) {
    CampaignService _campaignService = CampaignService();
    late Future<Campaign> _futureCampaign;
    final _form = GlobalKey<FormState>();
    final Map<String, String> _formData = {};

    final avatar = person.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(
              Icons.person,
              size: 27,
            ),
            radius: 27,
          )
        : CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage(person.avatarUrl),
          );
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 3),
      child: Card(
        color: colorFist,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            splashColor: secondColor,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) => Form(
                        key: _form,
                        child: AlertDialog(
                          backgroundColor: defaultColor,
                          title: Text(
                            "Entrar na campanha com: ${person.nome}",
                            style: TextStyle(color: otherColor),
                          ),
                          content: TextFormField(
                            style: const TextStyle(
                              color: otherColor,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: backgroundColor),
                              ),
                              labelText: "ID da sala",
                            ),
                            onSaved: (value) =>
                                _formData['idSala'] = value.toString(),
                          ),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: secondColor,
                              ),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                _form.currentState?.save();
                                _futureCampaign =
                                    _campaignService.fetchCampaign(
                                        _formData['idSala'].toString());
                                _futureCampaign.then((value) => (Provider.of<
                                        Campaigns>(context, listen: false)
                                    .put(value.pAtivos == ""
                                        ? Campaign(
                                            id: _formData['idSala'].toString(),
                                            nome: value.nome,
                                            descricao: value.descricao,
                                            pAtivos: "${person.id},",
                                          )
                                        : Campaign(
                                            id: _formData['idSala'].toString(),
                                            nome: value.nome,
                                            descricao: value.descricao,
                                            pAtivos:
                                                "${value.pAtivos}${person.id},",
                                          ))));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BattleScreen(
                                              person,
                                            )));
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: secondColor,
                              ),
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ));
            },
            child: ListTile(
              leading: avatar,
              title: Text(
                person.nome,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              textColor: Colors.white,
              subtitle: Text(
                  "Nível: ${person.nivel} | ${person.raca}\n${person.classe}"),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      color: const Color(0xFFFFFFFF),
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.persomForm,
                          arguments: person,
                        );
                      },
                    ),
                    IconButton(
                      color: secondColor,
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: const Color(0xFF432986),
                            title: const Text(
                              "Excluir personagem",
                              style: TextStyle(color: Colors.white),
                            ),
                            content: const Text(
                              "Tem certeza?",
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: secondColor,
                                ),
                                child: const Text(
                                  "Sim",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Provider.of<Persons>(context, listen: false)
                                      .remove(person);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: secondColor,
                                ),
                                child: const Text(
                                  "Não",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
