import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header: Avatar and Name
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hamidarki', // Placeholder Nama Lengkap
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'hamidarki@example.com', // Placeholder Email
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Profile Information Section
            _buildSectionTitle(context, 'Informasi Akademik'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  _buildInfoTile(Icons.school, 'Program Studi', 'Informatika'),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.account_balance, 'Fakultas', 'Sains dan Teknologi'),
                ],
              ),
            ),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Akses Situs'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  _buildInfoTile(Icons.first_page, 'First access to site', 'Selasa, 10 September 2024, 09:15'),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.last_page, 'Last access to site', 'Rabu, 24 Desember 2025, 13:05'),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Menu Utama'),
            _buildMenuItem(context, Icons.info_outline, 'Informasi User', () {}),
            _buildMenuItem(context, Icons.history, 'Aktivitas Login', () {}),
            _buildMenuItem(context, Icons.edit_note, 'Edit Profile', () {}),
            const Divider(indent: 16, endIndent: 16),
            _buildMenuItem(context, Icons.logout, 'Log Out', () {}, isDestructive: true),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      dense: true,
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.deepPurple),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
