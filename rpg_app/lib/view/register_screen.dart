import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/model/person_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;

  int _currentstep = 0;
  StepperType stepperType = StepperType.vertical;

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Person person) {
    if (person != null) {
      id:
      _formData['id'] = person.id;
      nome:
      _formData['nome'] = person.nome;
      jogador:
      _formData['jogador'] = person.jogador;
      raca:
      _formData['raca'] = person.raca;
      classe:
      _formData['classe'] = person.classe;
      nivel:
      _formData['nivel'] = person.nivel;
      historia:
      _formData['historia'] = person.historia;
      ideais:
      _formData['ideais'] = person.ideais;
      forca:
      _formData['forca'] = person.forca;
      destreza:
      _formData['destreza'] = person.destreza;
      constituicao:
      _formData['constituicao'] = person.constituicao;
      inteligencia:
      _formData['inteligencia'] = person.inteligencia;
      sabedoria:
      _formData['sabedoria'] = person.sabedoria;
      carisma:
      _formData['carisma'] = person.carisma;
      vida:
      _formData['vida'] = person.vida;
      mana:
      _formData['mana'] = person.mana;
      avatarUrl:
      _formData['avatarUrl'] = person.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      final person = ModalRoute.of(context)?.settings.arguments as Person;
      _loadFormData(person);
    } catch (e){
      print(e);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar personagem"),
        backgroundColor: const Color(0xFF432986),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _form.currentState?.save();

              Provider.of<Persons>(context, listen: false).put(
                Person(
                  id: _formData['id'].toString(),
                  nome: _formData['nome'].toString(),
                  jogador: _formData['jogador'].toString(),
                  raca: _formData['raca'].toString(),
                  classe: _formData['classe'].toString(),
                  nivel: _formData['nivel'].toString(),
                  historia: _formData['historia'].toString(),
                  ideais: _formData['ideais'].toString(),
                  forca: _formData['forca'].toString(),
                  destreza: _formData['destreza'].toString(),
                  constituicao: _formData['constituicao'].toString(),
                  inteligencia: _formData['inteligencia'].toString(),
                  sabedoria: _formData['sabedoria'].toString(),
                  carisma: _formData['carisma'].toString(),
                  vida: _formData['vida'].toString(),
                  mana: _formData['mana'].toString(),
                  avatarUrl: _formData['avatarUrl'].toString(),
                ),
              );

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: Row(
          children: [
            Expanded(
              child: Stepper(
                physics: const ClampingScrollPhysics(),
                type: stepperType,
                steps: _mySteps(),
                currentStep: _currentstep,
                onStepTapped: (step) {
                  setState(() {
                    _currentstep = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (_currentstep < _mySteps().length - 1) {
                      _currentstep = _currentstep + 1;
                    } else {
                      // if everything is completed
                      print('completed, check field');
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (_currentstep > 0) {
                      _currentstep = _currentstep - 1;
                    } else {
                      _currentstep = 0;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  pegarImagemGaleria() async {
    final PickedFile? imagemTemporaria =
        // ignore: deprecated_member_use
        await imagePicker.getImage(source: ImageSource.gallery);
    if (imagemTemporaria != null) {
      setState(() {
        imagemSelecionada = File(imagemTemporaria.path);
      });
    }
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
          title: Text(
            _currentstep == 0 ? "Características" : "",
            style: const TextStyle(color: Colors.white),
          ),
          content: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade200),
                    child: Center(
                      child: imagemSelecionada == null
                          ? GestureDetector(
                              onTap: () {
                                pegarImagemGaleria();
                              },
                              child: const CircleAvatar(
                                child: Icon(Icons.add_photo_alternate_outlined),
                                radius: 150.0,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(imagemSelecionada!),
                              radius: 150.0,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: _formData['nome'],
                      decoration: const InputDecoration(
                        hintText: "Nome",
                        fillColor: Colors.white,
                      ),
                      onSaved: (value) => _formData['nome'] = value.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: _formData['jogador'],
                      decoration: const InputDecoration(hintText: "Jogador"),
                      onSaved: (value) =>
                          _formData['jogador'] = value.toString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: _formData['raca'],
                      decoration: const InputDecoration(
                        hintText: "Raça",
                      ),
                      onSaved: (value) => _formData['raca'] = value.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: _formData['classe'],
                      decoration: const InputDecoration(hintText: "Classe"),
                      onSaved: (value) =>
                          _formData['classe'] = value.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      initialValue: _formData['nivel'],
                      decoration: const InputDecoration(hintText: "Nível"),
                      onSaved: (value) => _formData['nivel'] = value.toString(),
                    ),
                  ),
                ],
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(
                  hintText: "Avatar URL",
                ),
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['historia'],
                maxLines: 4,
                decoration: const InputDecoration(hintText: "História"),
                onSaved: (value) => _formData['historia'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['ideais'],
                decoration: const InputDecoration(hintText: "Ideais"),
                onSaved: (value) => _formData['ideais'] = value.toString(),
              ),
            ],
          ),
          isActive: _currentstep >= 0,
          state: _currentstep == 0 ? StepState.editing : StepState.complete),
      Step(
          title: Text(
            _currentstep == 1 ? "Atributos" : '',
            style: const TextStyle(color: Colors.white),
          ),
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['forca'],
                      decoration: const InputDecoration(
                        hintText: "Força",
                      ),
                      onSaved: (value) => _formData['forca'] = value.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['destreza'],
                      decoration: const InputDecoration(hintText: "Destreza"),
                      onSaved: (value) =>
                          _formData['destreza'] = value.toString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['constituicao'],
                      decoration: const InputDecoration(
                        hintText: "Constituição",
                      ),
                      onSaved: (value) =>
                          _formData['constituicao'] = value.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['inteligencia'],
                      decoration:
                          const InputDecoration(hintText: "Inteligência"),
                      onSaved: (value) =>
                          _formData['inteligencia'] = value.toString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['sabedoria'],
                      decoration: const InputDecoration(
                        hintText: "Sabedoria",
                      ),
                      onSaved: (value) =>
                          _formData['sabedoria'] = value.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['carisma'],
                      decoration: const InputDecoration(hintText: "Carisma"),
                      onSaved: (value) =>
                          _formData['carisma'] = value.toString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          isActive: _currentstep >= 1,
          state: _currentstep == 1 ? StepState.editing : StepState.complete),
      Step(
          title: Text(
            _currentstep == 2 ? "Pontos" : "",
            style: const TextStyle(color: Colors.white),
          ),
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['vida'],
                      decoration: const InputDecoration(
                        hintText: "Vida",
                      ),
                      onSaved: (value) => _formData['vida'] = value.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['mana'],
                      decoration: const InputDecoration(hintText: "Mana"),
                      onSaved: (value) => _formData['mana'] = value.toString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          isActive: _currentstep >= 2,
          state: _currentstep == 2 ? StepState.editing : StepState.complete),
      Step(
          title: Text(
            _currentstep == 3 ? "Habilidades" : "",
            style: const TextStyle(color: Colors.white),
          ),
          content: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Nome"),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Dano / Defesa",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Bônus"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Nome"),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Dano / Defesa",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Bônus"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Nome"),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Dano / Defesa",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "Bônus"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          isActive: _currentstep >= 3,
          state: _currentstep == 3 ? StepState.editing : StepState.complete),
    ];
    return _steps;
  }
}