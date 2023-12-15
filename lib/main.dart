import 'package:assign_8/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProductManagementApp());
}

class ProductManagementApp extends StatelessWidget {
  ProductManagementApp({super.key});

  final colorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 72, 134, 78),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.primaryContainer,
        ),
        textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
          displayMedium: GoogleFonts.ubuntuCondensed(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: ProductHomeScreen(),
    );
  }
}
