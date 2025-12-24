import 'dart:async';
import 'package:flutter/material.dart';

class KuisPage extends StatefulWidget {
  final String judul;
  final String durasi;

  const KuisPage({
    super.key,
    required this.judul,
    required this.durasi,
  });

  @override
  State<KuisPage> createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  int _currentQuestionIndex = 0;
  int _secondsRemaining = 1800; // 30 menit dalam detik
  Timer? _timer;
  bool _isStarted = false;
  final Map<int, int?> _answers = {};

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Apa yang dimaksud dengan State di Flutter?',
      'options': [
        'Data yang dapat dibaca saat widget dibangun',
        'Informasi yang dapat berubah selama masa hidup widget',
        'Sebuah fungsi untuk menggambar UI',
        'Variabel statis yang tidak pernah berubah'
      ],
      'answer': 1,
    },
    {
      'question': 'Widget mana yang digunakan untuk membuat layout vertikal?',
      'options': ['Row', 'Stack', 'Column', 'Container'],
      'answer': 2,
    },
    {
      'question': 'Apa kegunaan dari pubspec.yaml?',
      'options': [
        'Menulis kode logika bisnis',
        'Mengatur aset dan dependensi proyek',
        'Menyimpan data user secara lokal',
        'Mengatur navigasi aplikasi'
      ],
      'answer': 1,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void _startQuiz() {
    setState(() {
      _isStarted = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _submitQuiz();
      }
    });
  }

  void _submitQuiz() {
    _timer?.cancel();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Kuis Selesai'),
        content: Text('Anda telah menyelesaikan ${widget.judul}. Jawaban Anda telah berhasil dikirim ke sistem.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Back to detail page
            },
            child: const Text('KEMBALI KE KELAS'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isStarted) {
      return _buildStartScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judul),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Prevent accidental back
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _secondsRemaining < 300 ? Colors.red : Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.timer, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      _formatTime(_secondsRemaining),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Question Navigation Bar
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey[100],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                bool isCurrent = _currentQuestionIndex == index;
                bool isAnswered = _answers.containsKey(index);
                return GestureDetector(
                  onTap: () => setState(() => _currentQuestionIndex = index),
                  child: Container(
                    width: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    decoration: BoxDecoration(
                      color: isCurrent ? Colors.deepPurple : (isAnswered ? Colors.green[100] : Colors.white),
                      border: Border.all(color: isCurrent ? Colors.deepPurple : Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isCurrent ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pertanyaan ${_currentQuestionIndex + 1} dari ${_questions.length}',
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _questions[_currentQuestionIndex]['question'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.4),
                  ),
                  const SizedBox(height: 24),
                  ...List.generate(
                    _questions[_currentQuestionIndex]['options'].length,
                    (index) {
                      bool isSelected = _answers[_currentQuestionIndex] == index;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.deepPurple.withOpacity(0.05) : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.deepPurple : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: RadioListTile<int>(
                          value: index,
                          groupValue: _answers[_currentQuestionIndex],
                          activeColor: Colors.deepPurple,
                          title: Text(_questions[_currentQuestionIndex]['options'][index]),
                          onChanged: (val) {
                            setState(() {
                              _answers[_currentQuestionIndex] = val;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: Row(
          children: [
            if (_currentQuestionIndex > 0)
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _currentQuestionIndex--),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('SEBELUMNYA'),
                ),
              ),
            if (_currentQuestionIndex > 0) const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentQuestionIndex < _questions.length - 1) {
                    setState(() => _currentQuestionIndex++);
                  } else {
                    _submitQuiz();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  _currentQuestionIndex < _questions.length - 1 ? 'SELANJUTNYA' : 'KIRIM JAWABAN',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStartScreen() {
    return Scaffold(
      appBar: AppBar(title: const Text('Informasi Kuis')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.quiz, size: 80, color: Colors.deepPurple),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                widget.judul,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            _buildInfoRow(Icons.timer_outlined, 'Waktu Pengerjaan', widget.durasi),
            _buildInfoRow(Icons.event_note, 'Deadline', '28 Desember 2025, 23:59 WIB'),
            _buildInfoRow(Icons.score, 'Metode Penilaian', 'Nilai Tertinggi'),
            _buildInfoRow(Icons.help_outline, 'Jumlah Soal', '${_questions.length} Butir'),
            const Spacer(),
            const Card(
              color: Color(0xFFFFF8E1), // Warning look
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.orange),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Pastikan koneksi internet stabil. Kuis akan otomatis terkirim saat waktu habis.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _startQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('MULAI MENGERJAKAN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.deepPurple.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, size: 20, color: Colors.deepPurple),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

