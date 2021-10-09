import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lab_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String label = ' ';
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab 1'),
        centerTitle: true,
        elevation: 1,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$label', style: Theme.of(context).textTheme.headline6),
                SizedBox(width: 50),
                _buildTextField(),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                  children: [
                    _buildFirstBtn(),
                    SizedBox(width: 50),
                    _buildBitBtn(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildBitBtn() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          String getText = myController.text;
          String labelText = '';
          int bitToDec = int.parse(getText, radix: 2);
          String decToString = bitToDec.toString();

          if (decToString.endsWith('0') || decToString.endsWith('5'))
            labelText = 'Делится';
          else
            labelText = 'Не делится';

          label = '$labelText';
        });
      },
      child: Text(
        'BitBtn',
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 40),
      ),
    );
  }

  _buildFirstBtn() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Button',
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 40),
      ),
    );
  }

  _buildTextField() {
    return Container(
      width: 200,
      child: TextField(
        controller: myController,
        maxLength: 10,
        decoration: InputDecoration(
          labelText: 'Input binary number',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
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
