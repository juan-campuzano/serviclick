import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serviclick/app.dart';
import 'package:clarity_flutter/clarity_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Cambiar barra de estado y navegación a fondo claro con íconos oscuros
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Fondo de la barra de estado
      statusBarIconBrightness: Brightness.dark, // Íconos oscuros
      statusBarBrightness: Brightness.light, // Solo iOS
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  final config = ClarityConfig(
      projectId: "s2iv5lwvts",
      logLevel: LogLevel
          .Verbose // Note: Use "LogLevel.Verbose" value while testing to debug initialization issues.
      );

  runApp(ClarityWidget(
    app: const App(),
    clarityConfig: config,
  ));
}
