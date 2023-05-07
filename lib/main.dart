import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    title: "My Calculator",
  ));
}

//Stateful is a abstract class
//MyApp will handle the state
class MyApp extends StatefulWidget {
  //Create a property inside this MyApp class
  final String title;

  //add parameter inside the constructor
  const MyApp({super.key, required this.title});

  //handle the entire state of the stateful widget
  @override
  //state class is not the data that we wanted to change on the screen
  State<MyApp> createState() => _MyAppState(); //manage the MyApp class
}

class _MyAppState extends State<MyApp> {
  TextEditingController valueOneController = TextEditingController();
  TextEditingController valueTwoController = TextEditingController();

  String? operator;
  double? result;

  String? error;

  calculate() {
    print("Calculate method is pressed");

    if (valueOneController.text.isEmpty || valueTwoController.text.isEmpty) {
      print("enter both the values");
      error = "Enter both the values";
      setState(() {});
      return; //terminate the function
    }

    double valueOne = double.parse(valueOneController.text);
    double valueTwo = double.parse(valueTwoController.text);

    switch (operator) {
      case "+":
        result = valueOne + valueTwo;
        error = "";
        break;
      case "-":
        result = valueOne - valueTwo;
        error = "";
        break;
      case "*":
        result = valueOne * valueTwo;
        error = "";
        break;
      case "/":
        result = valueOne / valueTwo;
        error = "";
        break;

      default:
        error = "Please select one operator";
        print("invalid value");
    }
    setState(() {}); //rebuild the build method
    print("Result: $result");
  }

  //pass build context as the positional parameter
  @override
  //whenever click hot reload, build method is executed
  build(BuildContext context) {
    //memory optimize application
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          //Column widget
          child: Column(
            children: [
              //TextField widgets
              TextField(
                //controller will keep the latest changes
                onChanged: (value) {
                  //rebuild the UI whenever the data changes inside the text field
                  setState(() {});
                },
                controller: valueOneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  //decoration property
                  hintText: "Enter Value 1", //hint property
                  border: OutlineInputBorder(), //border property
                ),
              ),
              //SizedBox widget
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  //rebuild the UI whenever the data changes inside the text field
                  setState(() {});
                },
                controller: valueTwoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter Value 2",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //children property that can add multiple widgets
                children: [
                  GestureDetector(
                    onTap: () {
                      operator = '+';
                      setState(() {});
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: operator == "+" ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // MaterialButton(
                  //   onPressed: () {
                  //     operator = "+";
                  //   },
                  //   color: Colors.blue,
                  //   child: const Text(
                  //     "+",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      operator = '-';
                      setState(() {});
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: operator == "-" ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "-",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // MaterialButton(
                  //   onPressed: () {
                  //     operator = "-";
                  //   },
                  //   color: Colors.blue,
                  //   child: const Text(
                  //     "-",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      operator = '*';
                      setState(() {});
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: operator == "*" ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "*",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // MaterialButton(
                  //   onPressed: () {
                  //     operator = "*";
                  //   },
                  //   color: Colors.blue,
                  //   child: const Text(
                  //     "*",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      operator = '/';
                      setState(() {});
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: operator == "/" ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "/",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  // MaterialButton(
                  //   onPressed: () {
                  //     operator = "/";
                  //   },
                  //   color: Colors.blue,
                  //   child: const Text(
                  //     "/",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  calculate();
                },
                child: Container(
                  // container mean custom
                  //custom widget
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: valueOneController.text.isEmpty ||
                            valueTwoController.text.isEmpty
                        ? Colors.grey
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // MaterialButton(
              //   onPressed: () {
              //     calculate();
              //   },
              //   color: Colors.blue,
              //   child: const Text(
              //     "Calculate",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              if (result != null)
                Text(
                  result.toString(),
                  style: const TextStyle(color: Colors.red, fontSize: 25),
                ),
              if (error != null)
                Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.red, fontSize: 25),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
