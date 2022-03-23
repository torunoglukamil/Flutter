import 'package:flutter/material.dart';

import '../models/person_model.dart';

class PersonData extends ChangeNotifier {
  PersonModel person = PersonModel(
    name: "Mehmet Kamil",
    surname: "Torunoğlu",
  );

  updatePerson(String _name, String _surname) {
    if (_name.isNotEmpty && _surname.isNotEmpty) {
      person = PersonModel(name: _name, surname: _surname);
      notifyListeners();
    }
  }
}
