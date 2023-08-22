import 'package:firebase_demo2/screens/loginpage.dart';
import 'package:firebase_demo2/services/use_auth.dart';
import 'package:flutter/material.dart';

class REGISTER extends StatefulWidget {
  const REGISTER({super.key});

  @override
  State<REGISTER> createState() => _REGISTERState();
}

class _REGISTERState extends State<REGISTER> {
  final GlobalKey<FormFieldState> _formkey = GlobalKey();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
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
                  controller: firstnamecontroller,
                  decoration:
                      const InputDecoration(hintText: "ENTER YOUR FIRST NAME"),
                ),
                TextFormField(
                  controller: lastnamecontroller,
                  decoration:
                      const InputDecoration(hintText: "ENTER YOUR LAST NAME"),
                ),
                TextFormField(
                  controller: phonecontroller,
                  decoration:
                      const InputDecoration(hintText: "ENTER YOUR PHONE NO"),
                  validator: (phone) {
                    if (phone!.length != 10) {
                      return "Enter a valid Phone Number";
                    } else {
                      return null;
                    }
                  },
                ),
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
                      String useremail = await firebaseAuth.registeruser(
                          firstname: firstnamecontroller.text,
                          lastname: lastnamecontroller.text,
                          regphone: phonecontroller.text,
                          regemail: emailcontroller.text,
                          regpass: passcontroller.text);

                      print(
                          "the user is successfuly register with given email: $useremail");
                    },
                    child: const Text("Register Now")),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LOGIN()));
                    },
                    child: const Text("Go to login page"))
              ],
            ),
          )),
    ));
  }
}
