import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PasswordsRecord extends FirestoreRecord {
  PasswordsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "site" field.
  String? _site;
  String get site => _site ?? '';
  bool hasSite() => _site != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "lastUsed" field.
  DateTime? _lastUsed;
  DateTime? get lastUsed => _lastUsed;
  bool hasLastUsed() => _lastUsed != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "change_password_link" field.
  String? _changePasswordLink;
  String get changePasswordLink => _changePasswordLink ?? '';
  bool hasChangePasswordLink() => _changePasswordLink != null;

  // "site_logo" field.
  String? _siteLogo;
  String get siteLogo => _siteLogo ?? '';
  bool hasSiteLogo() => _siteLogo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _site = snapshotData['site'] as String?;
    _username = snapshotData['username'] as String?;
    _password = snapshotData['password'] as String?;
    _lastUsed = snapshotData['lastUsed'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _changePasswordLink = snapshotData['change_password_link'] as String?;
    _siteLogo = snapshotData['site_logo'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('passwords')
          : FirebaseFirestore.instance.collectionGroup('passwords');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('passwords').doc(id);

  static Stream<PasswordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PasswordsRecord.fromSnapshot(s));

  static Future<PasswordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PasswordsRecord.fromSnapshot(s));

  static PasswordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PasswordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PasswordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PasswordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PasswordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PasswordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPasswordsRecordData({
  String? site,
  String? username,
  String? password,
  DateTime? lastUsed,
  DocumentReference? user,
  String? changePasswordLink,
  String? siteLogo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'site': site,
      'username': username,
      'password': password,
      'lastUsed': lastUsed,
      'user': user,
      'change_password_link': changePasswordLink,
      'site_logo': siteLogo,
    }.withoutNulls,
  );

  return firestoreData;
}

class PasswordsRecordDocumentEquality implements Equality<PasswordsRecord> {
  const PasswordsRecordDocumentEquality();

  @override
  bool equals(PasswordsRecord? e1, PasswordsRecord? e2) {
    return e1?.site == e2?.site &&
        e1?.username == e2?.username &&
        e1?.password == e2?.password &&
        e1?.lastUsed == e2?.lastUsed &&
        e1?.user == e2?.user &&
        e1?.changePasswordLink == e2?.changePasswordLink &&
        e1?.siteLogo == e2?.siteLogo;
  }

  @override
  int hash(PasswordsRecord? e) => const ListEquality().hash([
        e?.site,
        e?.username,
        e?.password,
        e?.lastUsed,
        e?.user,
        e?.changePasswordLink,
        e?.siteLogo
      ]);

  @override
  bool isValidKey(Object? o) => o is PasswordsRecord;
}
