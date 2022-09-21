import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rpg_app/view/personagemListPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;

  int _currentstep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastrar personagem"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        body: Row(
          children: [
            Expanded(
              child: Stepper(
                physics: ClampingScrollPhysics(),
                type: stepperType,
                steps: _mySteps(),
                currentStep: this._currentstep,
                onStepTapped: (step) {
                  setState(() {
                    this._currentstep = step;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    if (this._currentstep < this._mySteps().length - 1) {
                      this._currentstep = this._currentstep + 1;
                    } else {
                      // if everything is completed
                      print('completed, check field');
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this._currentstep > 0) {
                      this._currentstep = this._currentstep - 1;
                    } else {
                      this._currentstep = 0;
                    }
                  });
                },
              ),
            ),
          ],
        ));
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
          title: Text(_currentstep == 0 ? "Características" : ""),
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
                              child: CircleAvatar(
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
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Nome",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Jogador"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Raça",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Classe"),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    flex: 1,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Nível"),
                    ),
                  ),
                ],
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(hintText: "História"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Ideais"),
              ),
            ],
          ),
          isActive: _currentstep >= 0,
          state: _currentstep == 0 ? StepState.editing : StepState.complete),
      Step(
          title: Text(_currentstep == 1 ? "Atributos" : ''),
          content: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Força",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Destreza"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Constituição",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Inteligência"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Sabedoria",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Carisma"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          isActive: _currentstep >= 1,
          state: _currentstep == 1 ? StepState.editing : StepState.complete),
      Step(
          title: Text(_currentstep == 2 ? "Pontos" : ""),
          content: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Vida",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Mana"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          isActive: _currentstep >= 2,
          state: _currentstep == 2 ? StepState.editing : StepState.complete),
      Step(
          title: Text(_currentstep == 3 ? "Habilidades" : ""),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Nome"),
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Dano / Defesa",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    flex: 1,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Bônus"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Nome"),
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Dano / Defesa",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    flex: 1,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Bônus"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Nome"),
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Dano / Defesa",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    flex: 1,
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(hintText: "Bônus"),
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
