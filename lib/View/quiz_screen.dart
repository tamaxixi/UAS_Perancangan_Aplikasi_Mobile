import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String matpel;

  QuizScreen({required this.matpel});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> quizQuestions = [
    {
      'question': 'Pertanyaan 1',
      'options': ['Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Pertanyaan 2',
      'options': ['Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D'],
      'correctAnswerIndex': 1,
    },
    {
      'question': 'Pertanyaan 3',
      'options': ['Jawaban A', 'Jawaban B', 'Jawaban C', 'Jawaban D'],
      'correctAnswerIndex': 2,
    },
  ];
  List<int?> userAnswers = [];

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < quizQuestions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      }
    });
  }

  void submitQuiz() {
    // Simpan atau proses jawaban yang telah diisi
    print(userAnswers); // Contoh: Cetak jawaban untuk saat ini
    // Kemudian Anda bisa menavigasi ke layar hasil kuis atau melakukan aksi lainnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis ${widget.matpel}'),
        backgroundColor: const Color.fromARGB(255, 250, 251, 252),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Pertanyaan ${currentQuestionIndex + 1}:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    quizQuestions[currentQuestionIndex]['question'],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  quizQuestions[currentQuestionIndex]['options'].length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userAnswers.add(index);
                          nextQuestion();
                        });
                      },
                      child: Text(
                        quizQuestions[currentQuestionIndex]['options'][index],
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Menampilkan tombol "Submit" jika sudah di pertanyaan terakhir
              if (currentQuestionIndex == quizQuestions.length - 1)
                ElevatedButton(
                  onPressed: submitQuiz,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0 ? previousQuestion : null,
                    child: Text('Back'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: currentQuestionIndex < quizQuestions.length - 1 ? nextQuestion : null,
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
