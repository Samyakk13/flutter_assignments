import 'package:dictionary/service/dictClient.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DictClient dClient = DictClient();
  TextEditingController tc = TextEditingController();
  String meaning = "";

  // @override
  // void initState(){
  //   super.initState();
  // }
  callAPI(q) async {
    dClient.searchForWord(query: q);
    meaning = await dClient.searchForWord(query: q);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("DICTIONARY APP"),
        centerTitle: true,
      ),
      body: SizedBox(
        // color: Colors.teal,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tc,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    suffixIcon: IconButton(
                        onPressed: () {
                          tc.clear();
                        },
                        icon: const Icon(Icons.clear)),
                    label: const Text("DICT"),
                    hintText: "Enter a Word Here"),
                onChanged: (string) {
                  print("This is the text from the textfield $string");
                },
                onEditingComplete: () {},
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  callAPI(tc.text);
                },
                child: const Text("SEARCH")),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 98, 118, 134),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Text(
                meaning,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
