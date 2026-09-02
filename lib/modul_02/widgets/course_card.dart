import 'package:flutter/material.dart';
import '../models/course.dart';

// ── WIDGET KARTU MATA KULIAH: Menampilkan informasi kursus dengan badge SKS ──
class CourseCard extends StatelessWidget {
  final Course course; // Data mata kuliah yang akan dirender oleh kartu

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    // Mengambil tema aktif untuk harmonisasi warna dan teks Material 3
    final theme = Theme.of(context);

    return Card(
      elevation: 2, // Memberikan bayangan halus pada kartu
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Sudut membulat
      // Stack: Menumpuk elemen di sepanjang sumbu Z (kedalaman layar)
      child: Stack(
        children: [
          // ── 1. LAPISAN DASAR: Konten teks dan informasi utama kartu ──────────
          Padding(
            padding: const EdgeInsets.all(16.0),
            // Column: Menyusun teks kode, nama, dosen, dan progress bar secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
              children: [
                // Kode Mata Kuliah dengan warna aksen primer
                Text(
                  course.code,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 6),

                // Nama Mata Kuliah (dibatasi 2 baris dengan ellipsis agar aman overflow)
                Text(
                  course.name,
                  maxLines: 2,                     // Maksimal 2 baris teks
                  overflow: TextOverflow.ellipsis, // Jika lebih panjang, potong dengan tanda ...
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Info Dosen Pengampu
                Row(
                  children: [
                    Icon(Icons.person_outline, size: 16, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    // Expanded: Membatasi lebar teks dosen agar tidak meluber keluar kartu
                    Expanded(
                      child: Text(
                        course.lecturer,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Info Ruangan Perkuliahan
                Row(
                  children: [
                    Icon(Icons.meeting_room_outlined, size: 16, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text(
                      course.room,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
                const Spacer(), // Mendorong indikator progres selalu menempel di bagian bawah kartu

                // Indikator Progres Pembelajaran
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Progres Sesi', style: theme.textTheme.labelSmall),
                        Text('${(course.progress * 100).toInt()}%', style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Bar persentase progres silabus
                    LinearProgressIndicator(
                      value: course.progress,
                      borderRadius: BorderRadius.circular(4),
                      minHeight: 6,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── 2. LAPISAN ATAS: Badge SKS di Pojok Kanan Atas (Positioned) ────
          // Positioned hanya boleh diletakkan sebagai anak langsung dari widget Stack
          Positioned(
            top: 12,   // Berjarak 12 piksel dari sisi atas kartu
            right: 12, // Berjarak 12 piksel dari sisi kanan kartu
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer, // Latar kontras lembut dari M3
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${course.sks} SKS',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
