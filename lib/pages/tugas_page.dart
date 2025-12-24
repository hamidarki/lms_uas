import 'package:flutter/material.dart';

class TugasPage extends StatefulWidget {
  final String judul;
  final String deadline;

  const TugasPage({
    super.key,
    required this.judul,
    required this.deadline,
  });

  @override
  State<TugasPage> createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  bool _isSubmitted = false;
  String? _fileName;

  void _handleUpload() {
    // Simulasi pemilihan file
    setState(() {
      _fileName = 'Tugas_Akhir_Hamidarki.pdf';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File berhasil dipilih')),
    );
  }

  void _handleSave() {
    if (_fileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan upload file terlebih dahulu'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isSubmitted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tugas berhasil disimpan dan dikirim!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isSubmitted ? Colors.green[50] : Colors.orange[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isSubmitted ? Colors.green[200]! : Colors.orange[200]!,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _isSubmitted ? Icons.check_circle : Icons.pending_actions,
                    color: _isSubmitted ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isSubmitted ? 'Status: Sudah Dikirim' : 'Status: Belum Dikirim',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _isSubmitted ? Colors.green[800] : Colors.orange[800],
                        ),
                      ),
                      Text(
                        'Deadline: ${widget.deadline}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Content Section
            Text(
              widget.judul,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Instruksi Tugas:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Silakan kerjakan tugas ini sesuai dengan materi yang telah disampaikan. Pastikan format file adalah PDF dengan ukuran maksimal 10MB. Tugas yang dikumpulkan melewati batas waktu tidak akan diterima oleh sistem.',
              style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5),
            ),
            const SizedBox(height: 32),

            // Upload Section
            const Text(
              'Pengumpulan File',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
              ),
              child: Column(
                children: [
                  const Icon(Icons.cloud_upload_outlined, size: 48, color: Colors.deepPurple),
                  const SizedBox(height: 12),
                  if (_fileName != null)
                    Text(
                      _fileName!,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                    )
                  else
                    const Text('Belum ada file yang diunggah'),
                  const SizedBox(height: 4),
                  const Text(
                    'Batas ukuran file: 10 MB',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _isSubmitted ? null : _handleUpload,
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Pilih File / Upload'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Bottom Actions
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _isSubmitted ? null : _handleSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isSubmitted ? Colors.grey : Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  _isSubmitted ? 'TUGAS SUDAH DISIMPAN' : 'SIMPAN & KIRIM',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
