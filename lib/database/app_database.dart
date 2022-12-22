import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contact.dart';

Future<Database> createDatabase(){
  //future acessa por meio do then
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'betybank.db');
    //Para a criação da tabela, usaremos a propriedade onCreate, que recebe uma função que tem como parâmetro um Database (no caso, db) e um inteiro que representa a versão (version). No corpo da função, a partir do db, poderemos executar algumas instruções referentes ao SQLite. Dentre elas, temos a db.execute()
    return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE contacts ('
      'id INTERGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)'
      );
    }, version: 1);
  });
}

//https://cursos.alura.com.br/course/flutter-persistencia-interna/task/65159
Future<int> save (Contact contact){
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll(){
  return createDatabase().then((db){
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for(Map<String, dynamic> map in maps){
        final Contact contact = Contact(
          map['id'], 
          map['accountName'], 
          map['accountNumber'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
