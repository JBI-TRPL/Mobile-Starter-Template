// ==============================================================================
// STARTER CODE MAHASISWA: LATIHAN MANDIRI MODUL 01 — DART REFRESH & NULL SAFETY
// 
// PETUNJUK PENGERJAAN:
// 1. Lengkapi fungsi hitungLuasPersegiPanjang pada Soal 1.
// 2. Lengkapi class Profil dengan named parameters & null-safe property pada Soal 2.
// 3. Panggil method dan demonstrasikan null-aware operator di dalam main() pada Soal 3.
// 4. Jalankan pengujian mandiri di terminal: dart run lib/modul_01/latihan_mandiri_01.dart
// 5. Jalankan test otomatis: flutter test test/modul_01_test.dart
// ==============================================================================

void main() {
  print('=== HASIL LATIHAN MANDIRI MODUL 01 ===\n');

  // ----------------------------------------------------------------------------
  // TODO 1: Panggil fungsi hitungLuasPersegiPanjang dengan nilai pilihan Anda,
  // lalu cetak hasilnya ke konsol.
  // ----------------------------------------------------------------------------
  double panjang = 10.0;
  double lebar = 5.0;
  double luas = hitungLuasPersegiPanjang(panjang, lebar);
  print('1. Luas Persegi Panjang: ${luas.toStringAsFixed(2)} cm²\n');

  // ----------------------------------------------------------------------------
  // TODO 3: Buat dua objek dari class Profil:
  // - profil1: emailKampus diisi (contoh: 'nama@poliwangi.ac.id')
  // - profil2: emailKampus dikosongkan / null
  // Panggil tampilkanInfo() pada keduanya dan cetak panjang email menggunakan ?.length
  // ----------------------------------------------------------------------------
  final profil1 = Profil(
    nama: 'Nama Mahasiswa Anda',
    nim: '3624XXXXXXXX',
    programStudi: 'Teknologi Rekayasa Perangkat Lunak',
    emailKampus: 'mahasiswa@poliwangi.ac.id',
  );

  final profil2 = Profil(
    nama: 'Teman Mahasiswa',
    nim: '3624YYYYYYYY',
    programStudi: 'Teknologi Rekayasa Perangkat Lunak',
    // emailKampus tidak diisi (null)
  );

  print('2. Profil 1 (Dengan Email):');
  profil1.tampilkanInfo();
  print('   Panjang karakter email: ${profil1.emailKampus?.length ?? 0}\n');

  print('3. Profil 2 (Tanpa Email):');
  profil2.tampilkanInfo();
  print('   Panjang karakter email: ${profil2.emailKampus?.length ?? 0}');
}

// ------------------------------------------------------------------------------
// SOAL 1: Fungsi dengan Tipe Data Eksplisit
// TODO 1: Kembalikan hasil perkalian panjang * lebar
// ------------------------------------------------------------------------------
double hitungLuasPersegiPanjang(double panjang, double lebar) {
  // TODO: Hapus return 0.0 di bawah dan ganti dengan perkalian panjang * lebar
  return panjang * lebar;
}

// ------------------------------------------------------------------------------
// SOAL 2: Class dengan Sound Null Safety & Named Parameters
// TODO 2: Deklarasikan property, constructor, dan method tampilkanInfo()
// ------------------------------------------------------------------------------
class Profil {
  final String nama;
  final String nim;
  final String programStudi;
  final String? emailKampus; // Nullable String

  const Profil({
    required this.nama,
    required this.nim,
    required this.programStudi,
    this.emailKampus, // Parameter opsional (boleh null)
  });

  void tampilkanInfo() {
    print('   - Nama          : $nama');
    print('   - NIM           : $nim');
    print('   - Program Studi : $programStudi');
    print('   - Email Kampus  : ${emailKampus ?? 'belum diisi'}');
  }
}
