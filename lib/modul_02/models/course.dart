class Course {
  final String code;
  final String name;
  final String lecturer;
  final int sks;
  final double progress; // 0.0 sampai 1.0

  const Course({
    required this.code,
    required this.name,
    required this.lecturer,
    required this.sks,
    required this.progress,
  });

  static List<Course> getSampleCourses() {
    return const [
      Course(
        code: 'TRPL501',
        name: 'Pemrograman Perangkat Bergerak',
        lecturer: 'Sepyan Purnama Kristanto',
        sks: 4,
        progress: 0.25,
      ),
      Course(
        code: 'TRPL502',
        name: 'Arsitektur Perangkat Lunak',
        lecturer: 'Tim Dosen TRPL',
        sks: 3,
        progress: 0.40,
      ),
      Course(
        code: 'TRPL503',
        name: 'Manajemen Proyek Agile & DevOps',
        lecturer: 'Tim Dosen TRPL',
        sks: 3,
        progress: 0.60,
      ),
      Course(
        code: 'TRPL504',
        name: 'Penjaminan Mutu Perangkat Lunak (QA)',
        lecturer: 'Tim Dosen TRPL',
        sks: 2,
        progress: 0.15,
      ),
    ];
  }
}
