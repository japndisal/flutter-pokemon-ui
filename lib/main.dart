import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/services/database_service.dart';
import 'package:pokemon/services/http_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupServices();
  runApp(const MyApp());
}

Future<void> _setupServices() async {
  GetIt.instance.registerSingleton<HTTPService>(
    HTTPService(),
  );
  GetIt.instance.registerSingleton<DatabaseService>(
    DatabaseService(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF7BC47F),
          ),
          scaffoldBackgroundColor: const Color(0xFFF6F8F6),
          textTheme: baseTextTheme.copyWith(
            displaySmall: GoogleFonts.poppins(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF101828),
            ),
            headlineSmall: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF101828),
            ),
            titleLarge: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF101828),
            ),
            titleMedium: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF101828),
            ),
            bodyLarge: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF344054),
            ),
            bodyMedium: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF667085),
            ),
            bodySmall: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF667085),
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
