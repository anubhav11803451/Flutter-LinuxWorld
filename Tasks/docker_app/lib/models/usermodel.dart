import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid, commandid;
  String name, email, commands, output;
  Timestamp accountCreated;

  UserModel({
    this.uid,
    this.commandid,
    this.name,
    this.email,
    this.accountCreated,
    this.commands,
    this.output,
  });

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot.documentID;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    accountCreated = documentSnapshot["accountCreated"];
    commands = documentSnapshot["commands"];
    output = documentSnapshot["output"];
  }
}
