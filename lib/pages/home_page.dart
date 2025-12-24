import 'package:flutter/material.dart';
import 'package:lms/pages/notifikasi_page.dart';
import 'package:lms/pages/detail_pengumuman_page.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotifikasiPage()),
              );
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
                      'Hamidarki',
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
                context,
                'Jadwal Ujian Semester',
                'Jadwal ujian semester ganjil telah dirilis. Silakan cek di halaman jadwal secara berkala untuk perubahan mendadak.',
                'Admin Akademik',
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
        subtitle: Text('Batas akhir: $dueDate'),
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

  Widget _buildAnnouncementCard(BuildContext context, String title, String content, String admin, String date) {
    return Card(
      clipBehavior: Clip.antiAlias, // Ensures InkWell splash is contained
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPengumumanPage(
                title: title,
                admin: admin,
                dateTime: '$date - 09:00 WIB',
                content: content,
              ),
            ),
          );
        },
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Baca Selengkapnya',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 16, color: Colors.deepPurple),
                ],
              ),
            ],
          ),
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
