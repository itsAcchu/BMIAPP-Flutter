import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: bgColor,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                const Text(
                  "BMI Calculator",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 20),

                // Weight Input
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: "Enter weight in KG",
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    prefixIcon: const Icon(Icons.line_weight, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),

                // Height in Feet Input
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    labelText: "Enter height in FEET",
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    prefixIcon: const Icon(Icons.height, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),

                // Height in Inches Input
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    labelText: "Enter height in INCH",
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    prefixIcon: const Icon(Icons.height, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 25),

                // Calculate Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    var wt = wtController.text.trim();
                    var ft = ftController.text.trim();
                    var inc = inController.text.trim();

                    if (wt.isNotEmpty && ft.isNotEmpty && inc.isNotEmpty) {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInc = int.parse(inc);

                      var tInc = (ift * 12) + iInc;
                      var tCm = tInc * 2.54;
                      var tM = tCm / 100;

                      var bmi = iwt / (tM * tM);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are Overweight!";
                        bgColor = Colors.orange.shade300;
                      } else if (bmi < 18) {
                        msg = "You are Underweight!";
                        bgColor = Colors.red.shade300;
                      } else {
                        msg = "You are Healthy!";
                        bgColor = Colors.green.shade300;
                      }

                      setState(() {
                        result = "$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all fields!";
                      });
                    }
                  },
                  child: const Text("Calculate", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 25),

                // Result Text
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
