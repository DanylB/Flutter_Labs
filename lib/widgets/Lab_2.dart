import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lab_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lab 2'),
          centerTitle: true,
          elevation: 1,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var inputDollarField = TextEditingController(text: '0');
  var inputEuroField = TextEditingController(text: '0');
  var inputRubField = TextEditingController(text: '0');
  var outputDollarField = TextEditingController();
  var outputEuroField = TextEditingController();

  void calcCourse() {
    double getCourseDollar = double.parse(inputDollarField.text);
    double getCourseEuro = double.parse(inputEuroField.text);
    double getRub = double.parse(inputRubField.text);

    double outDollar = getCourseDollar * getRub;
    double outEuro = getCourseEuro * getRub;

    outputDollarField.text = outDollar.toString();
    outputEuroField.text = outEuro.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildTextField(
                  myController: inputDollarField,
                  myLabelText: 'Введите текущий курс доллара',
                  icon: Icon(Icons.attach_money),
                ),
                SizedBox(width: 50),
                BuildTextField(
                  myController: inputEuroField,
                  myLabelText: 'Введите текущий курс евро',
                  icon: Icon(Icons.euro),
                ),
              ],
            ),
            SizedBox(height: 50),
            BuildTextField(
              myController: inputRubField,
              myLabelText: 'Введите денежную сумму в гривнах',
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildTextField(
                  myController: outputDollarField,
                  myLabelText: 'Сумма в  долларах',
                  icon: Icon(Icons.attach_money),
                ),
                SizedBox(width: 50),
                BuildTextField(
                  myController: outputEuroField,
                  myLabelText: 'Сумма в  евро',
                  icon: Icon(Icons.euro),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => calcCourse(),
              child: Text('Подсчитать эквивалент'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  final myController;
  final myLabelText;
  final icon;

  const BuildTextField({
    required this.myController,
    required this.myLabelText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        controller: myController,
        onTap: () => myController.clear(),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: myLabelText,
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
