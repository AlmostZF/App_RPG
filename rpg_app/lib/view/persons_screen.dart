import 'package:flutter/material.dart';
import 'package:rpg_app/controller/service/person-service.dart';
import 'package:rpg_app/model/person_model.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  late Future<List<Person>> _futurePerson;
  PersonService _personService = new PersonService();

  @override
  void initState() {
    super.initState();

    _futurePerson = _personService.fetchPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
            child: FutureBuilder<List<Person>>(
                future: _futurePerson,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('none');
                    case ConnectionState.waiting:
                      return Text('Aguarde ...',
                          style: TextStyle(color: Colors.white, fontSize: 24));
                    default:
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return new Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text('${snapshot.data?[index].nome}',
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            );
                          });
                  }
                })),
      ),
    );
  }
}
