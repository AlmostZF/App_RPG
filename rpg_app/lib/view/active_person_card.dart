import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/controller/service/campaign_service.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/model/person_model.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/battle_screen.dart';

class ActivePersonCard extends StatelessWidget {
  final Person person;
  const ActivePersonCard(this.person);

  @override
  Widget build(BuildContext context) {
    CampaignService _campaignService = CampaignService();
    late Future<Campaign> _futureCampaign;
    final _form = GlobalKey<FormState>();
    final Map<String, String> _formData = {};
    Size size = MediaQuery.of(context).size;

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
        child: InkWell(
          splashColor: secondColor,
          onTap: () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      backgroundColor: defaultColor,
                      title: Text(
                        person.nome,
                        style: TextStyle(color: otherColor),
                      ),
                      content: SizedBox(
                        height: size.height * .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  person.historia,
                                  style: TextStyle(
                                      color: secondColor,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pontos",
                                      style: TextStyle(
                                          color: otherColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Constituição: ${person.constituicao}",
                                      style: TextStyle(
                                        color: otherColor,
                                      ),
                                    ),
                                    Text(
                                      "Destreza: ${person.destreza}",
                                      style: TextStyle(color: otherColor),
                                    ),
                                    Text(
                                      "Força: ${person.forca}",
                                      style: TextStyle(color: otherColor),
                                    ),
                                    Text(
                                      "Inteligência: ${person.inteligencia}",
                                      style: TextStyle(color: otherColor),
                                    ),
                                    Text(
                                      "Sabedoria: ${person.sabedoria}",
                                      style: TextStyle(color: otherColor),
                                    ),
                                    Text(
                                      "Carisma: ${person.carisma}",
                                      style: TextStyle(color: otherColor),
                                    ),
                                    Text(
                                      "Constituição: ${person.constituicao}",
                                      style: TextStyle(color: otherColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.favorite),
                        Text(person.vida),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Icon(Icons.hourglass_bottom),
                        Text(person.mana),
                      ],
                    ),
                  ],
                ),
              ),
              iconColor: secondColor,
            ),
          ),
        ),
      ),
    );
  }
}
