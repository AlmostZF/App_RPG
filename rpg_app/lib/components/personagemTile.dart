import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/provider/personagens.dart';
import 'package:rpg_app/routes/approutes.dart';
import 'package:rpg_app/view/models/personagem.dart';

class PersonagemTile extends StatelessWidget {
  final Personagem personagem;
  const PersonagemTile(this.personagem);

  @override
  Widget build(BuildContext context) {
    final avatar = personagem.avatarUrl == null || personagem.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(
              Icons.person,
            ),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(personagem.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(personagem.nome),
      subtitle:
          Text("Classe: ${personagem.classe} | Raça: ${personagem.raca} "),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              color: Colors.orange,
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PERSONAGEM_FORM,
                  arguments: personagem,
                );
              },
            ),
            IconButton(
              color: Colors.red,
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Excluir personagem"),
                    content: const Text("Tem certeza?"),
                    actions: [
                      ElevatedButton(
                        child: const Text("Não"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: const Text("Sim"),
                        onPressed: () {
                          Provider.of<Personagens>(context, listen: false)
                              .remove(personagem);
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
    );
  }
}
