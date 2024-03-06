import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchesController = TextEditingController();

  var result = "";

  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 104, 173, 253),
        title: const Center(
            child: Text(
          'BMI Calculator',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Body Mass Index",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/bmi-logo.png'),
                      width: 200,
                      height: 200,
                    ),
                  ),
                  TextField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      label: Text("Enter your weight in kg"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: feetController,
                    decoration: const InputDecoration(
                      label: Text("Enter your height in Feets"),
                      prefixIcon: Icon(Icons.height_rounded),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: inchesController,
                    decoration: const InputDecoration(
                        label: Text("Enter your height in Inches"),
                        prefixIcon: Icon(Icons.height_rounded)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        var weight = weightController.text.toString();
                        var feet = feetController.text.toString();
                        var inches = inchesController.text.toString();

                        if (weight != "" && feet != "" && inches != "") {
                          // i is use for integer
                          var iweight = int.parse(weight);
                          var ifeet = int.parse(feet);
                          var iinches = int.parse(inches);

                          // t is use for total
                          var tinches = (ifeet * 12) + iinches;

                          var tcm = tinches * 2.54;

                          // tm is total height in meter
                          var tm = tcm / 100;

                          var bmi = iweight / (tm * tm);

                          var msg = "";

                          if (bmi > 25) {
                            msg = "You are over Weight 😔";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You are Under Weight 😳";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You are Healthy, Yahooo! 😊";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                "$msg \n    Your BMI is : ${bmi.toStringAsFixed(1)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required fields!";
                          });
                        }
                      },
                      child: const Text("Calculate")),
                  const SizedBox(height: 20),
                  Text(
                    result,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
