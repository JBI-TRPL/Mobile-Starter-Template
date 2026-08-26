import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poliwangi_mobile_starter/modul_01/latihan_mandiri_01.dart';
import 'package:poliwangi_mobile_starter/modul_01/profile_screen.dart';

void main() {
  group('Modul 01 Autograding: Dart Fundamentals & Null Safety', () {
    test('1. hitungLuasPersegiPanjang menghitung luas dengan benar', () {
      final luas = hitungLuasPersegiPanjang(10.0, 5.0);
      expect(luas, equals(50.0));
      expect(hitungLuasPersegiPanjang(0.0, 10.0), equals(0.0));
    });

    test('2. Class Profil mendukung constructor named parameters & null safety', () {
      const p1 = Profil(
        nama: 'Test Mahasiswa',
        nim: '362458302099',
        programStudi: 'TRPL',
        emailKampus: 'test@poliwangi.ac.id',
      );
      expect(p1.nama, equals('Test Mahasiswa'));
      expect(p1.nim, equals('362458302099'));
      expect(p1.emailKampus, isNotNull);

      const p2 = Profil(
        nama: 'Test Tanpa Email',
        nim: '362458302098',
        programStudi: 'TRPL',
      );
      expect(p2.emailKampus, isNull);
    });

    testWidgets('3. ProfileScreen menampilkan AppBar, Avatar, dan informasi mahasiswa', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: ProfileScreen()),
      );

      // Verifikasi AppBar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Profil Mahasiswa TRPL'), findsOneWidget);

      // Verifikasi Icon Avatar
      expect(find.byIcon(Icons.school_rounded), findsOneWidget);

      // Verifikasi Info Card
      expect(find.text('Jurusan / Kampus'), findsOneWidget);
      expect(find.text('Program Studi'), findsOneWidget);
    });
  });
}
