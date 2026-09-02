import 'package:flutter/material.dart';

// ── WIDGET BANNER HEADER: Menampilkan ucapan selamat datang & ringkasan profil ──
class HeaderBanner extends StatelessWidget {
  final String studentName; // Nama mahasiswa yang ditampilkan
  final String nim;         // NIM mahasiswa

  const HeaderBanner({
    super.key,
    this.studentName = 'Mahasiswa TRPL',
    this.nim = '362355401xxx',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      // Dekorasi gradien elegan dan bayangan lembut
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0284C7), Color(0xFF0369A1)], // Gradien biru muda ke biru tua
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20), // Sudut melengkung 20 piksel
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0284C7).withOpacity(0.3), // Bayangan biru transparan
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris atas: Tag semester dan ikon lonceng pengumuman
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), // Transparansi putih
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Semester 5 (2026/2027)',
                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.notifications_active_outlined, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 14),
          // Ucapan personalisasi mahasiswa
          Text(
            'Selamat Datang, $studentName ($nim)',
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 4),
          const Text(
            'Dashboard Akademik & Proyek',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Baris Quick Stat: Menampilkan ringkasan metrik akademik
          const Row(
            children: [
              _StatPill(icon: Icons.task_alt, label: '4 Matakuliah'),
              SizedBox(width: 8),
              _StatPill(icon: Icons.grade, label: 'IPK 3.85'),
              SizedBox(width: 8),
              _StatPill(icon: Icons.calendar_month, label: '100% Hadir'),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget privat kecil untuk merender pil metrik (ikon + teks singkat)
class _StatPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2), // Latar gelap transparan
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
