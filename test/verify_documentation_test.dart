import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Autograding Dokumentasi & Identitas Mahasiswa', () {
    test('1. File README.md telah diisi dengan identitas asli mahasiswa', () {
      final file = File('README.md');
      expect(file.existsSync(), isTrue, reason: 'File README.md wajib ada di root repositori.');

      final content = file.readAsStringSync();
      
      // Verifikasi bahwa placeholder telah diganti
      expect(
        content.contains('NIM: 3624XXXXXXXX'),
        isFalse,
        reason: 'Placeholder NIM belum diganti dengan NIM Anda sendiri di README.md.',
      );
      expect(
        content.contains('Nama Lengkap Anda'),
        isFalse,
        reason: 'Placeholder Nama Lengkap belum diganti dengan Nama Anda sendiri di README.md.',
      );
    });
  });
}
