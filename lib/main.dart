import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

/* ================= MODEL ================= */

class Peserta {
  String nama;
  String email;
  String kelas;

  Peserta({required this.nama, required this.email, required this.kelas});
}

/* ================= APP ================= */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.playfairDisplayTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF6EBDD),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA67B5B),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 6,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

/* ================= BACKGROUND ================= */

class PremiumBackground extends StatelessWidget {
  const PremiumBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8EFE5), Color(0xFFEADBC8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

/* ================= GLASS BOX ================= */

class GlassBox extends StatelessWidget {
  final Widget child;
  const GlassBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.55),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withOpacity(0.7)),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.15),
                  blurRadius: 25,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/* ================= HOME + CRUD ================= */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nama = TextEditingController();
  final email = TextEditingController();
  final kelas = TextEditingController();

  List<Peserta> pesertaList = [];
  int? editIndex;

  void simpan() {
    if (nama.text.isEmpty || email.text.isEmpty || kelas.text.isEmpty) return;

    setState(() {
      if (editIndex == null) {
        pesertaList.add(
          Peserta(nama: nama.text, email: email.text, kelas: kelas.text),
        );
      } else {
        pesertaList[editIndex!] = Peserta(
          nama: nama.text,
          email: email.text,
          kelas: kelas.text,
        );
        editIndex = null;
      }
      nama.clear();
      email.clear();
      kelas.clear();
    });
  }

  void editData(int index) {
    setState(() {
      editIndex = index;
      nama.text = pesertaList[index].nama;
      email.text = pesertaList[index].email;
      kelas.text = pesertaList[index].kelas;
    });
  }

  void hapusData(int index) {
    setState(() {
      pesertaList.removeAt(index);
      editIndex = null;
      nama.clear();
      email.clear();
      kelas.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PremiumBackground(),
          GlassBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "🎓 EduSmart Digital Literacy",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6D4C41),
                    ),
                  ),
                  const SizedBox(height: 30),

                  TextField(
                    controller: nama,
                    decoration: const InputDecoration(labelText: "Nama"),
                  ),
                  const SizedBox(height: 15),

                  TextField(
                    controller: email,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  const SizedBox(height: 15),

                  TextField(
                    controller: kelas,
                    decoration: const InputDecoration(labelText: "Kelas"),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: simpan,
                      child: Text(
                        editIndex == null
                            ? "Simpan Peserta ➕"
                            : "Update Peserta ✏",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 20),

                  const Text(
                    "📋 Daftar Peserta",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  ...List.generate(pesertaList.length, (index) {
                    final p = pesertaList[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ListTile(
                        title: Text(p.nama),
                        subtitle: Text("${p.email} | ${p.kelas}"),
                        trailing: Wrap(
                          spacing: 8,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => editData(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => hapusData(index),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => QuizPage(peserta: p),
                                  ),
                                );
                              },
                              child: const Text("Mulai ▶"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ================= QUIZ ================= */

class QuizPage extends StatefulWidget {
  final Peserta peserta;
  const QuizPage({super.key, required this.peserta});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int score = 0;

  final List<String> questions = [
    "Apa itu literasi digital?",
    "Apa itu hoaks?",
    "Cyberbullying adalah?",
    "Jejak digital berarti?",
    "Etika internet berarti?",
  ];

  final List<List<String>> answers = [
    ["Kemampuan menggunakan teknologi", "Game", "Film", "Chat"],
    ["Berita palsu", "Berita resmi", "Iklan", "Aplikasi"],
    ["Perundungan online", "Belanja", "Belajar", "Main"],
    ["Data aktivitas online", "Password", "File", "Folder"],
    ["Bersikap sopan di dunia digital", "Spam", "Hate speech", "Hack"],
  ];

  List<int> correctIndex = [];
  List<int> userAnswers = [];

  @override
  void initState() {
    super.initState();
    shuffleAnswers();
  }

  void shuffleAnswers() {
    final random = Random();
    for (int i = 0; i < answers.length; i++) {
      String correct = answers[i][0];
      answers[i].shuffle(random);
      correctIndex.add(answers[i].indexOf(correct));
    }
  }

  void answer(int selected) {
    userAnswers.add(selected);
    if (selected == correctIndex[index]) score++;

    if (index < questions.length - 1) {
      setState(() => index++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            peserta: widget.peserta,
            score: score,
            questions: questions,
            answers: answers,
            userAnswers: userAnswers,
            correctIndex: correctIndex,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PremiumBackground(),
          GlassBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pertanyaan ${index + 1} dari ${questions.length}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  questions[index],
                  style: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...List.generate(
                  answers[index].length,
                  (i) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => answer(i),
                        child: Text(answers[index][i]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ================= RESULT ================= */

class ResultPage extends StatelessWidget {
  final Peserta peserta;
  final int score;
  final List<String> questions;
  final List<List<String>> answers;
  final List<int> userAnswers;
  final List<int> correctIndex;

  const ResultPage({
    super.key,
    required this.peserta,
    required this.score,
    required this.questions,
    required this.answers,
    required this.userAnswers,
    required this.correctIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const PremiumBackground(),
          GlassBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "🎉 Hasil Quiz",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text("Nama: ${peserta.nama}"),
                  Text("Kelas: ${peserta.kelas}"),
                  const SizedBox(height: 15),
                  Text(
                    "Skor: $score / ${questions.length} ⭐",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text(
                    "📚 Detail Jawaban",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(questions.length, (i) {
                    bool benar = userAnswers[i] == correctIndex[i];
                    return Card(
                      color: benar
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                      child: ListTile(
                        title: Text(questions[i]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jawaban Anda: ${answers[i][userAnswers[i]]}"),
                            Text(
                              "Jawaban Benar: ${answers[i][correctIndex[i]]}",
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 320,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                      ),
                      child: const Text(
                        "Kembali ke Home ✨",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
