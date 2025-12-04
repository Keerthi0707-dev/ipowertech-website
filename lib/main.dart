import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Generated automatically by FlutterFire CLI
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'widgets/navbar.dart';
import 'widgets/footer.dart';
import 'theme/app_colors.dart';

Future<void> main() async {
  // ✅ Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const IpowerTechApp());
}

class IpowerTechApp extends StatelessWidget {
  const IpowerTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Power Tech Generator Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        ),
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // ✅ List of pages
  final List<Widget> _pages = [
    const HomePage(),
    const ServicesPage(),
    const AboutPage(),
    const ContactPage(),
  ];

  void _onNavSelect(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ✅ Top Navigation Bar
          NavBar(onItemSelected: _onNavSelect, selectedIndex: _selectedIndex),

          // ✅ Page Content
          Expanded(child: _pages[_selectedIndex]),

          // ✅ Bottom Footer
          const Footer(),
        ],
      ),
    );
  }
}
