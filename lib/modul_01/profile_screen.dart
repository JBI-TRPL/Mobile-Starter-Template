// ==============================================================================
// STARTER CODE MAHASISWA: MODUL 01 — PROFILE SCREEN APP
//
// TUJUAN PEMBELAJARAN:
// 1. Memahami struktur dasar aplikasi Flutter (MaterialApp, Scaffold, AppBar, Body).
// 2. Menerapkan Dart Sound Null Safety dan kustomisasi identitas mahasiswa.
// 3. Menguasai widget dasar: Column, Container, Card, CircleAvatar/Icon, dan Row.
// 4. Membangun interaktivitas sederhana dengan ElevatedButton dan SnackBar.
//
// PETUNJUK PENGERJAAN:
// - Ganti 'Nama Lengkap Anda' dan 'NIM: 3624XXXXXXXX' dengan data asli Anda.
// - Jalankan pengujian autograding lokal: flutter test test/modul_01_test.dart
// ==============================================================================

import 'package:flutter/material.dart';

// Widget utama halaman profil mahasiswa (StatelessWidget: bersifat statis/immutable)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: Kerangka dasar halaman Material Design (menyediakan AppBar, warna background, body)
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Warna latar belakang abu-abu terang yang bersih
      // AppBar: Bilah navigasi atas dengan judul halaman
      appBar: AppBar(
        title: const Text(
          'Profil Mahasiswa TRPL',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0284C7), // Warna tema biru Poliwangi
        foregroundColor: Colors.white,            // Warna teks dan ikon di AppBar
        centerTitle: true,                        // Memposisikan judul persis di tengah
      ),
      // Body: Konten utama yang dipusatkan di tengah layar
      body: Center(
        // SingleChildScrollView: Mencegah overflow jika layar diputar landscape atau pada smartphone kecil
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0), // Padding merata di sekeliling konten
          // Column: Menyusun widget secara vertikal dari atas ke bawah
          child: Column(
            mainAxisSize: MainAxisSize.min, // Menyesuaikan tinggi kolom sesuai tinggi konten anaknya
            children: [
              // ── 1. AVATAR IDENTITAS MAHASISWA ─────────────────────────────
              // Container berbentuk lingkaran dengan border tema sebagai wadah foto/avatar
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F2FE), // Latar lingkaran biru muda
                  shape: BoxShape.circle,         // Bentuk lingkaran sempurna
                  border: Border.all(
                    color: const Color(0xFF0284C7), // Garis tepi biru Poliwangi
                    width: 3,                       // Ketebalan border 3 piksel
                  ),
                ),
                child: const Icon(
                  Icons.school_rounded, // Ikon pendidikan / kampus
                  size: 52,
                  color: Color(0xFF0284C7),
                ),
              ),
              const SizedBox(height: 16), // Spasi vertikal pemisah 16 piksel

              // ── 2. NAMA MAHASISWA (Ganti dengan Nama Anda Sendiri) ───────────
              const Text(
                'Nama Lengkap Mahasiswa', // TODO: Ganti dengan nama lengkap asli Anda
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A), // Warna teks slate gelap
                ),
              ),
              const SizedBox(height: 6),

              // ── 3. BADGE NIM (Ganti dengan NIM Anda Sendiri) ─────────────────
              // Container dengan sudut kapsul untuk menampilkan nomor induk mahasiswa
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F2FE),      // Latar biru muda lembut
                  borderRadius: BorderRadius.circular(20), // Sudut kapsul melengkung
                ),
                child: const Text(
                  'NIM: 362458302000', // TODO: Ganti dengan NIM asli Anda
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0369A1), // Warna teks biru kontras
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ── 4. KARTU INFORMASI AKADEMIK (Card + Info Rows) ───────────────
              // Card: Mengelompokkan rincian akademik dalam kotak elevasi dengan bayangan halus
              Card(
                elevation: 2, // Ketinggian bayangan melayang
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Sudut membulat 16 piksel
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0), // Ruang di dalam kartu
                  child: Column(
                    children: [
                      _ProfileInfoRow(
                        icon: Icons.domain_rounded,
                        label: 'Jurusan / Kampus',
                        value: 'Bisnis & Informatika — Poliwangi',
                      ),
                      Divider(height: 24), // Garis horizontal pemisah
                      _ProfileInfoRow(
                        icon: Icons.code_rounded,
                        label: 'Program Studi',
                        value: 'Sarjana Terapan TRPL',
                      ),
                      Divider(height: 24),
                      _ProfileInfoRow(
                        icon: Icons.calendar_month_rounded,
                        label: 'Semester & Angkatan',
                        value: 'Semester 5 — Angkatan 2024',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ── 5. TOMBOL AKSI INTERAKTIF DENGAN SNACKBAR ────────────────────
              // Tombol yang memunculkan notifikasi mengambang (SnackBar) saat diklik
              SizedBox(
                width: double.infinity, // Membuat lebar tombol memenuhi lebar kontainer
                child: ElevatedButton.icon(
                  onPressed: () {
                    // ScaffoldMessenger: Menampilkan pesan notifikasi sementara ke pengguna
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Status: Mahasiswa Aktif Poliwangi 2026'),
                        backgroundColor: Color(0xFF0284C7),
                        behavior: SnackBarBehavior.floating, // Mengambang di atas batas bawah layar
                        duration: Duration(seconds: 3),     // Durasi tampil 3 detik
                      ),
                    );
                  },
                  icon: const Icon(Icons.verified_user_rounded),
                  label: const Text('Verifikasi Status Mahasiswa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0284C7),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── 6. WIDGET REUSABLE: Baris rincian informasi profil ────────────────────────
class _ProfileInfoRow extends StatelessWidget {
  final IconData icon;   // Ikon yang mewakili informasi
  final String label;    // Label judul kecil di atas (misal: 'Program Studi')
  final String value;    // Nilai data tebal di bawah (misal: 'Sarjana Terapan TRPL')

  const _ProfileInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // Row menyusun elemen secara horizontal (kiri ke kanan)
    return Row(
      children: [
        // Kotak wadah ikon berlatar biru muda
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F9FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF0284C7)),
        ),
        const SizedBox(width: 14), // Jarak horizontal antara ikon dan teks

        // Expanded: Memaksa teks mengisi sisa lebar ruang Row agar tidak overflow
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Ratakan teks ke sisi kiri
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF64748B), // Abu-abu sekunder
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A), // Slate gelap
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
