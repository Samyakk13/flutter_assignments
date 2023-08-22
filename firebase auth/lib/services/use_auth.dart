import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  FirebaseFirestore firestoredb = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  registeruser(
      {required String firstname,
      required String lastname,
      required String regphone,
      required String regemail,
      required String regpass}) async {
    UserCredential usercreds = await _auth.createUserWithEmailAndPassword(
        email: regemail, password: regpass);
    storeuserdatainfirestore(
        firstname: firstname,
        lastname: lastname,
        phone: regphone,
        firestoreemail: regemail,
        firestorepass: regpass);

    return usercreds.user!.email;
  }

  loginuser({required String loginemail, required String loginpass}) async {
    UserCredential logincreds = await _auth.signInWithEmailAndPassword(
        email: loginemail, password: loginpass);
    if (logincreds.user != null) {
      print("login successs");
      return logincreds.user!.email;
    }
  }

  storeuserdatainfirestore(
      {required String firstname,
      required String lastname,
      required String phone,
      required String firestoreemail,
      required String firestorepass}) async {
    Map<String, dynamic> userdatamap = {
      'fname': firstname,
      'lname': lastname,
      'phone number': phone,
      'email': firestoreemail,
      'password': firestorepass
    };
    await firestoredb
        .collection('userdata')
        .doc(firestoreemail)
        .set(userdatamap)
        .whenComplete(() {
      print("user data is successfully added to database");
    });
  }
}
