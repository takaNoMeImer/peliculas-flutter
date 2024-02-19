import 'package:flutter/material.dart';

// Simple configuracion del Tema
class AppTheme {

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF2862F5)
  );
  
}