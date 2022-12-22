class Contact {
  final int id;
  final String accountName;
  final int accountNumber;

  Contact(
    this.id, 
    this.accountName, 
    this.accountNumber
    );

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      map[kKeyId],
      map[kKeyName],
      map[kKeyAccountNumber],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      kKeyId: id,
      kKeyName: accountName,
      kKeyAccountNumber: accountNumber,
    };
  }

  Map<String, dynamic> toInsertMap() {
    return {
      kKeyName: accountName,
      kKeyAccountNumber: accountNumber,
    };
  }

  @override
  String toString() {
    return 'Contact{$kKeyId: $id, $kKeyName: $accountName, $kKeyAccountNumber: $accountNumber}';
  }

  static const String kKeyId = 'id';
  static const String kKeyName = 'name';
  static const String kKeyAccountNumber = 'account_number';
}

