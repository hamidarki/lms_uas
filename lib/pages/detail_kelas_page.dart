import 'package:flutter/material.dart';
import 'package:lms/pages/materi_page.dart';
import 'package:lms/pages/tugas_page.dart';
import 'package:lms/pages/kuis_page.dart';

class DetailKelasPage extends StatefulWidget {
  final String namaMatakuliah;
  final String dosenPengampu;

  const DetailKelasPage({
    super.key,
    required this.namaMatakuliah,
    required this.dosenPengampu,
  });

  @override
  State<DetailKelasPage> createState() => _DetailKelasPageState();
}

class _DetailKelasPageState extends State<DetailKelasPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Elegant Header with Course Info
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.namaMatakuliah,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.deepPurple, Colors.indigo],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.class_, size: 60, color: Colors.white24),
                      const SizedBox(height: 10),
                      Text(
                        'Dosen: ${widget.dosenPengampu}',
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // TabBar pinned below AppBar
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              TabBar(
                controller: _tabController,
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.deepPurple,
                tabs: const [
                  Tab(icon: Icon(Icons.menu_book), text: 'Materi'),
                  Tab(icon: Icon(Icons.assignment), text: 'Tugas'),
                  Tab(icon: Icon(Icons.quiz), text: 'Kuis'),
                ],
              ),
            ),
          ),

          // TabBarView content
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMateriSection(),
                _buildTugasSection(),
                _buildKuisSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMateriSection() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        int meeting = index + 1;
        String topic = 'Pembahasan Minggu Ke-$meeting';
        return ExpansionTile(
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            child: Text('$meeting', style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
          ),
          title: Text('Pertemuan $meeting', style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(topic),
          children: [
            _buildResourceItem('Modul Materi Pertemuan $meeting.pdf', topic, Icons.picture_as_pdf),
            _buildResourceItem('Video Pembelajaran Pertemuan $meeting', topic, Icons.play_circle_fill),
            _buildResourceItem('Lampiran Materi', topic, Icons.attachment),
          ],
        );
      },
    );
  }

  Widget _buildTugasSection() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildActionCard(
          Icons.assignment_outlined,
          'Tugas Pendahuluan',
          'Deadline: 28 Des 2025',
          Colors.orange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TugasPage(
                  judul: 'Tugas Pendahuluan',
                  deadline: '28 Des 2025, 23:59 WIB',
                ),
              ),
            );
          },
        ),
        _buildActionCard(
          Icons.assignment_turned_in,
          'Proyek Tengah Semester',
          'Selesai',
          Colors.green,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TugasPage(
                  judul: 'Proyek Tengah Semester',
                  deadline: 'Sudah Berakhir',
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildKuisSection() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildActionCard(
          Icons.timer,
          'Kuis Minggu 4',
          'Durasi: 30 Menit',
          Colors.blue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const KuisPage(
                  judul: 'Kuis Minggu 4',
                  durasi: '30 Menit',
                ),
              ),
            );
          },
        ),
        _buildActionCard(
          Icons.lock,
          'Ujian Akhir Semester',
          'Terkunci',
          Colors.grey,
        ),
      ],
    );
  }

  Widget _buildResourceItem(String title, String topic, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple, size: 20),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MateriPage(
              judul: title,
              deskripsi: 'Materi ini membahas secara mendalam mengenai $topic. Silakan pelajari file dan video yang tersedia di bawah ini.',
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionCard(IconData icon, String title, String status, Color color, {VoidCallback? onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(status),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
