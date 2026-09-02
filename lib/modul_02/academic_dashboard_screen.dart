// ==============================================================================
// STARTER CODE MAHASISWA: MODUL 02 — RESPONSIVE ACADEMIC DASHBOARD
//
// TUJUAN PEMBELAJARAN:
// 1. Memahami aturan BoxConstraints: 'Constraints go down, Sizes go up, Parent sets position'.
// 2. Menerapkan tata letak responsif menggunakan LayoutBuilder dengan breakpoint 600dp.
// 3. Menguasai widget linear dan berlapis (Row, Column, Stack, Positioned, GridView, ListView).
// 4. Mengelola state lokal untuk fitur toggle Tema Terang (Light) dan Gelap (Dark).
//
// PETUNJUK PENGERJAAN:
// - Evaluasi nilai constraints.maxWidth di dalam LayoutBuilder.
// - Jika < 600dp: Render 1 kolom vertikal menggunakan ListView.
// - Jika >= 600dp: Render 2 kolom menggunakan Row dan GridView.
// - Jalankan pengujian: flutter test test/modul_02_test.dart
// ==============================================================================

import 'package:flutter/material.dart';
import 'models/course.dart';
import 'widgets/course_card.dart';
import 'widgets/header_banner.dart';

// ── LAYAR DASHBOARD AKADEMIK UTAMA (StatefulWidget untuk mengelola Dark Mode) ──
class AcademicDashboardScreen extends StatefulWidget {
  const AcademicDashboardScreen({super.key});

  @override
  State<AcademicDashboardScreen> createState() => _AcademicDashboardScreenState();
}

class _AcademicDashboardScreenState extends State<AcademicDashboardScreen> {
  // Mengambil daftar mata kuliah dari model data Course
  final List<Course> _courses = Course.getSampleCourses();
  // State lokal untuk beralih antara Mode Terang (Light) dan Mode Gelap (Dark)
  bool _isDarkMode = false;

  // Fungsi untuk memicu perubahan tema dan menjadwalkan render ulang UI
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget Theme membungkus Scaffold untuk menerapkan tema Material 3 secara lokal
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      child: Scaffold(
        // AppBar dengan tombol aksi pengganti tema
        appBar: AppBar(
          title: const Text(
            'Dashboard Akademik TRPL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF0284C7),
          foregroundColor: Colors.white,
          actions: [
            // Tombol switch tema terang / gelap
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
              tooltip: _isDarkMode ? 'Mode Terang' : 'Mode Gelap',
              onPressed: _toggleDarkMode,
            ),
          ],
        ),
        // ── LayoutBuilder: Mendeteksi BoxConstraints area lokal yang tersedia ──
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Evaluasi breakpoint: Apakah lebar layar >= 600 dp?
            final isTabletOrDesktop = constraints.maxWidth >= 600;

            if (isTabletOrDesktop) {
              // ── A. TATA LETAK TABLET / DESKTOP (>= 600dp): 2 Kolom Sejajar ──
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kolom Kiri: Banner Header & Ringkasan (porsi flex: 2)
                    const Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: HeaderBanner(),
                      ),
                    ),
                    const SizedBox(width: 20), // Jarak antar kolom
                    // Kolom Kanan: 2-Column Grid Mata Kuliah (porsi flex: 3)
                    Expanded(
                      flex: 3,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,     // Menyusun dalam 2 kolom grid
                          crossAxisSpacing: 16,  // Jarak horizontal antar kartu
                          mainAxisSpacing: 16,   // Jarak vertikal antar kartu
                          childAspectRatio: 1.4, // Rasio perbandingan lebar terhadap tinggi
                        ),
                        itemCount: _courses.length,
                        itemBuilder: (context, index) {
                          return CourseCard(course: _courses[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // ── B. TATA LETAK SMARTPHONE (< 600dp): 1 Kolom ListView ─────────
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const HeaderBanner(), // Banner di bagian paling atas
                  const SizedBox(height: 16),
                  Text(
                    'Mata Kuliah Semester 5 (${_courses.length} Terdaftar)',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  // Merender seluruh kartu mata kuliah secara vertikal satu demi satu
                  ..._courses.map((course) => CourseCard(course: course)),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
