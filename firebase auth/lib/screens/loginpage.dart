import 'package:firebase_demo2/screens/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../services/use_auth.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  final GlobalKey<FormFieldState> _formkey = GlobalKey();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  UserAuth firebaseAuth = UserAuth();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: emailcontroller,
                  decoration:
                      const InputDecoration(hintText: "ENTER YOUR EMAIL"),
                ),
                TextFormField(
                  controller: passcontroller,
                  decoration:
                      const InputDecoration(hintText: "ENTER YOUR PASSWORD"),
                ),
                OutlinedButton(
                    onPressed: () async {
                      // _formkey.currentState!.validate();
                      String loginemail = await firebaseAuth.loginuser(
                          loginemail: emailcontroller.text,
                          loginpass: passcontroller.text);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  HOMEPAGE(loginemail: loginemail)));
                    },
                    child: const Text("Login Now"))
              ],
            ),
          )),
    ));
  }
}
