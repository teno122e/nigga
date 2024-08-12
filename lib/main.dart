import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'app_settings.dart';
import 'splash_screen.dart';  // Assuming you have a SplashScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppSettings>(
      create: (context) => AppSettings(),
      child: Consumer<AppSettings>(
        builder: (context, settings, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Disable the debug banner
            locale: settings.locale ?? const Locale('en'), // Default to English if locale is null
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              // Add your custom delegate here if needed
            ],
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: settings.isDarkTheme ? Brightness.dark : Brightness.light,
              textTheme: TextTheme(
                bodyMedium: TextStyle(fontSize: settings.fontSize ?? 16.0), // Default font size
              ),
            ),
            home: const SplashScreen(), // Assuming SplashScreen is a valid widget
          );
        },
      ),
    );
  }
}
