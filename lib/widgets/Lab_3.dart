import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Lab_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text('Lab 3'),
          centerTitle: true,
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
  var myCheck = [];
  var firstGamerController = TextEditingController();
  var secondGamerController = TextEditingController();
  var currentGamer = '';

  var indexGamer = 1;

  var checkBoxNum = 10;
  final int maxSpich = 3;

  var trueCheckBoxCounter = 0;

  var gamerWinner = false;

  @override
  void initState() {
    for (var i = 0; i < checkBoxNum; i++) myCheck.add(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void startGame() {
      for (var i = 0; i < checkBoxNum; i++) myCheck[i] = false;

      setState(() {
        checkBoxNum = 10;
        currentGamer = firstGamerController.text;
        gamerWinner = false;
      });
    }

    void nextStep() {
      // get true checkBox number
      trueCheckBoxCounter = myCheck.where((e) => e == true).length;

      // gamers itterator
      if (trueCheckBoxCounter <= maxSpich && trueCheckBoxCounter != 0) {
        if (currentGamer == firstGamerController.text)
          indexGamer = 2;
        else
          indexGamer = 1;
      }
      setState(() {
        // validation of taken spich
        if (trueCheckBoxCounter <= maxSpich) checkBoxNum -= trueCheckBoxCounter;
        if (checkBoxNum < 1) gamerWinner = true;

        // gamers switch
        if (checkBoxNum == 0) {
          print('sdfsdfsdf');
        } else
          indexGamer == 1
              ? currentGamer = firstGamerController.text
              : currentGamer = secondGamerController.text;

        // clear checkBox
        for (var i = 0; i < myCheck.length; i++) myCheck[i] = false;
      });
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheckboxField(),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNamesField(context),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startGame,
              child: Text('Начать игру'),
            ),
            SizedBox(height: 40),
            gamerWinner == false
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ходит:  ',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextSpan(
                            text: '$currentGamer',
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  )
                : Text(
                    'Победил: $currentGamer',
                    style: Theme.of(context).textTheme.headline3,
                  ),
            SizedBox(height: 40),
            trueCheckBoxCounter <= maxSpich
                ? ElevatedButton(
                    onPressed: nextStep,
                    child: Text('Сделать ход'),
                  )
                : ElevatedButton(
                    onPressed: () {},
                    child: Text('Многа Спичак!!!!'),
                  )
          ],
        ),
      ],
    );
  }

  Stack _buildNamesField(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.fromLTRB(20, 20, 50, 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              _buildGamerStatusText(
                  text: 'Игрок 1', controller: firstGamerController),
              SizedBox(height: 15),
              _buildGamerStatusText(
                  text: 'Игрок 2', controller: secondGamerController),
            ],
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text('Имена игроков'),
          ),
        )
      ],
    );
  }

  Row _buildGamerStatusText({String? text, TextEditingController? controller}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$text'),
        SizedBox(width: 20),
        Container(
          width: 200,
          height: 40,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              isCollapsed: true,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Stack _buildCheckboxField() {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 140, minHeight: 90),
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey.shade400,
              width: 1,
              style: BorderStyle.solid,
            )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < checkBoxNum; i++)
                  Checkbox(
                      value: myCheck[i],
                      fillColor: MaterialStateProperty.all(Colors.blueAccent),
                      onChanged: (bool? value) {
                        setState(() {
                          myCheck[i] = value!;
                          trueCheckBoxCounter = 0;
                        });
                      }),
              ],
            ),
          ),
        ),
        Positioned(
          left: 25,
          top: 12,
          child: Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            color: Color(0xFFFAFAFA),
            child: Text(
              'Игровое поле',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
