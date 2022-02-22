import 'package:flutter/material.dart';
import 'package:random_fact/random_fact.dart';

void main() {
  runApp(const RandomFactApp());
}

class RandomFactApp extends StatefulWidget {
  const RandomFactApp({Key? key}) : super(key: key);

  @override
  _RandomFactAppState createState() => _RandomFactAppState();
}

class _RandomFactAppState extends State<RandomFactApp> {
  String rFact =
      "Polar bears do not jump on trampolines, even when given the opportunity.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Fact Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Random Facts"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 640,
              child: Text(
                rFact,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 64.0),
            ElevatedButton(
                onPressed: () async {
                  RandomFactResponse firstRandomFact = await getRandomFact();
                  setState(() => rFact = firstRandomFact.text);
                },
                child: const Text("New Random Fact"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green))),
          ],
        )),
      ),
      theme: ThemeData.dark(),
    );
  }

  @override
  void initState() {
    Future<RandomFactResponse> firstRandomFact = getRandomFact();
    firstRandomFact.then((value) => setState(
          () => rFact = value.text,
        ));
    super.initState();
  }
}
