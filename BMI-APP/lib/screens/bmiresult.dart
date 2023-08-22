import 'package:flutter/material.dart';

class BMIRESULT extends StatelessWidget {
  final double BMIval; // Define BMIval as a class member

  const BMIRESULT({Key? key, required this.BMIval}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              "THIS IS THE BMI :",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
            Text(
              "${BMIval.toString()}",
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 243, 33, 79)),
            )
          ],
        ),
      ),
    ));
  }
}
