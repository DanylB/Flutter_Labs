import 'package:flutter/material.dart';

class Lab_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/home2': (context) => HomePage(),
      },
      home: HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Image.asset('assets/lab1.png'),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // const List quiz_data = [
    //   {
    //     'question': ['assets/lab4/figures.jpg'],
    //   }
    // ];

    // var a = ['assets/lab4/figures.jpg', ''];

    const List quiz_data = [
      {
        "question": ['assets/lab4/figures.jpg'],
        "answer": ['Запомнено'],
      },
      {
        "id": 1,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          {'answerText': 'assets/lab_4/1_1.jpg', 'score': 1},
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 2,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 3,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 4,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 5,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 6,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 7,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 8,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 9,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
      {
        "id": 10,
        "question": "Какая фигура была на первой картинке?",
        "answer": [
          'assets/lab_4/1_1.jpg',
          'assets/lab_4/1_2.jpg',
          'assets/lab_4/1_3.jpg'
        ],
        "answer_index": 2
      },
    ];

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text('Lab 4'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              // Image.asset('assets/lab4/figures.jpg'),
              // Image.asset('assets/lab4/${i}_${i}.jpg'),
              Image.asset(quiz_data[0]['question'][0].toString()),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home2'),
                child: Text('sdfsdf'),
              ),
            ],
          ),
        ));
  }
}

// class HomePage2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: ElevatedButton(
//         onPressed: () => Navigator.pushNamed(context, '/'),
//         child: Text('sdfsdf'),
//       ),
//     ));
//   }
// }
