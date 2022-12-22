import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../models/contact.dart';

class ContactsForm extends StatefulWidget {
  const ContactsForm({super.key});

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full name',
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: 'Account number',
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              width: double.maxFinite,
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: (){
                final String name = _nameController.text;
                final int? number = int.tryParse(_numberController.text); 
                final Contact newContact =  Contact (0, name, number!);
                save(newContact).then((id) {
                  Navigator.pop(context);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ), 
              child: const Text('Creat'),
            )
          ],
        ),
      ),
    );
  }
}