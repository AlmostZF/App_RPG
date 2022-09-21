import 'package:flutter/material.dart';
import 'package:rpg_app/routes/approutes.dart';
import 'package:rpg_app/view/models/personagem.dart';

class PersonagemTile extends StatelessWidget {
  final Personagem personagem;
  const PersonagemTile(this.personagem);

  @override
  Widget build(BuildContext context) {
    final avatar = personagem.avatarUrl == null || personagem.avatarUrl.isEmpty
        ? CircleAvatar(
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
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PERSONAGEM_FORM,
                  arguments: personagem,
                );
              },
            ),
            IconButton(
              onPressed: () {},
              color: Colors.red,
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
