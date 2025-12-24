import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  final String judul;
  final String deskripsi;

  const MateriPage({
    super.key,
    required this.judul,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pembelajaran'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Placeholder
            Container(
              width: double.infinity,
              height: 220,
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.play_circle_fill, size: 80, color: Colors.white70),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black54,
                      child: const Text('15:24', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Description
                  Text(
                    judul,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    deskripsi,
                    style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 20),

                  // Synchronous Learning (Zoom)
                  _buildSectionTitle('Sesi Sinkronus (Live)'),
                  Card(
                    color: Colors.blue[50],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.blue[100]!),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.videocam, color: Colors.blue, size: 30),
                      title: const Text('Zoom Meeting Class', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text('Jadwal: Senin, 08:00 - 10:00 WIB'),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                        child: const Text('Join'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Study Files (PDF)
                  _buildSectionTitle('File Materi (PDF)'),
                  _buildFileItem(Icons.picture_as_pdf, 'Modul Pembelajaran Utama.pdf', '2.4 MB'),
                  _buildFileItem(Icons.picture_as_pdf, 'Slide Presentasi Dosen.pdf', '1.8 MB'),
                  const SizedBox(height: 24),

                  // Additional Attachments
                  _buildSectionTitle('Lampiran & Referensi'),
                  _buildFileItem(Icons.link, 'Link Jurnal Pendukung', 'External URL'),
                  _buildFileItem(Icons.archive, 'Dataset Latihan.zip', '15 MB'),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }

  Widget _buildFileItem(IconData icon, String fileName, String size) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(fileName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        trailing: Text(size, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        onTap: () {},
      ),
    );
  }
}
