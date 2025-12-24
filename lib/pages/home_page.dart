import 'package:flutter/material.dart';
import 'package:lms/pages/notifikasi_page.dart';
import 'package:lms/pages/detail_pengumuman_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // Elegant Header with Curve and Profile
          SliverAppBar(
            expandedHeight: 180.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.deepPurple,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.deepPurple.shade800, Colors.deepPurple.shade400],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selamat Datang,',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          const Text(
                            'Hamidarki',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Informatika - Semester 5',
                              style: TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, size: 35, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotifikasiPage()),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  // Statistics Row
                  Row(
                    children: [
                      _buildStatCard('Kelas Aktif', '4', Icons.menu_book, Colors.blue),
                      const SizedBox(width: 15),
                      _buildStatCard('Tugas Pending', '3', Icons.assignment_late, Colors.orange),
                    ],
                  ),
                    const SizedBox(height: 25),

                    // Upcoming Tasks Section
                    _buildSectionHeader('Tugas yang Akan Datang', Icons.timer_outlined),
                    const SizedBox(height: 12),
                    _buildTaskCard('Tugas Matematika', '31 Des 2025', 0.6, Colors.blue),
                    _buildTaskCard('Proyek Web Mobile', '02 Jan 2026', 0.2, Colors.orange),
                    
                    const SizedBox(height: 25),

                    // Last Announcement Section
                    _buildSectionHeader('Pengumuman Terakhir', Icons.campaign_outlined),
                    const SizedBox(height: 12),
                    _buildAnnouncementCard(
                      context,
                      'Jadwal Ujian Semester',
                      'Jadwal ujian semester ganjil telah dirilis. Silakan cek di portal CeLOE untuk detail ruang dan jam.',
                      'Admin Akademik',
                      '12 Des 2025',
                    ),

                    const SizedBox(height: 25),

                    // Class Progress Section
                    _buildSectionHeader('Progress Belajar', Icons.auto_graph_rounded),
                    const SizedBox(height: 12),
                    _buildProgressCard('Pemrograman Mobile', 0.75, Colors.deepPurple),
                    _buildProgressCard('Basis Data', 0.90, Colors.green),
                    
                    const SizedBox(height: 40),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.deepPurple),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const Spacer(),
        TextButton(onPressed: () {}, child: const Text('Semua', style: TextStyle(color: Colors.deepPurple))),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 15),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(String title, String date, double progress, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.assignment_outlined, color: color, size: 22),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('Deadline: $date', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(BuildContext context, String title, String content, String admin, String date) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.campaign, color: Colors.orange, size: 24),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Text(date, style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.4),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(admin, style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 12)),
                    const Spacer(),
                    const Text('Baca Detail', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const Icon(Icons.keyboard_arrow_right, size: 16, color: Colors.grey),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(String title, double progress, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('${(progress * 100).toInt()}%', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: color.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
