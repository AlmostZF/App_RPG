import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/item_controller.dart';
import 'package:rpg_app/controller/service/storage_service.dart';
import 'package:rpg_app/style/colors.dart';

import '../model/Item_model.dart';

class ModalItem extends StatefulWidget {
  final Item item;
  const ModalItem(this.item);

  @override
  State<ModalItem> createState() => _ModalPageState(item);
}

class _ModalPageState extends State<ModalItem> {

    final Storage storage = Storage();
  File? imagemFinal;
  String path = "";
  String fileName = "";

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  bool isEdit = false;
  final Item item;
  _ModalPageState(this.item);


  void _loadFormData(Item item) {
    if (item != null) {
      id:
      _formData['id'] = item.id;
      nome:
      _formData['nome'] = item.nome;
      peso:
      _formData['peso'] = item.peso;
      alcance:
      _formData['alcance'] = item.alcance;
      dano:
      _formData['dano'] = item.dano;
      resistencia:
      _formData['resistencia'] = item.resistencia;
      preco:
      _formData['preco'] = item.preco;
       itemUrl:
      _formData['itemUrl'] = item.itemUrl;
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: isEdit
        ? const Text("Criar Item")
        : const Text('Adicionar Item'),
        backgroundColor: secondColor,
        foregroundColor: colorFist,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: EdgeInsets.only(top: size.width * .25),
            child: Column(
              children: [
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
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: defaultColor),
                              ),
                              labelText: "Nome do Item"),
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
                          child: imagemFinal == null 
                          ?GestureDetector(
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: defaultColor,
                              size: size.width * .08,
                            ),
                            onTap: () => {
                            pegarImagemGaleria()
                            },
                          )
                          :ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Center(
                          child: Container(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            decoration:BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(imagemFinal!),
                                fit: BoxFit.cover,
                              )
                            ),
                            ),
                        )
                        )
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
                      initialValue: _formData['peso'],
                      onSaved: (value) =>
                          _formData['peso'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defaultColor),
                          ),
                          labelText: "peso"),
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
                      onSaved: (value) => _formData['alcance'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defaultColor),
                          ),
                          labelText: "Alcance"),
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
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defaultColor),
                          ),
                          labelText: "Dano"),
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
                      initialValue: _formData['resistencia'],
                      onSaved: (value) => _formData['resistencia'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defaultColor),
                          ),
                          labelText: "Resistencia"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child:SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.06,
                    child: TextFormField(
                      style: const TextStyle(
                        color: otherColor,
                      ),
                      initialValue: _formData['preco'],
                      onSaved: (value) => _formData['preco'] = value.toString(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: defaultColor),
                          ),
                          labelText: "Preço"),
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
                          onPressed: () async {
                            _form.currentState?.save();
                            await storage.uploadFile(path, fileName);
                             dynamic download = await storage.downloadURL(fileName);
                            Provider.of<Items>(context, listen: false).put(
                              Item(
                                id: _formData['id'].toString(),
                                nome: _formData['nome'].toString(),
                                peso: _formData['peso'].toString(),
                                alcance: _formData['alcance'].toString(),
                                dano: _formData['dano'].toString(),
                                resistencia: _formData['resistencia'].toString(),
                                preco: _formData['preco'].toString(),
                                itemUrl: download.toString(),
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
                        child:  ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(secondColor)),
                            onPressed: () {
                              Navigator.of(context).pop();
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
     pegarImagemGaleria() async {
    final imagem = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );

    if (imagem == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nenhum arquivo selecionado")));
      return null;
    }

    setState(() {
      path = imagem.files.single.path!;
      fileName = imagem.files.single.name;
      imagemFinal = File(path);
    });

    //convert bytes to base64 string
  }
}
