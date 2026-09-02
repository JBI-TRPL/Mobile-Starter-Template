import 'package:flutter/material.dart';
import 'modul_01/profile_screen.dart';
import 'modul_02/academic_dashboard_screen.dart';
import 'modul_03/modul_03_app.dart';
import 'modul_04/modul_04_app.dart';

void main() {
  runApp(const PoliwangiStarterApp());
}

class PoliwangiStarterApp extends StatelessWidget {
  const PoliwangiStarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poliwangi Mobile Codelabs 2026',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ModuleLauncherScreen(),
    );
  }
}

class ModuleLauncherScreen extends StatefulWidget {
  const ModuleLauncherScreen({super.key});

  // Konfigurasi modul aktif perkuliahan (diatur oleh Dosen Pengampu)
  // Mahasiswa hanya dapat mengakses modul dengan nomor <= activeModuleUntil
  static const int activeModuleUntil = 2; // Saat ini: Minggu ke-2 (Modul 1 & 2 terbuka)

  // Token akses kelas untuk membuka modul lebih awal saat praktikum di lab
  static const Map<int, String> modulePasscodes = {
    3: 'TRPL-M03',
    4: 'TRPL-M04',
    5: 'TRPL-M05',
    6: 'TRPL-M06',
    7: 'TRPL-M07',
  };
  static const String masterPasscode = 'POLIWANGI2026';

  @override
  State<ModuleLauncherScreen> createState() => _ModuleLauncherScreenState();
}

class _ModuleLauncherScreenState extends State<ModuleLauncherScreen> {
  // Menyimpan daftar modul yang telah di-unlock via token kelas selama sesi berjalan
  final Set<int> _unlockedModules = {};

  bool _isModuleUnlocked(int moduleNumber) {
    return moduleNumber <= ModuleLauncherScreen.activeModuleUntil ||
        _unlockedModules.contains(moduleNumber);
  }

  void _showUnlockDialog(BuildContext context, int moduleNumber, String title) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.lock_outline, color: Color(0xFF0284C7)),
            const SizedBox(width: 8),
            Text('Modul #0$moduleNumber Terkunci'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Materi "$title" dijadwalkan untuk perkuliahan Minggu ke-$moduleNumber oleh Dosen Pengampu.',
              style: const TextStyle(fontSize: 13, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Jika Anda sedang berada di kelas laboratorium, masukkan Token Akses Kelas dari dosen:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              autofocus: true,
              textCapitalization: TextCapitalization.characters,
              decoration: const InputDecoration(
                hintText: 'Contoh: TRPL-M03',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              final input = controller.text.trim().toUpperCase();
              final validPasscode = ModuleLauncherScreen.modulePasscodes[moduleNumber];

              if (input == validPasscode || input == ModuleLauncherScreen.masterPasscode) {
                setState(() {
                  _unlockedModules.add(moduleNumber);
                });
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Modul #0$moduleNumber berhasil dibuka!'),
                    backgroundColor: const Color(0xFF059669),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Token akses salah. Silakan tanyakan kepada dosen di kelas.'),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: const Text('Buka Modul'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Poliwangi Mobile Codelabs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0284C7),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Banner info status perkuliahan
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFBAE6FD)),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF0284C7), size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Perkuliahan Aktif: Minggu ke-2 (Modul 01 & 02). Modul lanjutan terbuka sesuai jadwal dosen.',
                    style: TextStyle(color: Color(0xFF0369A1), fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),

          // Modul 01
          _buildModuleCard(
            moduleNumber: 1,
            title: 'Mobile Ecosystem & Profile App',
            subtitle: 'Setup toolchain, Dart Sound Null Safety & Hot Reload',
            builder: () => const ProfileScreen(),
          ),
          const SizedBox(height: 12),

          // Modul 02
          _buildModuleCard(
            moduleNumber: 2,
            title: 'Declarative UI & Responsive Dashboard',
            subtitle: 'BoxConstraints, LayoutBuilder 1 vs 2 Kolom, Material 3',
            builder: () => const AcademicDashboardScreen(),
          ),
          const SizedBox(height: 12),

          // Modul 03
          _buildModuleCard(
            moduleNumber: 3,
            title: 'Navigation & State Management',
            subtitle: 'GoRouter & Riverpod StateNotifier (KRS App)',
            builder: () => const Modul03App(),
          ),
          const SizedBox(height: 12),

          // Modul 04
          _buildModuleCard(
            moduleNumber: 4,
            title: 'Networking & REST API',
            subtitle: 'Dio Client, Repository Pattern & 4-State UI',
            builder: () => const Modul04App(),
          ),
          const SizedBox(height: 12),

          // Modul 05 (Locked)
          _buildModuleCard(
            moduleNumber: 5,
            title: 'Local Storage & Offline-First Strategy',
            subtitle: 'SharedPreferences, Hive / SQLite, Secure Storage',
            builder: () => const SizedBox.shrink(),
          ),
          const SizedBox(height: 12),

          // Modul 06 (Locked)
          _buildModuleCard(
            moduleNumber: 6,
            title: 'Authentication, Security & FCM',
            subtitle: 'JWT lifecycle, token refresh, dan push notification',
            builder: () => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard({
    required int moduleNumber,
    required String title,
    required String subtitle,
    required Widget Function() builder,
  }) {
    final unlocked = _isModuleUnlocked(moduleNumber);

    if (unlocked) {
      return _ModuleCard(
        moduleNumber: moduleNumber,
        title: title,
        subtitle: subtitle,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => builder()),
          );
        },
      );
    } else {
      return _LockedModuleCard(
        moduleNumber: moduleNumber,
        title: title,
        subtitle: subtitle,
        onTap: () => _showUnlockDialog(context, moduleNumber, title),
      );
    }
  }
}

class _ModuleCard extends StatelessWidget {
  final int moduleNumber;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ModuleCard({
    required this.moduleNumber,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF0284C7),
          foregroundColor: Colors.white,
          child: Text('#$moduleNumber', style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class _LockedModuleCard extends StatelessWidget {
  final int moduleNumber;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _LockedModuleCard({
    required this.moduleNumber,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF1F5F9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF94A3B8),
          foregroundColor: Colors.white,
          child: Text('#$moduleNumber'),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
        ),
        subtitle: Text(
          'Terkunci • Menunggu sesi perkuliahan Minggu ke-$moduleNumber',
          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
        ),
        trailing: const Icon(Icons.lock_rounded, color: Color(0xFF94A3B8)),
        onTap: onTap,
      ),
    );
  }
}
