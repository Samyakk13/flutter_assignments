// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HOMEPAGE extends StatefulWidget {
  String loginemail;

  HOMEPAGE({required this.loginemail, super.key});

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("This is home page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("this is login email ${widget.loginemail}"),
      ),
    ));
  }
}
