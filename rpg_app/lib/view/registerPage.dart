// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rpg_app/view/characterPage.dart';

void main() => runApp(const RegisterPage());

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ImagePicker imagePicker = ImagePicker();
  File? imagemSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar personagem"),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CharacterPage()));
          },
        ),
      ),
      body: Scrollbar(
        thickness: 10,
        radius: const Radius.circular(10),
        child: ListView.builder(
          itemCount: 1, // Don't forget this line
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Personagem",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 190.0,
                //   width: 190.0,
                //   decoration: BoxDecoration(
                //       shape: BoxShape.circle, color: Colors.grey.shade200),
                //   child: Center(
                //     child: imagemSelecionada == null
                //         ? const Text("Nenhuma imagem selecionada",
                //             style: TextStyle(fontSize: 20))
                //         : CircleAvatar(
                //             backgroundImage: FileImage(imagemSelecionada!),
                //             radius: 190.0,
                //             //
                //           ),
                //   ),
                // ),
                // Row(
                //   children: [
                //     const Center(
                //       child: Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Text(
                //           "Adicione a foto de perfil",
                //           style: TextStyle(color: Colors.black, fontSize: 18),
                //         ),
                //       ),
                //     ),
                //     Center(
                //       child: IconButton(
                //         onPressed: () {
                //           pegarImagemGaleria();
                //         },
                //         icon: const Icon(Icons.add_photo_alternate_outlined),
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Expanded(
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
                        child: TextField(
                          // controller: _controller,
                          decoration: InputDecoration(hintText: "Jogador"),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(hintText: "Histórico"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Atributos",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 190.0,
                //   width: 190.0,
                //   decoration: BoxDecoration(
                //       shape: BoxShape.circle, color: Colors.grey.shade200),
                //   child: Center(
                //     child: imagemSelecionada == null
                //         ? const Text("Nenhuma imagem selecionada",
                //             style: TextStyle(fontSize: 20))
                //         : CircleAvatar(
                //             backgroundImage: FileImage(imagemSelecionada!),
                //             radius: 190.0,
                //             //
                //           ),
                //   ),
                // ),
                // Row(
                //   children: [
                //     const Center(
                //       child: Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Text(
                //           "Adicione a foto de perfil",
                //           style: TextStyle(color: Colors.black, fontSize: 18),
                //         ),
                //       ),
                //     ),
                //     Center(
                //       child: IconButton(
                //         onPressed: () {
                //           pegarImagemGaleria();
                //         },
                //         icon: const Icon(Icons.add_photo_alternate_outlined),
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                          decoration: InputDecoration(hintText: "Agilidade"),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          // controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Inteligencia",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Expanded(
                        child: TextField(
                          // controller: _controller,
                          decoration: InputDecoration(hintText: "Vontade"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Pontos",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Habilidades",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Nome"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Nome"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Nome"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                          },
                          child: const Text(
                            "CADASTRAR",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
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
}
