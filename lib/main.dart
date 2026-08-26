import 'package:flutter/material.dart';
import 'modul_01/profile_screen.dart';
import 'modul_02/academic_dashboard_screen.dart';

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

class ModuleLauncherScreen extends StatelessWidget {
  const ModuleLauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          _ModuleCard(
            moduleNumber: 1,
            title: 'Mobile Ecosystem & Profile App',
            subtitle: 'Setup toolchain, Dart Sound Null Safety & Hot Reload',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(height: 12),
          _ModuleCard(
            moduleNumber: 2,
            title: 'Declarative UI & Responsive Dashboard',
            subtitle: 'BoxConstraints, LayoutBuilder 1 vs 2 Kolom, Material 3',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AcademicDashboardScreen()),
              );
            },
          ),
          const SizedBox(height: 12),
          const _LockedModuleCard(
            moduleNumber: 3,
            title: 'Navigation & State Management',
            subtitle: 'GoRouter & Riverpod StateNotifier',
          ),
        ],
      ),
    );
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

  const _LockedModuleCard({
    required this.moduleNumber,
    required this.title,
    required this.subtitle,
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
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
        subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
        trailing: const Icon(Icons.lock_rounded, color: Color(0xFF94A3B8)),
      ),
    );
  }
}
