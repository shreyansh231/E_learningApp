import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test {
  final String subject;
  final String grade;
  final List<String> questions;
  final List<String> correctAnswers;
  List<String> userAnswers;
  double score;

  Test({
    required this.subject,
    required this.grade,
    required this.questions,
    required this.correctAnswers,
    required this.userAnswers,
    this.score = 0,
  });
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<String, List<Map<String, dynamic>>> sections = {
    'Physics': [
      {
        'questionText':
            'Inertia is the tendency of an object to resist changes in its state of motion.',
        'answers': [
          {'text': 'Option A', 'correct': true},
          {'text': 'Option B', 'correct': false},
        ],
      },
      {
        'questionText':
            'The speed of light in a vacuum is approximately 186,282 miles per second (299,792,458 meters per second).',
        'answers': [
          {'text': 'Option A', 'correct': false},
          {'text': 'Option B', 'correct': true},
        ],
      },
      // Add more physics questions
    ],
    'Chemistry': [
      {
        'questionText':
            'Water boils at a higher temperature at higher altitudes compared to sea level.',
        'answers': [
          {'text': 'Option A', 'correct': true},
          {'text': 'Option B', 'correct': false},
        ],
      },
      {
        'questionText': 'Sound travels faster through water than through air.',
        'answers': [
          {'text': 'Option A', 'correct': false},
          {'text': 'Option B', 'correct': true},
        ],
      },
      // Add more chemistry questions
    ],
    'Maths': [
      {
        'questionText':
            'The commutative property of addition states that a + b = b + a for all real numbers a and b.',
        'answers': [
          {'text': 'Option A', 'correct': true},
          {'text': 'Option B', 'correct': false},
        ],
      },
      {
        'questionText': 'The sum of any two even numbers is always even.',
        'answers': [
          {'text': 'Option A', 'correct': false},
          {'text': 'Option B', 'correct': true},
        ],
      },
      // Add more maths questions
    ],
  };

  Map<String, int> scores = {
    'Physics': 0,
    'Chemistry': 0,
    'Maths': 0,
  };

  void answerQuestion(bool isCorrect, String section) {
    if (isCorrect) {
      setState(() {
        scores[section] = scores[section]! + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:CupertinoNavigationBar(
        middle: Text('Test Your Progress'),
      ),
      child: ListView(
        children: sections.keys.map((section) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.all(10.0),
            child: ExpansionTile(
              title: Text(
                section,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                QuizSection(
                  sectionName: section,
                  questions: sections[section]!,
                  answerHandler: (isCorrect) =>
                      answerQuestion(isCorrect, section),
                  score: scores[section]!,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class QuizSection extends StatelessWidget {
  final String sectionName;
  final List<Map<String, dynamic>> questions;
  final Function(bool) answerHandler;
  final int score;

  QuizSection({
    required this.sectionName,
    required this.questions,
    required this.answerHandler,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: Text(
            'Total Score: $score',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ...questions.map((question) {
          return QuizQuestion(
            questionText: question['questionText'],
            answers: question['answers'],
            answerHandler: answerHandler,
          );
        }),
      ],
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String questionText;
  final List<Map<String, dynamic>> answers;
  final Function(bool) answerHandler;

  QuizQuestion({
    required this.questionText,
    required this.answers,
    required this.answerHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionText,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          ...answers.map((answer) {
            return ElevatedButton(
              onPressed: () => answerHandler(answer['correct']),
              child: Text(answer['text']),
            );
          }),
        ],
      ),
    );
  }
}
