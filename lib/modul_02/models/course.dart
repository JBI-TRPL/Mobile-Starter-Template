// ── MODEL DATA KURSUS: Merepresentasikan entitas mata kuliah akademik ─────────
class Course {
  final String code;     // Kode unik mata kuliah (misal: 'TRPL501')
  final String name;     // Nama lengkap mata kuliah (misal: 'Pemrograman Perangkat Bergerak')
  final String lecturer; // Nama dosen pengampu mata kuliah
  final int sks;         // Bobot satuan kredit semester (1-6 SKS)
  final double progress; // Capaian silabus mahasiswa (nilai desimal 0.0 sampai 1.0)
  final String room;     // Ruangan perkuliahan atau laboratorium praktikum

  // Konstruktor konstan dengan named parameters yang wajib diisi (required)
  const Course({
    required this.code,
    required this.name,
    required this.lecturer,
    required this.sks,
    required this.progress,
    this.room = 'Lab Komputer 3', // Nilai default jika ruangan tidak diisi
  });

  // Fungsi helper statis untuk menyediakan data tiruan (dummy data) Semester 5
  static List<Course> getSampleCourses() {
    return const [
      Course(
        code: 'TRPL501',
        name: 'Pemrograman Perangkat Bergerak',
        lecturer: 'Sepyan Purnama Kristanto',
        sks: 4,
        progress: 0.25,
        room: 'Lab Komputer 3',
      ),
      Course(
        code: 'TRPL502',
        name: 'Arsitektur Perangkat Lunak',
        lecturer: 'Tim Dosen TRPL',
        sks: 3,
        progress: 0.40,
        room: 'Ruang Teori 201',
      ),
      Course(
        code: 'TRPL503',
        name: 'Manajemen Proyek Agile & DevOps',
        lecturer: 'Tim Dosen TRPL',
        sks: 3,
        progress: 0.60,
        room: 'Ruang Teori 104',
      ),
      Course(
        code: 'TRPL504',
        name: 'Penjaminan Mutu Perangkat Lunak (QA)',
        lecturer: 'Tim Dosen TRPL',
        sks: 2,
        progress: 0.15,
        room: 'Lab Jaringan',
      ),
    ];
  }
}
