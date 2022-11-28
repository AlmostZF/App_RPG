import 'package:flutter/material.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/style/colors.dart';

class MasterScreen extends StatefulWidget {
  final Campaign campaign;
  const MasterScreen(this.campaign);
  @override
  State<MasterScreen> createState() => _MasterScreenState(campaign);
}

class _MasterScreenState extends State<MasterScreen>
    with TickerProviderStateMixin {
  final Campaign campaign;
  _MasterScreenState(this.campaign);

  late TabController _tabController;
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

    //_tabController = TabController(length: ativosList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    String pAtivos = "${campaign.pAtivos}";
    List<String> ativosList = pAtivos.split(",");
    try {
      final campaing = ModalRoute.of(context)?.settings.arguments as Campaign;
      _loadFormData(campaing);
    } catch (e) {
      print(e);
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorFist,
        title: Text("Em batalha"),
        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: <Widget>[
        //     Tab(
        //       text: "p1",
        //     ),
        //     Tab(
        //       text: "p2",
        //     ),
        //     Tab(
        //       text: "p3",
        //     ),
        //   ],
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: ativosList.length,
            itemBuilder: (ctx, i) => Text(
                  "ID: ${ativosList[i]}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
      ),
    );
  }
}
