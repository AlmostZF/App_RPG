import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;
  const CampaignCard(this.campaign);

  @override
  Widget build(BuildContext context) {
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
                builder: (ctx) => AlertDialog(
                  backgroundColor: const Color(0xFF432986),
                  title: Text(
                    "Iniciar campanha ${campaign.nome}",
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondColor,
                      ),
                      child: const Text(
                        "Sim",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              );
            },
            child: ListTile(
              title: Text(
                campaign.nome,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              textColor: Colors.white,
              subtitle: Text("${campaign.descricao}"),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      color: const Color(0xFFFFFFFF),
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.campaignForm,
                          arguments: campaign,
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
                              "Excluir campanha?",
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
                                  "Não",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: secondColor,
                                ),
                                child: const Text(
                                  "Sim",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Provider.of<Campaigns>(context, listen: false)
                                      .remove(campaign);
                                  Navigator.of(context).pop();
                                },
                              )
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
