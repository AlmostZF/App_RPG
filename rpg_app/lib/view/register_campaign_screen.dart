import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/campaign_controller.dart';
import 'package:rpg_app/model/campaign_model.dart';
import 'package:rpg_app/style/colors.dart';

class RegisterCampaignScreen extends StatefulWidget {
  const RegisterCampaignScreen({Key? key}) : super(key: key);

  @override
  _RegisterCampaignScreenState createState() => _RegisterCampaignScreenState();
}

class _RegisterCampaignScreenState extends State<RegisterCampaignScreen> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  bool isEdit = false;

  void _loadFormData(Campaign campaing) {
    if (campaing != null) {
      id:
      _formData['id'] = campaing.id;
      nome:
      _formData['nome'] = campaing.nome;
      descricao:
      _formData['descricao'] = campaing.descricao;
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      final campaing = ModalRoute.of(context)?.settings.arguments as Campaign;
      isEdit = true;
      _loadFormData(campaing);
    } catch (e) {
      print(e);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        foregroundColor: colorFist,
        title: Text(isEdit ? "Editar campanha" : "Criar campanha"),
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _formData['nome'],
                  style: const TextStyle(color: otherColor),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defaultColor)),
                    labelText: 'Nome',
                  ),
                  onSaved: (value) => _formData['nome'] = value.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _formData['descricao'],
                  style: const TextStyle(color: otherColor),
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defaultColor)),
                    labelText: 'Descrição',
                  ),
                  onSaved: (value) => _formData['descricao'] = value.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondColor,
        onPressed: () {
          _form.currentState?.save();

          Provider.of<Campaigns>(context, listen: false).put(
            Campaign(
              id: _formData['id'].toString(),
              nome: _formData['nome'].toString(),
              descricao: _formData['descricao'].toString(),
            ),
          );
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.save,
          color: defaultColor,
        ),
      ),
    );
  }
}
