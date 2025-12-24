import 'package:flutter/material.dart';

class DetailPengumumanPage extends StatelessWidget {
  final String title;
  final String admin;
  final String dateTime;
  final String content;

  const DetailPengumumanPage({
    super.key,
    required this.title,
    required this.admin,
    required this.dateTime,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengumuman'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Category Label
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'SISTEM',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),
              
              // Meta Info (Admin & Date)
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple.withOpacity(0.1),
                    child: const Icon(Icons.admin_panel_settings, color: Colors.deepPurple),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        admin,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        dateTime,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              
              // Main Content
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Institutional Signature
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Hormat Kami,',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 12),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia_id/thumb/0/03/Telkom_University_Logo.svg/1200px-Telkom_University_Logo.svg.png',
                      height: 40,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.school, size: 40, color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'CeLOE Telkom University',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.redAccent,
                      ),
                    ),
                    const Text(
                      'Center for e-Learning and Open Education',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
