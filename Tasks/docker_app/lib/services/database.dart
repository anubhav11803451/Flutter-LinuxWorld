import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docker_app/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final Firestore _firestore = Firestore.instance;

  Future<bool> createNewuser(UserModel user) async {
    try {
      await _firestore.collection('users').document(user.uid).setData({
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection('users').document(uid).get();
      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> saveCommands(UserModel user) async {
    var cuser = await FirebaseAuth.instance.currentUser();
    var uid = cuser.uid;
    try {
      await _firestore
          .collection('users')
          .document(uid)
          .collection('commands')
          .document(user.commandid)
          .setData({
        'commands': user.commands,
        'output': user.output,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
