import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        // Set your primary color here
        primaryColor: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String _counter = '';
  double? result;
  double? firstNumber;
  double? secondNumber;
  String operation = '';

  void calculation(String method, String values) {
    if (method != '') {
      if (method == 'C') {
        _counter = '0';
        firstNumber = null;
        secondNumber = null;
        operation = '';
      } else {
        operation = method;
      }
    } else {
      if (firstNumber == null) {
        firstNumber = double.tryParse(values);
        if (firstNumber! % 1 == 0) {
          _counter = firstNumber!.toInt().toString();
        } else {
          _counter = firstNumber!.toString();
        }
      } else {
        secondNumber = double.tryParse(values);
        if (secondNumber! % 1 == 0) {
          _counter = secondNumber!.toInt().toString();
        } else {
          _counter = secondNumber!.toString();
        }
      }
    }

    if (firstNumber != null && secondNumber != null) {
      if (operation == '+') {
        result = (firstNumber! + secondNumber!);
      } else if (operation == '-') {
        result = (firstNumber! - secondNumber!);
      } else if (operation == 'X') {
        result = (firstNumber! * secondNumber!);
      } else if (operation == '/') {
        result = (firstNumber! / secondNumber!);
      } else if (operation == '=') {
        if (result! % 1 == 0) {
          _counter = result!.toInt().toString();
        } else {
          _counter = result!.toString();
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  _counter,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: 'C',
                  onPressed: () => calculation('C', ''),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '+/-',
                  onPressed: () => calculation('+/-', ''),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '%',
                  onPressed: () => calculation('%', ''),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '/',
                  onPressed: () => calculation('/', ''),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: '7',
                  onPressed: () => calculation('', '7'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '8',
                  onPressed: () => calculation('', '8'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '9',
                  onPressed: () => calculation('', '9'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: 'X',
                  onPressed: () => calculation('X', ''),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: '4',
                  onPressed: () => calculation('', '4'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '5',
                  onPressed: () => calculation('', '5'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '6',
                  onPressed: () => calculation('', '6'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '-',
                  onPressed: () => calculation('-', ''),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: '1',
                  onPressed: () => calculation('', '1'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '2',
                  onPressed: () => calculation('', '2'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '3',
                  onPressed: () => calculation('', '3'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '+',
                  onPressed: () => calculation('+', ''),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: '.',
                  onPressed: () => calculation('.', ''),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '0',
                  onPressed: () => calculation('', '0'),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '<',
                  onPressed: () => calculation('<', ''),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                  buttonText: '=',
                  onPressed: () => calculation('=', ''),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
