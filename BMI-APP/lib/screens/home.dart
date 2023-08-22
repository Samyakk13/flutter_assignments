import 'package:bmi_app/screens/bmiresult.dart';
import 'package:flutter/material.dart';

class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({Key? key}) : super(key: key);

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

double calcBMI({double height = 0.0, double weight = 0.0}) {
  double heightInMeters = height / 100.0; // Convert height to meters
  double bmi = weight / (heightInMeters * heightInMeters);
  return bmi;
}

class _HOMEPAGEState extends State<HOMEPAGE> {
  double sliderValue = 100.0;
  double weightval = 0.0;
  int age = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: const Color.fromARGB(255, 77, 176, 242),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.male, size: 80, color: Colors.black),
                  Text(
                    "MALE",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 77, 176, 242),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.female, size: 80, color: Colors.black),
                  Text(
                    "FEMALE",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            color: Color.fromARGB(255, 91, 189, 235),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(children: [
              const Text("HEIGHT",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              Text("${sliderValue.toStringAsFixed(2)} cm",
                  style: const TextStyle(color: Colors.white, fontSize: 35)),
              Slider(
                min: 100.0,
                max: 250.0,
                value: sliderValue,
                onChanged: (value) {
                  sliderValue = value;
                  setState(() {});
                },
                activeColor: Color.fromARGB(255, 229, 1, 241),
                inactiveColor: Color.fromARGB(255, 37, 255, 233),
                thumbColor: Colors.black,
              )
            ]),
          ),
        ]),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            color: const Color.fromARGB(255, 247, 90, 142),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "WEIGHT",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text("${weightval.toStringAsFixed(2)} kg",
                    style: const TextStyle(color: Colors.white, fontSize: 35)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              weightval++;
                              setState(() {});
                            },
                            icon: const Icon(Icons.add))),
                    CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              weightval--;
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove))),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 247, 90, 142),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "AGE",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(age.toStringAsFixed(0),
                    style: const TextStyle(color: Colors.white, fontSize: 35)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              age++;
                              setState(() {});
                            },
                            icon: const Icon(Icons.add))),
                    CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              age--;
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove))),
                  ],
                ),
              ],
            ),
          ),
        ]),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        GestureDetector(
          onTap: () {
            double finalBMI = calcBMI(height: sliderValue, weight: weightval);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BMIRESULT(BMIval: finalBMI)));
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.85,
            color: Color.fromARGB(255, 255, 146, 57),
            child: Center(
                child: const Text(
              "CALCULATE BMI",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )
      ]),
    ));
  }
}
