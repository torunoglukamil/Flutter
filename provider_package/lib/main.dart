import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/person_data.dart';
import 'models/person_model.dart';

void main() {
  runApp(ChangeNotifierProvider<PersonData>(
    create: (BuildContext context) => PersonData(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController tecName = TextEditingController();
    TextEditingController tecSurname = TextEditingController();

    PersonData personData = Provider.of<PersonData>(context);
    PersonModel person = personData.person;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                person.name + " " + person.surname,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: tecName,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              TextFormField(
                controller: tecSurname,
                decoration: const InputDecoration(hintText: "Surname"),
              ),
              FloatingActionButton.extended(
                onPressed: () =>
                    // personData.updatePerson(tecName.text, tecSurname.text),
                    Provider.of<PersonData>(context, listen: false)
                        .updatePerson(tecName.text, tecSurname.text),
                label: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
