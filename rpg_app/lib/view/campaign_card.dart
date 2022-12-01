import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/controller/service/campaign_service.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/master_screen.dart';

class CampaignCard extends StatefulWidget {
  final Campaign campaign;
  CampaignCard(this.campaign);

  @override
  State<CampaignCard> createState() => _CampaignCardState(campaign);
}

class _CampaignCardState extends State<CampaignCard> {
  final Campaign campaign;
  _CampaignCardState(this.campaign);
  late Future<List<Campaign>> _futureCampaign;

  CampaignService _campaignService = new CampaignService();
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
                  backgroundColor: defaultColor,
                  title: SizedBox(
                    height: 75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Iniciar campanha",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              "${campaign.id}",
                              style: TextStyle(color: otherColor, fontSize: 20),
                            ),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: campaign.id));
                              },
                              icon: Icon(
                                Icons.copy,
                                size: 20,
                              ),
                              color: secondColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondColor,
                      ),
                      child: const Text(
                        "Iniciar",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MasterScreen(
                                      campaign,
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
                                  "Sim",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Provider.of<Campaigns>(context, listen: false)
                                      .remove(campaign);
                                  setState(() {
                                    _futureCampaign =
                                        _campaignService.fetchCampaigns();
                                    _futureCampaign.then(
                                        (value) => Navigator.of(context).pop());
                                  });
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
