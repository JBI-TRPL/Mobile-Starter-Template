// ==============================================================================
// STARTER CODE MAHASISWA: MODUL 02 — RESPONSIVE ACADEMIC DASHBOARD
//
// PETUNJUK PENGERJAAN:
// 1. Gunakan LayoutBuilder untuk mendeteksi batas lebar layar (constraints.maxWidth).
// 2. Terapkan breakpoint 600dp:
//    - Lebar < 600dp (Smartphone): Render 1 kolom menggunakan ListView.builder.
//    - Lebar >= 600dp (Tablet/Desktop): Render 2 kolom menggunakan GridView.builder.
// 3. Implementasikan tombol Switch Tema Terang/Gelap menggunakan StatefulWidget.
// 4. Jalankan pengujian: flutter test test/modul_02_test.dart
// ==============================================================================

import 'package:flutter/material.dart';
import 'models/course.dart';
import 'widgets/course_card.dart';

class AcademicDashboardScreen extends StatefulWidget {
  const AcademicDashboardScreen({super.key});

  @override
  State<AcademicDashboardScreen> createState() => _AcademicDashboardScreenState();
}

class _AcademicDashboardScreenState extends State<AcademicDashboardScreen> {
  final List<Course> _courses = Course.getSampleCourses();
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard Akademik TRPL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF0284C7),
          foregroundColor: Colors.white,
          actions: [
            // ── TODO 3: Tombol Toggle Dark Mode ────────────────────────────
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
              tooltip: _isDarkMode ? 'Mode Terang' : 'Mode Gelap',
              onPressed: _toggleDarkMode,
            ),
          ],
        ),
        // ── TODO 1 & 2: LayoutBuilder Responsif (Breakpoint 600dp) ─────────
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Evaluasi lebar layar lokal
            final isTabletOrDesktop = constraints.maxWidth >= 600;

            if (isTabletOrDesktop) {
              // ── TODO 2A: TATA LETAK TABLET / DESKTOP (2 KOLOM GRID) ──────
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.2,
                ),
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: _courses[index]);
                },
              );
            } else {
              // ── TODO 2B: TATA LETAK SMARTPHONE (1 KOLOM LISTVIEW) ────────
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: _courses[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
