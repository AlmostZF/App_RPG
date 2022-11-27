import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/power_controller.dart';
import 'package:rpg_app/model/power_model.dart';
import 'package:rpg_app/style/colors.dart';

class ModalPoder extends StatefulWidget {
  final Power power;
  const ModalPoder(this.power);

  @override
  State<ModalPoder> createState() => _ModalPageState(power);
}

class _ModalPageState extends State<ModalPoder> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  bool isEdit = false;
  final Power power;
  _ModalPageState(this.power);

  void _loadFormData(Power power) {
    if (power != null) {
      id:
      _formData['id'] = power.id;
      nome:
      _formData['nome'] = power.nome;
      tempoconjuracao:
      _formData['tempoconjuracao'] = power.tempoconjuracao;
      alcance:
      _formData['alcance'] = power.alcance;
      duracao:
      _formData['duracao'] = power.duracao;
      mana:
      _formData['mana'] = power.mana;
      dano:
      _formData['dano'] = power.dano;
      componente:
      _formData['componente'] = power.componente;
      nivel:
      _formData['nivel'] = power.nivel;
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      final power = ModalRoute.of(context)?.settings.arguments as Power;
      isEdit = true;
      _loadFormData(power);
    } catch (e) {
      print(e);
    }
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.width * 0.15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                isEdit
                    ? const Text('Editar poder',
                        style: TextStyle(
                            color: otherColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                    : const Text('Adicionar poder',
                        style: TextStyle(
                            color: otherColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.3, top: size.width * 0.03)),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: size.width * 0.2, top: size.width * 0.03),
                      child: SizedBox(
                        width: size.width * 0.46,
                        height: size.height * 0.06,
                        child: TextFormField(
                          style: const TextStyle(
                            color: otherColor,
                          ),
                          initialValue: _formData['nome'],
                          onSaved: (value) =>
                              _formData['nome'] = value.toString(),
                          decoration: const InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Nome do Poder"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.5,
                        bottom: size.width * 0.02,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          color: otherColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.03,
                  ),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['tempoconjuracao'],
                      onSaved: (value) =>
                          _formData['tempoconjuracao'] = value.toString(),
                      decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Tempo de Conjuração"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['alcance'],
                      onSaved: (value) =>
                          _formData['alcance'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Alcance"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['duracao'],
                      onSaved: (value) =>
                          _formData['duracao'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Duração"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['mana'],
                      onSaved: (value) => _formData['mana'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Mana"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['dano'],
                      onSaved: (value) => _formData['dano'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Dano"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['componente'],
                      onSaved: (value) =>
                          _formData['componente'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Componente"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['nivel'],
                      onSaved: (value) => _formData['nivel'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nivel"),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size.height * 0.1),
                      child: SizedBox(
                        width: size.width * 0.25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondColor)),
                          onPressed: () {
                            _form.currentState?.save();
                            Provider.of<Powers>(context, listen: false).put(
                              Power(
                                id: _formData['id'].toString(),
                                nome: _formData['nome'].toString(),
                                tempoconjuracao:
                                    _formData['tempoconjuracao'].toString(),
                                alcance: _formData['alcance'].toString(),
                                duracao: _formData['duracao'].toString(),
                                mana: _formData['mana'].toString(),
                                dano: _formData['dano'].toString(),
                                componente: _formData['componente'].toString(),
                                nivel: _formData['nivel'].toString(),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          child: isEdit
                              ? const Text(
                                  "Salvar",
                                  style: TextStyle(
                                    color: colorFist,
                                  ),
                                )
                              : const Text(
                                  "Criar",
                                  style: TextStyle(
                                    color: colorFist,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.height * 0.05),
                      child: SizedBox(
                        width: size.width * 0.25,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(secondColor)),
                            onPressed: () {
                              //Navigator.of(context).pushNamed(AppRoutes.battleScreen);
                            },
                            child: const Text("Cancelar",
                                style: TextStyle(
                                  color: colorFist,
                                ))),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
