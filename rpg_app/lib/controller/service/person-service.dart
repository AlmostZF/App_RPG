import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rpg_app/model/person_model.dart';

class PersonService {
  Future<Person> fetchPerson(Person person) async {
    var uri = Uri.parse(
        'https://stdrpg-default-rtdb.firebaseio.com/person/${person.id}.json');
    final response = await http.get(uri);

    return Person.fromJson(json.decode(response.body));
  }

  Future<List<Person>> fetchPersons() async {
    var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/person/json');
    final response = await http.get(uri);

    // List<dynamic> _list = json.decode(response.body);
    print(response.body);
    List<dynamic> _list = json.decode(response.body) as List<dynamic>;
    List<Person> _listPerson = [];

    // _list.forEach((person) {
    //   Person p = Person.fromJson(person);

    //   _listPerson.add(p);
    // });

    _list.forEach((person) {
      Person j = Person.fromJson(person);

      _listPerson.add(j);
    });

    return _listPerson;
  }
}
