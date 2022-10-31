import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_app/controller/persons_controller.dart';
import 'package:rpg_app/routes/app_routes.dart';
import 'package:rpg_app/model/person_model.dart';

class PersomCard extends StatelessWidget {
  final Person person;
  const PersomCard(this.person);

  @override
  Widget build(BuildContext context) {
    final avatar = person.avatarUrl == null || person.avatarUrl.isEmpty
        ? Container(
            child: const CircleAvatar(
              child: Icon(
                Icons.person,
              ),
            ),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(person.avatarUrl),
          );
    return Card(
      color: Color(0xFF1C0D2E),
      child: ListTile(
        leading: avatar,
        title: Text(
          person.nome,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        textColor: Colors.white,
        subtitle: Text(
          "Classe: ${person.classe} | Raça: ${person.raca}",
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                color: const Color(0xFFFFFFFF),
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.PERSOM_FORM,
                    arguments: person,
                  );
                },
              ),
              IconButton(
                color: const Color(0xFFFFC62F),
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: const Color(0xFF432986),
                      title: const Text(
                        "Excluir personagem",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                        "Tem certeza?",
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFFC62F),
                          ),
                          child: const Text(
                            "Não",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFFC62F),
                          ),
                          child: const Text(
                            "Sim",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Provider.of<Persons>(context, listen: false)
                                .remove(person);
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
      ),
    );
  }
}
