import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigasi ke halaman notifikasi
            },
          ),
          IconButton(
            icon: const Icon(Icons.school),
            onPressed: () {
              // Navigasi ke halaman Kelas Saya
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sapaan pengguna
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Halo,',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Nama Lengkap Mahasiswa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Selamat datang di dashboard LMS',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tugas yang akan datang
              const Text(
                'Tugas yang Akan Datang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildTaskCard('Tugas Matematika', '31 Desember 2025', 'Pending'),
              _buildTaskCard(
                'Tugas Bahasa Indonesia',
                '2 Januari 2026',
                'Pending',
              ),
              _buildTaskCard('Tugas Pemrograman', '5 Januari 2026', 'Pending'),

              const SizedBox(height: 20),

              // Pengumuman terakhir
              const Text(
                'Pengumuman Terakhir',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildAnnouncementCard(
                'Pengumuman Penting',
                'Jadwal ujian semester ganjil telah dirilis. Silakan cek di halaman jadwal.',
                '12 Des 2025',
              ),

              const SizedBox(height: 20),

              // Progress kelas
              const Text(
                'Progress Kelas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildProgressCard('Pemrograman Mobile', 75),
              _buildProgressCard('Algoritma dan Struktur Data', 45),
              _buildProgressCard('Basis Data', 90),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(String title, String dueDate, String status) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text('Batas akhir: \$dueDate'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: status == 'Pending' ? Colors.orange[100] : Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: status == 'Pending'
                  ? Colors.orange[800]
                  : Colors.green[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard(String title, String content, String date) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.campaign, color: Colors.orange[600]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(String courseName, int progress) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    courseName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text('\$progress%'),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress / 100,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
