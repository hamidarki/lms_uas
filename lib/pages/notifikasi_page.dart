import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Semua notifikasi ditandai telah dibaca')),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _buildSectionHeader('Aktivitas Tugas'),
          _buildNotificationItem(
            context,
            icon: Icons.assignment_turned_in,
            iconColor: Colors.green,
            title: 'Tugas Kalkulus Dikumpulkan',
            subtitle: 'Anda telah berhasil mengumpulkan Tugas 2 - Turunan.',
            time: '3 hari 9 jam lalu',
            isRead: false,
          ),
          _buildNotificationItem(
            context,
            icon: Icons.assignment_turned_in,
            iconColor: Colors.green,
            title: 'Tugas Pemrograman Web',
            subtitle: 'Proyek Akhir Semester telah diterima oleh sistem.',
            time: '5 hari lalu',
            isRead: true,
          ),

          const Divider(height: 32),
          _buildSectionHeader('Pengumuman Sistem'),
          _buildNotificationItem(
            context,
            icon: Icons.settings_applications,
            iconColor: Colors.orange,
            title: 'Maintenance LMS',
            subtitle: 'Pemeliharaan rutin sistem akan dilakukan untuk meningkatkan performa.',
            time: '24 Desember 2025',
            admin: 'Admin IT Central',
            isRead: false,
          ),
          _buildNotificationItem(
            context,
            icon: Icons.dns,
            iconColor: Colors.redAccent,
            title: 'Jadwal Downtime Server',
            subtitle: 'Server akan tidak dapat diakses pada pukul 00:00 - 04:00 WIB untuk upgrade storage.',
            time: '26 Desember 2025',
            admin: 'SysAdmin',
            isRead: false,
          ),
          _buildNotificationItem(
            context,
            icon: Icons.info_outline,
            iconColor: Colors.blue,
            title: 'Kebijakan Baru Kursus',
            subtitle: 'Harap perhatikan perubahan jadwal pada modul pembelajaran mandiri.',
            time: '20 Desember 2025',
            admin: 'Akademik',
            isRead: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
    String? admin,
    bool isRead = false,
  }) {
    return Container(
      color: isRead ? Colors.transparent : Colors.deepPurple.withOpacity(0.05),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            if (!isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.black87.withOpacity(0.7), fontSize: 13),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (admin != null) ...[
                  Icon(Icons.person, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    admin,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600], fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 12),
                ],
                Icon(Icons.access_time, size: 12, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Action when notification is tapped
        },
      ),
    );
  }
}
