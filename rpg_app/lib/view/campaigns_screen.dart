import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/controller/service/campaign_service.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';
import 'package:rpg_app/view/campaign_card.dart';

class CampaignsScreen extends StatefulWidget {
  const CampaignsScreen({Key? key}) : super(key: key);

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  late Future<List<Campaign>> _futureCampaign;

  CampaignService _campaignService = new CampaignService();

  @override
  void initState() {
    super.initState();
    _futureCampaign = _campaignService.fetchCampaigns();
  }

  Widget build(BuildContext context) {
    setState(() {
      _futureCampaign = _campaignService.fetchCampaigns();
    });
    final Campaigns campaign = Provider.of(context);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        foregroundColor: colorFist,
        title: const Text(
          "Minhas Campanhas",
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _futureCampaign = _campaignService.fetchCampaigns();
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondColor,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.campaignForm);
        },
        child: const Icon(
          Icons.add,
          color: defaultColor,
        ),
      ),
      body: Center(
          child: FutureBuilder<List<Campaign>>(
              future: _futureCampaign,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('none');
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (ctx, i) => CampaignCard(
                          snapshot.data![i],
                        ),
                      );
                    } else {
                      return Text(
                        "Crie uma nova campanha",
                        style: TextStyle(fontSize: 30, color: otherColor),
                      );
                    }
                }
              })),
    );
  }
}
