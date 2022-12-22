import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contact.dart';

const String _kNameDataBase = 'betybank.db';
const String kNameTableContact = 'contacts';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, _kNameDataBase);
  //Para a criação da tabela, usaremos a propriedade onCreate, que recebe uma função que tem como parâmetro um Database (no caso, db) e um inteiro que representa a versão (version). No corpo da função, a partir do db, poderemos executar algumas instruções referentes ao SQLite. Dentre elas, temos a db.execute()
  return await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE $kNameTableContact ('
        '${Contact.kKeyId} INTEGER PRIMARY KEY AUTOINCREMENT, '
        '${Contact.kKeyName} TEXT, '
        '${Contact.kKeyAccountNumber} INTEGER)',
      );
    },
    version: 1,
  );
}

//https://cursos.alura.com.br/course/flutter-persistencia-interna/task/65159
Future<int> save(Contact contact) async {
  final Database db = await createDatabase();
  final Map<String, dynamic> contactMap = contact.toInsertMap();
  return await db.insert(kNameTableContact, contactMap);
}

Future<List<Contact>> findAll() async {
  final Database db = await createDatabase();
  final List<Map<String, Object?>> mapContacts = await db.query(kNameTableContact);
  final List<Contact> contacts = [];
  for (Map<String, dynamic> map in mapContacts) {
    final Contact contact = Contact.fromMap(map);
    contacts.add(contact);
  }
  return contacts;
}
