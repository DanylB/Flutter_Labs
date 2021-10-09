class Question {
  final int id;
  final String question;
  final List<String> answer;

  Question(this.id, this.question, this.answer);
}

const List quiz_data = [
  {
    "id": 1,
    "question": "Сколько парней у нас в группе?",
    "answer": ['Больше трёх', 'Девять', 'Семь', 'Четверо'],
    "answer_index": 2
  },
  {
    "id": 2,
    "question": "В каком жанре выступает группа?",
    "answer": ['К-рор', 'Соул', 'Кантри', 'К-реп'],
    "answer_index": 0
  },
  {
    "id": 3,
    "question": "В каком году дебютировала группа",
    "answer": ['2007', '2013', '2012', '2015'],
    "answer_index": 1
  },
  {
    "id": 4,
    "question": "Кто из участников является лидером группы?",
    "answer": ['Чон', 'Чимин', 'RM', 'Джей'],
    "answer_index": 2
  },
  {
    "id": 5,
    "question": "В каком городе сформировалась группа?",
    "answer": ['Бусан', 'Дэгу', 'Улсан', 'Сеул'],
    "answer_index": 3
  },
  {
    "id": 6,
    "question": "Когда BTS приезжали в Россию?",
    "answer": ['Весной 2013', 'Летом 2014', 'Весной 2014', 'Летом 2013'],
    "answer_index": 1
  },
  {
    "id": 7,
    "question": "Как называют фанатов группы?",
    "answer": ['Army', 'Stay', 'Никак', 'BLINK'],
    "answer_index": 2
  },
];
