import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  //pour le validator des champs
  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();
    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formKey, // Pour le validator
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom conférence',
                    hintText: 'Entre le nom de la conférence',
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce texte";
                    }
                    return null;
                  },
                  controller: confNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nom du speaker',
                      hintText: 'Entre le nom du speaker',
                      border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce texte";
                    }
                    return null;
                  },
                  controller: speakerNameController,
                ),
              ),
              //SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value: 'talk', child: Text("Talk show")),
                      DropdownMenuItem(value: 'demo', child: Text("Démo code")),
                      DropdownMenuItem(value: 'partner', child: Text("Partner"))
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                    value: selectedConfType,
                    onChanged: (value) {
                      setState(() {
                        selectedConfType = value!;
                      });
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Choisir une date',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedConfDate = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      // Pour le validator
                      if (_formKey.currentState!.validate()){

                        //Récupérer la valeur des champs
                        final confName = confNameController.text;
                        final speakerName = speakerNameController.text;

                        //Afficher un message temporaire
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envoi en cours..."))
                        );
                        //Pour fermer le clavier
                        FocusScope.of(context).requestFocus(FocusNode());

                        /*print("Ajout de la conf $confName par le speaker $speakerName");
                        print("type de conférence $selectedConfType");
                        print("date : $selectedConfDate");*/

                        //Ajout dans la BDD
                        CollectionReference eventsRef = FirebaseFirestore.instance.collection("Events");
                        eventsRef.add({
                          'speaker': speakerName,
                          'date': selectedConfDate,
                          'subject': confName,
                          'type': selectedConfType,
                          'avatar': 'lior'
                        });
                        
                      }
                    },
                    child: const Text("Envoyer")
                ),
              )
            ],
          )
      ),
    );
  }
}

