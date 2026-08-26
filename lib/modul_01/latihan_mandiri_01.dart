// ==============================================================================
// LATIHAN MANDIRI MODUL 01 — DART REFRESH & SOUND NULL SAFETY
// Kerjakan 3 soal berikut sesuai instruksi di modul.
// Jalankan pengujian mandiri via terminal: dart run lib/modul_01/latihan_mandiri_01.dart
// ==============================================================================

void main() {
  print('=== HASIL LATIHAN MANDIRI MODUL 01 ===');

  // Soal 1: Panggil fungsi hitungLuasPersegiPanjang
  double luas = hitungLuasPersegiPanjang(10.0, 5.5);
  print('1. Luas Persegi Panjang (10.0 x 5.5): ${luas.toStringAsFixed(2)} cm²');

  // Soal 2 & 3: Buat objek Profil dan demonstrasikan null-safety
  final profil1 = Profil(
    nama: 'Budi Santoso',
    nim: '362458302001',
    programStudi: 'Teknologi Rekayasa Perangkat Lunak',
    emailKampus: 'budi@poliwangi.ac.id',
  );

  final profil2 = Profil(
    nama: 'Siti Rahma',
    nim: '362458302002',
    programStudi: 'Teknologi Rekayasa Perangkat Lunak',
  );

  print('\n2. Profil 1 (Dengan Email Kampus):');
  profil1.tampilkanInfo();
  print('   Panjang karakter email: ${profil1.emailKampus?.length ?? 0}');

  print('\n3. Profil 2 (Tanpa Email Kampus):');
  profil2.tampilkanInfo();
  print('   Panjang karakter email: ${profil2.emailKampus?.length ?? 0}');
}

// ------------------------------------------------------------------------------
// SOAL 1: Fungsi dengan Tipe Data Eksplisit
// ------------------------------------------------------------------------------
double hitungLuasPersegiPanjang(double panjang, double lebar) {
  return panjang * lebar;
}

// ------------------------------------------------------------------------------
// SOAL 2: Class dengan Sound Null Safety & Named Parameters
// ------------------------------------------------------------------------------
class Profil {
  final String nama;
  final String nim;
  final String programStudi;
  final String? emailKampus; // Nullable property

  const Profil({
    required this.nama,
    required this.nim,
    required this.programStudi,
    this.emailKampus,
  });

  void tampilkanInfo() {
    print('   Nama          : $nama');
    print('   NIM           : $nim');
    print('   Program Studi : $programStudi');
    print('   Email Kampus  : ${emailKampus ?? 'belum diisi'}');
  }
}
